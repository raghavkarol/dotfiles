;;; Enable which function module
(which-function-mode 1)

(defun disable-auto-complete()
  (auto-complete-mode -1))

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
;;; Use the same keybinds as tmux to split windows
(global-set-key (kbd "C-x %") 'split-window-horizontally)
(global-set-key (kbd "C-x \"") 'split-window-vertically)
;;; Org-capture and org-mobile sync
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c C-p") 'org-mobile-push)
(global-set-key (kbd "C-c C-f") 'org-mobile-full)


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
(exec-path-from-shell-copy-env "PATH")
;; Disable Scroll Bars
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
(add-hook 'prog-mode-hook (lambda () (yafolding-mode)))
(add-hook 'yaml-mode-hook (lambda () (yafolding-mode)))

(global-display-line-numbers-mode)
(setq magit-last-seen-setup-instructions "1.4.0")

;;; Global undo tree mode
(global-undo-tree-mode 1)

;;;
;;; Emamux utility functions
;;;
 (defun emamux-get-line ()
  "Get the current line of text"
  (cond ((region-active-p)
         (buffer-substring-no-properties
          (region-beginning)
          (point)))
        (t
         (buffer-substring-no-properties
          (save-excursion (beginning-of-line) (point))
          (point)))))

(defun emamux-get-sexp ()
  "Get the current sexp or selected region of text"
  (cond ((region-active-p)
         (buffer-substring-no-properties
          (region-beginning)
          (point)))
        (t
         (buffer-substring-no-properties
          (save-excursion (backward-sexp) (point))
          (point)))))

(defvar *emamux-last-line*)

(defun emamux-tmux-run-line (&optional line)
  "Run a line of text as returned in the currently connected tmux session"
  (interactive)
  (when (not line)
    (setq line (emamux-get-line)))
  (setq *emamux-last-line* line)
  (emamux:send-command line))

(defun emamux-tmux-run-last()
  "Run a line of text as returned in the currently connected tmux session"
  (interactive)
  (emamux:send-command *emamux-last-line*))

(defun emamux-tmux-run-sexp ()
  "Run a line of text as returned in the currently connected tmux session"
  (interactive)
  (emamux:send-command (emamux-get-sexp)))

(defun emamux-change-session (p)
  "Change the session to the input argument"
  (interactive "MSession: ")
  (setq emamux:session p))

(defun emamux-change-window (p)
  (interactive "NWindow: ")
  (setq emamux:window p))

(defun emamux-change-pane (p)
  (interactive "NPane: ")
  (setq emamux:pane p))

(defun emamux-tmux-drop-connection ()
  "Drop the connection to the existing tmux session "
  (interactive)
  (emamux-change-session 'nil)
  (emamux-change-window 'nil)
  (emamux-change-pane 'nil))

(defmacro my-insert (code)
  "Evalue code and insert the result at the point"
  `(insert (format "%s", code)))
