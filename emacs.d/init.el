;;
;; Emacs initialization file
;;
;; Copyright (C) Raghav Karol
;;

;; Package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize) ; Added by package.el, don't delete, comment out instead

;; Key bindings
;;
;; Remap Cmd to Meta
(setq mac-command-modifier 'meta)

;; Path for global settings file
(setq custom-file "~/.emacs.d/elisp/custom.el")
(load custom-file 'noerror)
(load "~/.emacs.d/elisp/defuns" 'noerror)

;; Initialize packages
(use-package ansi-color
    :hook (compilation-filter . ansi-color-compilation-filter))
(use-package ag
  :ensure t)
(use-package company
  :ensure t)
(use-package counsel
  :ensure t)
(use-package elscreen
 :ensure t)
(use-package emamux
  :ensure t)
(use-package exec-path-from-shell
  :ensure t)
(use-package expand-region
  :ensure t)
(use-package flycheck
  :ensure t)
(use-package graphviz-dot-mode
  :ensure t)
(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq enable-recursive-minibuffers t)
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-o") 'projectile-find-file)
  (global-set-key (kbd "M-o") 'counsel-switch-buffer)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  (ivy-mode 1))
(use-package json-mode
  :ensure t)
(use-package magit
  :ensure t)
(use-package markdown-mode
  :ensure t)
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/org/roam/")
  (org-roam-completion-everywhere 't)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind
  (("C-c n i" . org-roam-node-insert)
   ("C-c n f" . org-roam-node-find)
   ("C-c n l" . org-roam-buffer-toggle)
   :map org-mode-map
   ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))
(use-package org-roam-ui
  :ensure t
  :config
  (setq org-roam-ui-follow t
        org-roam-ui-open-on-start t
        org-roam-ui-update-on-save t
        org-roam-ui-sync-theme t))
(use-package paredit
  :ensure t)
(use-package projectile
  :ensure t
  :config
  (projectile-mode 't)
  (setq projectile-completion-system 'ivy))
(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)
  ;; Set correct Python interpreter
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))
(use-package string-inflection
  :ensure t)
(use-package undo-tree
  :ensure t)
(use-package web-mode
  :ensure t)
(use-package wgrep
  :ensure t)
(use-package toml-mode
  :ensure t)
(use-package yaml-mode
  :ensure t)
(use-package yasnippet
  :ensure t
  :custom
  (require 'yasnippet)
  (yas-reload-all))
(use-package yafolding
  :ensure t)
(use-package zenburn-theme
  :ensure t)

(my-load 'global)
(my-load 'elscreen)
(my-load 'elscreen-sessions)

(yas-global-mode)

;;; Python customizations
(defun python-mode-extras ()
  (yafolding-mode)
  (company-mode))

(defun emamux-pdb-continue ()
  "Command to continue a pytest case that stops in pdb

   When pyest is invokved with --pdb like
   pytest --pdbcls=IPython.terminal.debugger:Pdb ...

   Then it stops execution on an unhandled exception, use this
   function to send it the continue command from emacs"
  (interactive)
  (emamux:send-command "c")
  (insert " ")
  (delete-backward-char 1))


(add-hook 'python-mode-hook 'python-mode-extras)
(define-key python-mode-map (kbd "C-j") 'emamux-tmux-run-line)
(define-key python-mode-map (kbd "C-M-x") 'emamux-tmux-run-sexp)

(electric-pair-mode 't)

;; Use the key next to shift for ` and ~
;; iterm key mappings in Iterm2 General -> Profiles -> Key Mappings
;;  § -> `,  ± -> ~
;; emcas
(global-set-key (kbd "§") "`")
(global-set-key (kbd "±") "~")
