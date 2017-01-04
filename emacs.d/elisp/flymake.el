(require 'flymake)

(defun flymake-erlang-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file
          (file-relative-name temp-file
                              (file-name-directory buffer-file-name))))
    (list (concat "" "~/bin/flymake_erlang_script") (list local-file))))

(defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "~/bin/flymake_python_script" (list local-file))))

;; Disable flymake for html and xml files as this is handled by nxml mode.
(delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)
(delete '("\\.xml?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

(add-hook 'find-file-hook 'flymake-find-file-hook)
(add-to-list 'flymake-allowed-file-name-masks '("\\.erl\\'" flymake-erlang-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.py\\'"  flymake-pylint-init))
