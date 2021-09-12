;; -----------------------------------------------------------------------------
;; Python
;; -----------------------------------------------------------------------------
;; Info lookup for python
;; https://bitbucket.org/jonwaltman/pydoc-info/downloads/python.info.gz
;; Copy python.info file to .../share/info folder
(require 'python)
(require 'info-look)
(info-lookup-add-help
 :mode 'python-mode
 :regexp "[[:alnum:]_]+"
 :doc-spec
 '(("(python)Index" nil "")))

;; ;; Start a shell - python-mode virtualenv-activate function requires a shell
;; (shell)

;;; Jedi Customization
(defun jedi-python-hook ()
  (add-to-list 'company-backends 'company-jedi)
  (company-mode)
  (jedi:setup)
  (setq jedi:setup-keys t)
  (setq jedi:complete-on-dot t)
  (local-set-key (kbd "M-.") 'jedi:goto-definition)
  (local-set-key (kbd "M-,") 'jedi:goto-definition-pop-marker))

;;; Hooks
(add-hook 'python-mode-hook 'projectile-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)
(add-hook 'python-mode-hook 'jedi-python-hook)
(add-hook 'python-mode-hook 'idle-highlight-mode)
(add-hook 'python-mode-hook 'flycheck-mode)

(define-key python-mode-map (kbd "C-j") 'emamux-tmux-run-line)
(define-key python-mode-map (kbd "C-M-x") 'emamux-tmux-run-sexp)
