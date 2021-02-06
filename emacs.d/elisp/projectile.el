;;; Remove helm projective keybinding

;; (defun projectile-key-bindings()
;;   (local-set-key (kbd "M-s") 'helm-projectile-ag))

;; (add-hook 'projectile-mode-hook 'projectile-key-bindings)

(setq projectile-completion-system 'ivy)
