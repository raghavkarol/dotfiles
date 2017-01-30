;; -----------------------------------------------------------------------------
;; Erlang Mode
;; -----------------------------------------------------------------------------
;; Hook Definitions
(defun erlang-key-bindings()
  (local-set-key (kbd "C-x c") 'show-compilation-window)
  (local-set-key (kbd "C-x e") 'erlang-run-suite)
  (local-set-key (kbd "C-x C-e") 'erlang-run-testcase)
  (local-set-key (kbd "C-x C-r") 'erlang-repeat-testcase)
  (local-set-key (kbd "C-M-x") 'erl-compile-reload-buffer)
  (local-set-key (kbd "C-c .") 'erl-find-source-under-point)
  (local-set-key (kbd "C-c ,") 'erl-find-source-unwind))

(defun erlang-editing-hook()
  (imenu-add-to-menubar "imenu")
  (local-set-key [return] 'newline-and-indent))

;; Erlang runtime customization

;; Erlang R16
(setq erlang-home "/Users/raghav/erlang/R16B02/")
(setq erlang-tools-lib "lib/tools-2.6.12/emacs/")
(setq eqc-tools-lib "lib/eqc-1.36.1/emacs/")

(setq erlang-emacs-load-path (concat erlang-home erlang-tools-lib))
(setq erlang-root-dir erlang-home)
(setq erlang-electric-commands nil)
(add-to-list 'load-path erlang-emacs-load-path)
(add-to-list 'exec-path (concat erlang-home "bin"))

(require 'erlang-start)

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

;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path (concat erlang-home eqc-tools-lib))
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "/usr/local/Cellar/erlang-r18/18.3.4/lib/erlang/lib/eqc-1.38.3")
;; EQC Emacs Mode -- Configuration End

(defun show-compilation-window ()
  (interactive)
  (display-buffer "*compilation*"))

(setq erlang-node-name nil)

(defun erlang-run-testcase ()
  (interactive)
  (erlang-run-lambda 'erl-run-testcase))

(defun erlang-repeat-last-testcase ()
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
    (funcall fun))

(defun is-riak_ee_release (node)
  (string-match "dev[1-9]" node))

(defun erlang-flush-compilation ()
  (erlang-flush-compilation-errors-node erlang-node-name))

(defun erlang-start-node (node)
  (let ((buffer
         (make-comint node "/usr/local/bin/zsh" nil "--login"))
        (node-home
         (cond ((is-riak_ee_release node)
                (format "~/github/riak_ee/" node))
               ('t
                (format "~/github/riak_ee/deps/%s" node))))
        (node-start-cmd
         (cond ((is-riak_ee_release node)
                (format "rlwrap dev/%s/bin/riak console -- dev" node))
               ('t
                (format "rlwrap erl -setcookie riak -name %s@127.0.0.1 -- dev" node)))))
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
             '("\\*compilation\\*"
               (display-buffer-reuse-window)
               (reusable-frames . visible)
               (window-height   . 0.3)))
(add-to-list 'display-buffer-alist
             '("\\*riak_kv\\*"
               (display-buffer-reuse-window)
               (reusable-frames . visible)
               (window-height   . 0.3)))
(add-to-list 'display-buffer-alist
             '("\\*riak_s3_api\\*"
               (display-buffer-reuse-window)
               (reusable-frames . visible)
               (window-height   . 0.3)))
(add-to-list 'display-buffer-alist
             '("\\*dev[1-9]\\*"
               (display-buffer-reuse-window)
               (reusable-frames . visible)
               (window-height   . 0.3)))
