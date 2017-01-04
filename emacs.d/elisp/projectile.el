(defun projectile-key-bindings()
  (local-set-key (kbd "M-s") 'helm-projectile-ag))

(add-hook 'projectile-mode-hook 'projectile-key-bindings)
