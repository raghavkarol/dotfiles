(setq custom-file "~/.emacs.d/elisp/custom.el")
(load custom-file 'noerror)

(load "~/.emacs.d/elisp/defuns" 'noerror)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize) ; Added by package.el, don't delete, comment out instead

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(my-load 'packages)
(my-load 'projectile)
;; (my-load 'rfringe)
(my-load 'autopair)
(my-load 'flymake)
(my-load 'elscreen)
(my-load 'elscreen-sessions)
(my-load 'erlang)
(my-load 'python)
(my-load 'auto-complete)
(my-load 'js2-mode)
(my-load 'org)
(my-load 'dired)
(my-load 'web)
(my-load 'ox-freemind)
(my-load 'ruby)
(my-load 'helm)
(my-load 'mc)
(my-load 'speedbar)
(my-load 'slime)
(my-load 'compilation)
(my-load 'sql)
(my-load 'expand-region)
(my-load 'yas)
(my-load 'global)


;;
(setq magit-last-seen-setup-instructions "1.4.0")

;; Load saved sessions
(when (file-exists-p my-current-session)
  (add-to-list 'kill-emacs-hook (lambda () (save-session)))
  (switch-session (my-current-session-name)))

;; Reload theme, switch-session does not restore all colors in the
;; session correctly
(load-theme 'base16-3024)
