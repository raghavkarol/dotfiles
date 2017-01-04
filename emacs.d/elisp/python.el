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
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (setq jedi:server-command
        (list "/usr/local/bin/python" jedi:server-script))
  ;; (define-key python-mode-map (kbd "RET") 'newline-and-indent)
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker))

(add-hook 'python-mode-hook 'customize-jedi-python-hook)
(add-hook 'python-mode-hook 'projectile-mode)
(add-hook 'inferior-python-mode-hook
          (lambda () (auto-complete-mode)))
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(setq venv-location '("~/raghav/venv"))
