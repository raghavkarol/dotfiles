(menu-bar-mode -1)
(with-current-buffer (get-buffer "*scratch*")
  (org-mode))

(setq inhibit-startup-message t)
(setq initial-scratch-message "* Emacs, at your service ... ")

(require 'package)
(package-initialize)
(require 'use-package)
(setq custom-file "~/.emacs.d/elisp/custom.el")
(load custom-file 'noerror)
(load "~/.emacs.d/elisp/defuns" 'noerror)

(require 'magit)
(my-load 'projectile)
(my-load 'helm)
(my-load 'yas)

(yas-minor-mode-on)
(global-set-key (kbd "C-@") 'magit-status)
(global-set-key (kbd "C-s") 'helm-projectile-ag)

(load-theme 'sanityinc-tomorrow-eighties)
