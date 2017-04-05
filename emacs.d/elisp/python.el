;; -----------------------------------------------------------------------------
;; Python
;; -----------------------------------------------------------------------------
;; Info lookup for python
;; https://bitbucket.org/jonwaltman/pydoc-info/downloads/python.info.gz
;; Copy python.info file to .../share/info folder
(require 'info-look)
(info-lookup-add-help
 :mode 'python-mode
 :regexp "[[:alnum:]_]+"
 :doc-spec
 '(("(python)Index" nil "")))

;; Jedi
(defun customize-jedi-python-hook ()
  (jedi:setup)
  (jedi:ac-setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker))

(add-hook 'python-mode-hook 'customize-jedi-python-hook)
(add-hook 'python-mode-hook 'projectile-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
