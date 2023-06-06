;; Packages
(use-package auto-complete
  :ensure t)
(use-package autopair
  :ensure t)
(use-package elscreen
 :ensure t)
(use-package paredit
  :ensure t)
(use-package exec-path-from-shell
  :ensure t)
(use-package expand-region
  :ensure t)
(use-package js2-mode
  :ensure t)
(use-package multiple-cursors
  :ensure t)
(use-package projectile
  :ensure t)
(use-package virtualenvwrapper
  :ensure t)
(use-package enh-ruby-mode
  :ensure t)
(use-package slime
  :ensure t)
(use-package ac-slime
  :ensure t)
(use-package yasnippet
  :ensure t)
(use-package web-mode
  :ensure t)
(use-package magit
  :ensure t)
(use-package eww
  :ensure t)
(use-package python-mode
  :ensure t)
(use-package go-mode
  :ensure t)
(use-package go-guru
  :ensure t)
(use-package gorepl-mode
  :ensure t)
(use-package go-dlv
  :ensure t)
(use-package yaml-mode
  :ensure t)
(use-package cmake-mode
  :ensure t )
(use-package flycheck
  :ensure t)
(use-package cmake-ide
  :ensure t)
(use-package jedi-core
  :ensure t)
(use-package company-jedi
  :ensure t)
(use-package company
  :ensure t)
(use-package company-go
  :ensure t)
(use-package groovy-mode
  :ensure t)
(use-package rjsx-mode
  :ensure t)
(use-package json-mode
  :ensure t)
(use-package skewer-mode
  :ensure t)
(use-package js2-refactor
  :ensure t)
(use-package xref-js2
  :ensure t)
(use-package docker-tramp
  :ensure t)
(use-package magit-gerrit
  :ensure t)
(use-package nginx-mode
  :ensure t)
(use-package company-nginx
  :ensure t)
(use-package elixir-mode
  :ensure t)
(use-package alchemist
  :ensure t)
(use-package string-inflection
  :ensure t)
(use-package ag
  :ensure t)
(use-package counsel
  :ensure t)
(use-package ivy
  :ensure t)

(use-package terraform-mode
  :ensure t)
(use-package ansible
  :ensure t)
(use-package company-ansible
  :ensure t)
(use-package dash-at-point
  :ensure t)
(use-package graphviz-dot-mode
  :ensure t)
(use-package wgrep
  :ensure t)

(use-package ivy
  :ensure t)
(use-package undo-tree
  :ensure t)

;; Themes
(use-package zenburn-theme
  :ensure t)
(use-package base16-theme
  :ensure t)

;; org-roam
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/org/roam")
  (org-roam-completion-everywhere 't)
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
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
