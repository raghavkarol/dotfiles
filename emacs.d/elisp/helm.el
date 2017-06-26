;; -----------------------------------------------------------------------------
;; helm-mode configuration
;; -----------------------------------------------------------------------------
;; Changed helm-ag.el
(require 'helm-ag)
(defun helm-ag--action-find-file (candidate)
  (helm-ag--find-file-action candidate 'elscreen-find-file (helm-ag--search-this-file-p)))

;;; Copied from
;; --------------------------------------------------------------------------------
;; https://github.com/lewang/Emacs-helm/blob/master/helm-elscreen.el
;; ------------------------------------------------------------------------------
(defun helm-elscreen-find-file (file)
  (helm-require-or-error 'elscreen 'helm-elscreen-find-file)
  (elscreen-find-file file))

(defun helm-find-buffer-on-elscreen (candidate)
  "Open buffer in new screen, if marked buffers open all in elscreens."
  (helm-require-or-error 'elscreen 'helm-find-buffer-on-elscreen)
  (helm-aif (helm-marked-candidates)
      (dolist (i it)
        (let ((target-screen (elscreen-find-screen-by-buffer
                              (get-buffer i) 'create)))
          (elscreen-goto target-screen)))
    (let ((target-screen (elscreen-find-screen-by-buffer
                          (get-buffer candidate) 'create)))
      (elscreen-goto target-screen))))
;; ------------------------------------------------------------------------------

(require 'helm-config)
(helm-mode 1)                           ; Enable helm globally
(global-set-key (kbd "M-o") 'helm-projectile)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-mini) ; override iswitchb
(global-set-key (kbd "C-o") 'helm-mini)
(global-set-key (kbd "C-x b") 'helm-mini)   ;
(helm-autoresize-mode)
