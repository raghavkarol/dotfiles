;; -----------------------------------------------------------------------------
;; Ruby Mode
;; -----------------------------------------------------------------------------
(add-hook 'ruby-mode-hook 'projectile-mode)
(add-hook 'ruby-mode-hook 'enh-ruby-mode)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'enh-ruby-mode-hook 'auto-complete-mode)
(add-hook 'enh-ruby-mode-hook 'yas-minor-mode)
(add-hook 'enh-ruby-mode-hook 'ac-sql-issuu)

(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
;; installed rvm.el and using global ruby version
