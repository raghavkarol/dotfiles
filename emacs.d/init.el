;; Path for global settings file
(setq custom-file "~/.emacs.d/elisp/custom.el")
(load custom-file 'noerror)
(load "~/.emacs.d/elisp/defuns" 'noerror)

(require 'package)

(add-to-list
 'package-archives
 '("melpa-stable" . "http://stable.melpa.org/packages/")
 t)
;; ;; For org-roam-ui
;; (add-to-list
;;  'package-archives
;;  '("melpa" . "http://melpa.org/packages/")
;;  t)

(package-initialize) ; Added by package.el, don't delete, comment out instead

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq reload-packages 't)
(when reload-packages
  (my-load 'packages))

;; terminal/window mode
(when (not (boundp 'terminal-mode))
  (setq terminal-mode nil))
(setq window-mode (not terminal-mode))

;; Disabled plugins
(when nil
  (my-load 'airtame-device)
  (my-load 'cmake)
  (my-load 'cpp)
  (my-load 'gerrit)
  (my-load 'haskell)
  (my-load 'react)
  (my-load 'ruby)
  (my-load 'speedbar))

(my-load 'ivy)
(my-load 'autopair)
(my-load 'erlang)
(my-load 'org)
(my-load 'yas)

(when window-mode
  (my-load 'go)
  (my-load 'compilation)
  (my-load 'dired)
  (my-load 'elscreen)
  (my-load 'elscreen-sessions)
  (my-load 'expand-region)
  (my-load 'flycheck)
  (my-load 'js2-mode)
  (my-load 'mc)
  (my-load 'projectile)
  (my-load 'python)
  (my-load 'slime)
  (my-load 'sql)
  (my-load 'tramp)
  (my-load 'web)
  (my-load 'org-roam))

(my-load 'global)

;; Load saved sessions
(when window-mode
  (when (file-exists-p my-current-session)
      (add-to-list 'kill-emacs-hook (lambda () (save-session)))
      (switch-session (my-current-session-name))))
(when window-mode (server-start))

;; Reload theme, switch-session does not restore all colors in the
;; session correctly
(load-theme 'zenburn)

(setq global-auto-complete-mode nil)

;;; Bug in emacs 28.2, Fixed in master branch
;;
;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=59081
;;
;; See https://emacs.stackexchange.com/questions/74289/emacs-28-2-error-in-macos-ventura-image-type-invalid-image-type-svg
;;
(setq image-types (cons 'svg image-types))
