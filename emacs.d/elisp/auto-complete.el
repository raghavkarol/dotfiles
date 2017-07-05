;; (add-to-list 'load-path "/Users/raghav/github/auto-complete-mysql")
;; (add-to-list 'load-path "/Users/raghav/github/auto-complete-clang")

(require 'auto-complete-config)
;; (require 'auto-complete-clang)
;; (require 'auto-complete-mysql)

(setq ac-ignore-case nil)
(ac-flyspell-workaround)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
(setq-default ac-sources
              '(;; ac-source-words-in-same-mode-buffers ; interferes with database completion too noisy in org buffers
                ac-source-abbrev
                ac-source-dictionary
                ;; ac-0-sql-watch-and-register-table-alias
                ;; ac-1-sql-schemas
                ;; ac-1-sql-functions
                ;; ac-1-sql-tables
                ;; ac-1-sql-columns
                ))

(add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
(add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
(add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
(add-hook 'css-mode-hook 'ac-css-mode-setup)
(add-hook 'auto-complete-mode-hook 'ac-common-setup)

;; (defun my-ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my--cc-mode-setup)

;; (global-auto-complete-mode t)
