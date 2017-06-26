(add-to-list 'display-buffer-alist
             '("\\*.+?\\*"
               (display-buffer-reuse-window)
               (reusable-frames . visible)
               (window-height   . 0.3)))

(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
(global-set-key (kbd "<f1>") 'magit-status)
(global-set-key (kbd "M-h") 'dash-at-point)

(global-set-key (kbd "C-M-r")  'compile)
(global-set-key (kbd "M-s")  'helm-do-ag)

(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(setq split-width-threshold nil)        ; For wide screens
(setq user-mail-address "raghav.karol@gmail.com")
(line-number-mode 1)
(column-number-mode 1)
(display-time)

;; mac keyboard customizations for emacs - override from ns-win.el a
(setq mac-command-modifier 'meta)       ; mac-command-modifier is cmd
(setq mac-function-modifier 'ctrl)      ; mac-function-modifer is fn
(setq mac-option-modifier 'meta)        ; mac-option-modifier is meta

;; White space cleanup on writing files
(add-hook 'write-file-hooks 'delete-trailing-blank-lines)
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(require 'org)
(setq initial-scratch-message "* -- ORG SCRATCH BUFFER -- ")
(setq initial-major-mode 'org-mode)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(exec-path-from-shell-copy-env "PYTHONPATH")
(exec-path-from-shell-copy-env "GOPATH")

;; Disable scroll bars
(when (>= emacs-major-version 25)
  (scroll-bar-mode -1)
  (horizontal-scroll-bar-mode -1))

;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Mark-Ring.html#Mark-Ring
(setq set-mark-command-repeat-pop 't)

(speedbar 't)
