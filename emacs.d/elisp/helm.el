;; -----------------------------------------------------------------------------
;; helm-mode configuration
;; -----------------------------------------------------------------------------
;; Changed helm-ag.el
(require 'helm-ag)
(defun helm-ag--action-find-file (candidate)
  (helm-ag--find-file-action candidate 'elscreen-find-file (helm-ag--search-this-file-p)))

;;; Copied from
;; https://github.com/lewang/Emacs-helm/blob/master/helm-elscreen.el
(defun helm-elscreen-find-file (file)
  (helm-require-or-error 'elscreen 'helm-elscreen-find-file)
  (elscreen-find-file file))

(require 'helm-config)
(helm-mode 1)                           ; Enable helm globally
(global-set-key (kbd "M-o") 'helm-projectile)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-mini) ; override iswitchb
(global-set-key (kbd "C-o") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-mini)   ;
(helm-autoresize-mode)
