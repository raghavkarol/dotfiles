;;; Formatting scss files with prettier

;; https://www.npmjs.com/package/tern-jsx
;; npm i -g tern
;; npm i -g tern-jsx
;; npm i -g eslint_d
;; customize flycheck-javascript-eslint-executable to eslint_d

;;; npm eslint_d
;; Why eslint_d:
; $ /usr/bin/time node_modules/.bin/eslint --fix src/components/DashboardManager/index.jsx
;; /Users/raghav/gerrit/frontend/src/components/DashboardManager/index.jsx
;;   813:11  error  'a' is assigned a value but never used  no-unused-vars

;;  1 problem (1 error, 0 warnings)

;;         2.92 real         2.67 user         0.20 sys
;; $ frontend git:(master) ✗ /usr/bin/time node_modules/.bin/eslint_d --fix src/components/DashboardManager/index.jsx
;; /Users/raghav/gerrit/frontend/src/components/DashboardManager/index.jsx
;;   813:11  error  'a' is assigned a value but never used  no-unused-vars

;;  1 problem (1 error, 0 warnings)

;;         0.56 real         0.05 user         0.01 sys

;;; xref-js2
;; (setq xref-show-xrefs-function 'helm-xref-show-xrefs)
;; (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
;; (define-key rjsx-mode-map (kbd "M-.") nil)
;; (define-key tern-mode-keymap (kbd "M-.") nil)
;; (define-key tern-mode-keymap (kbd "M-,") nil)
(defun eslint-fix ()
  "Format the current file with ESLint."
  (interactive)
  (if (executable-find "eslint_d")
      (progn (call-process "eslint_d" nil "*ESLint Errors*" nil "--fix" buffer-file-name)
             (revert-buffer t t t))
    (message "eslint_d not found.")))

;;; Formatting
(defun prettier-fix ()
  "Format the current file with prettier."
  (interactive)
  (if (executable-find "prettier")
      (progn (call-process "prettier" nil "*Prettier Errors*" nil "--write" buffer-file-name)
             (revert-buffer t t t))
    (message "prettier not found.")))

(defun prettier-stylelint-fix ()
  "Format scss files with prettier"
  (interactive)
  (if (executable-find "prettier-stylelint")
      (progn (call-process "prettier-stylelint" nil "*Prettier Stylelint Errors*" nil "--write" buffer-file-name)
             (revert-buffer t t t))
    (message "prettier-stylelint not found.")))

(defun rjsx-mode-customizations ()
  (setq js2-strict-trailing-comma-warning nil)
  (projectile-mode)
  (flycheck-mode)
  (js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  (set (make-local-variable 'company-backends) '((company-tern company-files company-dabbrev-code)))
  (tern-mode)
  (setq-local flycheck-javascript-eslint-executable "eslint_d")
  (company-mode)
  (define-key tern-mode-keymap (kbd "C-c C-r") nil)
  (add-hook 'after-save-hook 'eslint-fix  nil 'make-it-local)
  (add-hook 'after-save-hook 'prettier-fix  nil 'make-it-local))

(add-hook 'rjsx-mode-hook 'rjsx-mode-customizations)
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'rjsx-mode))

;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; (setq ac-js2-evaluate-calls t)

(defun scss-mode-customizatons ()
  (add-hook 'after-save-hook 'prettier-stylelint-fix nil 'make-it-local)
  (flycheck-mode)
  (company-mode))

(add-hook 'scss-mode-hook 'scss-mode-customizatons)
