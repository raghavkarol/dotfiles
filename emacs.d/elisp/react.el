;;; Formatting scss files with prettier

;;; Implemented in prettier-js-mode
;; (cd ~/gerrit/frontend/ ; ./node_modules/.bin/prettier --write './src/**/*.{js,jsx})

;; (cd ~/gerrit/frontend/ ; ./node_modules/.bin/prettier-stylelint --quiet --write <path | **/.scss>)
;; (cd ~/gerrit/frontend/ ; ./node_modules/.bin/eslint --format unix --ext .js --ext .jsx ./src)
(setq rjsx-mode-hook nil)

(defun rjsx-mode-customizations ()
  (setq js2-strict-trailing-comma-warning nil)
  (prettier-js-mode)
  (company-mode)
  (tern-mode))

(rjsx-mode-customizations)

(add-hook 'rjsx-mode-hook 'rjsx-mode-customizations)
