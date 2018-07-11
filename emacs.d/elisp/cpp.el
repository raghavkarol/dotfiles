(defun local-keybindings()
  (local-set-key (kbd "M-.") 'rtags-find-symbol-at-point)
  (local-set-key (kbd "M-,") 'rtags-location-stack-back))

(add-hook 'c-mode-common-hook
          (lambda ()
            (require 'rtags)
            (cmake-ide-setup)

            (require 'company-rtags)
            (setq rtags-completions-enabled t)
            (eval-after-load 'company
              '(add-to-list
                'company-backends 'company-rtags))
            (setq rtags-autostart-diagnostics t)
            (rtags-enable-standard-keybindings)
            (company-mode)
            (local-keybindings)
            (projectile-mode)))
