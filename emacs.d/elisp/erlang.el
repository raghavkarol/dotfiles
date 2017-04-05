;; -----------------------------------------------------------------------------
;; Erlang Mode
;; -----------------------------------------------------------------------------
;; Hook Definitions
(defun erlang-key-bindings()
  (local-set-key (kbd "C-x c") 'show-compilation-window)
  (local-set-key (kbd "C-x e") 'erlang-run-suite)
  (local-set-key (kbd "C-x C-e") 'erlang-run-testcase)
  (local-set-key (kbd "C-x C-r") 'erlang-repeat-test)
  (local-set-key (kbd "C-M-x") 'erl-compile-reload-buffer)
  (local-set-key (kbd "C-c .") 'erl-find-source-under-point)
  (local-set-key (kbd "C-c ,") 'erl-find-source-unwind))

(defun erlang-editing-hook()
  (imenu-add-to-menubar "imenu")
  (local-set-key [return] 'newline-and-indent))

;; Erlang runtime customization

(setq erlang-home "/Users/raghav/erlang/16.2-basho10/")
;; (setq erlang-home "/Users/raghav/erlang/19.2/")
(setq erlang-root-dir erlang-home)

(defun erlang-get-current-version (lib)
  (car (file-expand-wildcards
        (format "%slib/%s" erlang-home lib))))

(add-to-list 'load-path (erlang-get-current-version "tools-*/emacs"))
(add-to-list 'exec-path (concat erlang-home "bin"))

(setq erlang-electric-commands nil)
(require 'erlang-start)

;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path (erlang-get-current-version "eqc-*/emacs"))
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir (erlang-get-current-version "eqc-*"))
;; EQC Emacs Mode -- Configuration End

;; Erlang hooks
(add-hook 'erlang-mode-hook 'erlang-key-bindings)
(add-hook 'erlang-mode-hook 'erlang-editing-hook)
(add-hook 'erlang-mode-hook 'projectile-mode)
(add-hook 'erlang-mode-hook 'yas-minor-mode)
(add-hook 'erlang-mode-hook 'linum-mode)

;; Distel
(add-to-list 'load-path "/Users/raghav/github/distel/elisp")
(require 'distel)
(distel-setup)


(defun show-compilation-window ()
  (interactive)
  (display-buffer "*compilation*"))

(setq erlang-node-name nil)

(defun erlang-run-testcase ()
  (interactive)
  (erlang-run-lambda 'erl-run-testcase))

(defun erlang-repeat-test ()
  (interactive)
  (erlang-run-lambda 'erl-run-testcase-repeat))

(defun erlang-run-suite ()
  (interactive)
  (erlang-run-lambda 'erl-run-suite))

(defun erlang-start (arg &optional input)
  (interactive "P\nsNode name: ")
  (setq erlang-node-name input)
  (erlang-start-node erlang-node-name))

(defun erlang-stop ()
  (interactive)
  (erlang-stop-node erlang-node-name))

(defun erlang-show ()
  (interactive)
  (erlang-show-node erlang-node-name))

(defun erlang-clear ()
  (interactive)
  (erlang-clear-output-node erlang-node-name))

(defun erlang-run-lambda (fun)
    (erlang-flush-compilation)
    (erlang-show)
    (erlang-clear)
    (funcall fun))

(defun erlang-flush-compilation ()
  (erlang-flush-compilation-errors-node erlang-node-name))

(defun erlang-node-home (node)
  (cond ((file-directory-p (format "~/github/%s" node))
         (format "~/github/%s" node))
        ((file-directory-p (format "~/github/riak_ee/deps/%s" node))
         (format "~/github/riak_ee/deps/%s" node))
        ((file-directory-p (format "~/github/riak_kv/deps/%s" node))
         (format "~/github/riak_kv/deps/%s" node))
        ((file-directory-p (format "~/github/riak_ee/dev/%s" node))
         (format "~/github/riak_ee/"))
        ('t (error (format "Could not find home directory for node %s" node)))))

(defun erlang-node-start-cmd (node)
  (cond ((string-match "dev[1-9]" node)
         (format "rlwrap dev/%s/bin/riak console -- dev" node))
        ('t
         ;; Use -noshell when running EQC tests
         (format "rlwrap erl -setcookie riak -name %s@127.0.0.1 -- dev" node))))

(defun erlang-start-node (node)
  (let* ((node-home (erlang-node-home node))
         (node-start-cmd (erlang-node-start-cmd node))
         (buffer (make-comint node "/usr/local/bin/zsh" nil "--login")))
    (with-current-buffer buffer
      (next-error-follow-minor-mode)
      (compilation-minor-mode 't))
    (display-buffer buffer)
    (comint-send-erlang-node node (format "cd %s && echo" node-home))
    (comint-send-erlang-node node node-start-cmd)))

(defun erlang-show-node (node)
  (let ((buffer-name (comint-to-buffer-name node)))
    (if (bufferp (get-buffer buffer-name))
        (display-buffer buffer-name)
      (message (format "no %s node running" node)))))

(defun erlang-stop-node (node)
  (let ((buffer-name (comint-to-buffer-name node)))
    (if (bufferp (get-buffer buffer-name))
        (comint-send-string (get-buffer-process buffer-name)
                        "q().\n")
      (message (format "no %s node running" node)))))

(defun erlang-clear-output-node (node)
  (with-current-buffer (comint-to-buffer-name node)
    (erase-buffer)))

(defun erlang-flush-compilation-errors-node (node)
  (with-current-buffer (comint-to-buffer-name node)
    (compilation-minor-mode 0)
    (compilation-minor-mode 1)))

(defun comint-to-buffer-name (node)
  (format "*%s*" node))

(defun comint-send-erlang-node (node cmd)
  (comint-send-string (get-buffer-process (comint-to-buffer-name node))
                      (format "%s\n" cmd)))

(defconst erlang-breadcrumb-buffer-name
  "*erlang-breadcrumbs*")

(defun get-current-line-text ()
  (buffer-substring-no-properties
   (line-beginning-position)
   (line-end-position)))

(defun erlang-breadmcrumbs-show ()
  (interactive)
  (display-buffer(get-buffer-create erlang-breadcrumb-buffer-name)))

(defun erlang-breadcrumbs-mark ()
  (interactive)
  (let ((filename (buffer-file-name))
        (line-number (line-number-at-pos))
        (line (get-current-line-text)))
    (with-current-buffer (get-buffer-create erlang-breadcrumb-buffer-name)
      (read-only-mode 0)
      (insert (format "%s:%s: %s\n" filename line-number line))
      (display-buffer (current-buffer))
      (grep-mode))))

(defun erlang-breadcrumbs-clear ()
  (interactive)
  (with-current-buffer (get-buffer-create erlang-breadcrumb-buffer-name)
    (read-only-mode 0)
    (erase-buffer)
    (grep-mode)))


(add-to-list 'display-buffer-alist
             '("\\*.+?\\*"
               (display-buffer-reuse-window)
               (reusable-frames . visible)
               (window-height   . 0.3)))
