(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(add-to-list 'display-buffer-alist
             '("\\*.+?\\*"
               (display-buffer-at-bottom)
               (reusable-frames . visible)
               (window-height   . 0.3)))

(add-to-list 'display-buffer-alist
             '("\\*helm ag results\\*"
               (display-buffer-at-bottom)
               (reusable-frames . visible)
               (window-height   . 0.3)))

(add-to-list 'display-buffer-alist
             '("\\*Gofmt Errors\\*"
               (display-buffer-at-bottom)
               (reusable-frames . visible)))

(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)
(global-set-key (kbd "<f1>") 'magit-status)
(global-set-key (kbd "M-h") 'dash-at-point)

(global-set-key (kbd "C-M-r")  'compile)
(global-set-key (kbd "M-s")  'helm-do-ag)

;;; Use the same keybinds as tmux to split windows
(global-set-key (kbd "C-x %") 'split-window-horizontally)
(global-set-key (kbd "C-x \"") 'split-window-vertically)


(setq inhibit-startup-message t)
(setq-default indent-tabs-mode nil)
(setq split-width-threshold nil)        ; For wide screens
(setq user-mail-address "raghav.karol@gmail.com")
(line-number-mode 1)
(column-number-mode 1)
(display-time)

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

;;; use 4 spaces for C/C++ indentation
(setq c-default-style "java"
      c-basic-offset 4)

(setq fill-column 100)

(add-hook 'emacs-lisp-mode-hook 'company-mode)

(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))

(speedbar 't)
(global-display-line-numbers-mode)
