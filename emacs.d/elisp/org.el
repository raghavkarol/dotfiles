(setq org-src-fontify-natively t)       ; syntax highlighting in code-blocks
(global-set-key (kbd "C-c c") 'org-capture)
(add-hook 'org-mode-hook 'ac-sql-issuu)
(add-hook 'org-mode-hook 'auto-complete-mode)
(add-hook 'org-mode-hook
          (lambda ()
            (org-set-local 'yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            ;; yasnippet (using the new org-cycle hooks)
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))
(add-hook 'org-mode-hook 'yas-minor-mode)
