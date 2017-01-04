;; -----------------------------------------------------------------------------
;; Erlang Mode
;; -----------------------------------------------------------------------------
;; Hook Definitions
(defun erlang-key-bindings()
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
(add-to-list 'load-path "/usr/local/share/distel/elisp")
(require 'distel)
(distel-setup)

;; EQC Emacs Mode -- Configuration Start
(add-to-list 'load-path (concat erlang-home eqc-tools-lib))
(autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
(add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
(setq eqc-max-menu-length 30)
(setq eqc-root-dir "/usr/local/Cellar/erlang-r18/18.3.4/lib/erlang/lib/eqc-1.38.3")
;; EQC Emacs Mode -- Configuration End
