;; Installed go-guru, gocode, godoc.
(add-hook 'go-mode-hook
          (lambda ()
            (projectile-mode)
            (add-hook 'before-save-hook 'gofmt-before-save)
            (local-set-key (kbd "M-.") 'go-guru-definition)
            (local-set-key (kbd "M-,") 'pop-tag-mark)))
