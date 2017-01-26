;; -----------------------------------------------------------------------------
;; Erlang Mode
;; -----------------------------------------------------------------------------
;; Hook Definitions
(defun erlang-key-bindings()
  (local-set-key (kbd "C-x e") 'erl-run-suite)
  (local-set-key (kbd "C-x C-e") 'erl-run-testcase)
  (local-set-key (kbd "C-x C-r") 'erl-run-testcase-repeat)
  (local-set-key (kbd "C-M-x") 'erl-compile-reload-buffer)
  (local-set-key (kbd "C-c .") 'erl-find-source-under-point)
  (local-set-key (kbd "C-c ,") 'erl-find-source-unwind))

(defun erlang-editing-hook()
  (imenu-add-to-menubar "imenu")
  (local-set-key [return] 'newline-and-indent))

;; (defun erlang-whitespace-cleanup-hook
;;   (add-hook 'local-write-file-hooks
;;             (save-excursion
;;               (delete-trailing-whitespace))))

;; Erlang runtime customization

;; Erlang R18
;; -
;; (setq erlang-home "/usr/local/Cellar/erlang-r18/18.3.4/")
;; (setq erlang-tools-lib "lib/erlang/lib/tools-2.8.3/emacs")
;; (setq eqc-tools-lib "lib/erlang/lib/eqc-1.38.3/emacs/")

;; Erlang R16
(setq erlang-home "/Users/raghav/erlang/R16B02/")
(setq erlang-tools-lib "lib/tools-2.6.12/emacs/")
(setq eqc-tools-lib "lib/eqc-1.36.1/emacs/")

(setq erlang-emacs-load-path (concat erlang-home erlang-tools-lib))
(add-to-list 'load-path erlang-emacs-load-path)
(setq erlang-root-dir erlang-home)
(add-to-list 'exec-path (concat erlang-home "bin"))
(setq erlang-electric-commands nil)
(require 'erlang-start)

;; Erlang hooks
(add-hook 'erlang-mode-hook 'erlang-key-bindings)
(add-hook 'erlang-mode-hook 'erlang-editing-hook)
(add-hook 'erlang-mode-hook 'projectile-mode)
(add-hook 'erlang-mode-hook 'yas-minor-mode)
(add-hook 'erlang-mode-hook (lambda () (linum-mode)))

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

;; comint erlang nodes
(defconst riak-kv "riak_kv")
(defconst riak-kv "riak_kv")
(defconst dev1 "dev1")

(defun erlang-start-riak-kv ()
  (interactive)
  (erlang-start-riak_ee-dep riak-kv))

(defun erlang-stop-riak-kv ()
  (interactive)
  (erlang-stop-node riak-kv))

(defun erlang-show-riak-kv-node ()
  (interactive)
  (erlang-show-node riak-kv))

(defun erlang-start-riak-s3-api ()
  (interactive)
  (erlang-start-riak_ee-dep riak-s3-api))

(defun erlang-stop-riak-s3-api ()
  (interactive)
  (erlang-stop-node riak-s3-api))

(defun erlang-show-riak-s3-api-node ()
  (interactive)
  (erlang-show-node riak-s3-api))

(defun erlang-start-dev1 ()
  (interactive)
  (erlang-start-dev dev1))

(defun erlang-show-dev1 ()
  (interactive)
  (erlang-show-node dev1))

(defun erlang-stop-dev1 ()
  (interactive)
  (erlang-stop-node dev1))

(defun erlang-start-dev (node)
  (let ((buffer
         (make-comint node "/usr/local/bin/zsh" nil "--login")))
    (display-buffer buffer)
    (comint-send-erlang-node node (format "cd ~/github/riak_ee && echo"))
    (comint-send-erlang-node node (format "dev/%s/bin/riak console -- dev" node)))) ;

(defun erlang-start-riak_ee-dep (node)
  (let ((buffer
         (make-comint node "/usr/local/bin/zsh" nil "--login")))
    (display-buffer buffer)
    (comint-send-erlang-node node (format "cd ~/github/riak_ee/deps/%s && echo" node))
    (comint-send-erlang-node node (format "rlwrap erl -setcookie riak -name %s@127.0.0.1 -- dev" node))))

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

(defun comint-to-buffer-name (node)
  (format "*%s*" node))

(defun comint-send-erlang-node (node cmd)
  (comint-send-string (get-buffer-process (comint-to-buffer-name node))
                      (format "%s\n" cmd)))

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
