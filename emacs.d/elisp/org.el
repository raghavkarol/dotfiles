;;; --------------------------------------------------------
;;; ORG
;;; --------------------------------------------------------
;;; Syntax highlighting in code-blocks
(setq org-src-fontify-natively t)

;;; Custom agenda commands
;;;
;;; Add more custom commands
;;; Eval for testing
;;; Save in ~/.emacs.d/elisp/custom.el org-agenda-custom-commands
(setq org-agenda-custom-commands
      '(("e" "Errands" todo "" ((org-agenda-files '("~/org/gtd/errands.org"))))
        ("f" "Focused" tags-todo "computer focused" )
        ("h" "Home" todo ""  ((org-agenda-files '("~/org/gtd/home.org"))))))

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas-next-field)))
(add-hook 'org-mode-hook 'yas-minor-mode)

;;; --------------------------------------------------------
;;; org-roam
;;; --------------------------------------------------------
(add-to-list
 'display-buffer-alist
 '("\\*org-roam\\*"
   (display-buffer-in-direction)
   (direction . right)
   (window-width . 0.33)
   (window-height . fit-window-to-buffer)))

;;; --------------------------------------------------------
;;; org-reveal (not available on MELPA/ELPA)
;;;
;;; Installation:
;;;
;;; (cd ~/github/raghavkarol &&
;;;   git clone https://github.com/yjwen/org-reveal.git)
;;; --------------------------------------------------------
;; (add-to-list 'load-path "~/github/raghavkarol/org-reveal")
;; (load-library "ox-reveal")
