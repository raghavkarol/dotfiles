;; -----------------------------------------------------------------------------
;; DIRED
;; -----------------------------------------------------------------------------
(setq ls-lisp-use-insert-directory-program t)      ;; use external ls
(setq insert-directory-program "/usr/local/bin/gls")
(add-hook 'dired-mode-hook (lambda () (local-set-key (kbd "M-o") 'helm-projectile)))
(add-hook 'dired-mode-hook (lambda () (local-set-key (kbd "C-o") 'helm-mini)))
