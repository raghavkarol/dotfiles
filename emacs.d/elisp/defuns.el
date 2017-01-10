(defvar my-load-path "~/github/dotfiles/emacs.d/elisp/")
(defun my-load(filename)
  (load (concat my-load-path (symbol-name filename))))

(defun delete-trailing-blank-lines ()
  "Deletes All Blank Lines At The End Of The File."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (revert-buffer t t))

;; -----------------------------------------------------------------------------
;; Watch functions for running ct testcases
;; -----------------------------------------------------------------------------
(defun erl-eval (expr)
  (erl-eval-expression erl-nodename-cache expr))

(defun erl-compile-reload-buffer ()
  (interactive)
  (erl-eval (format "user_action:compile_and_reload(\"%s\")." (buffer-file-name))))

(defun erl-compile-reload-changed ()
  (interactive)
  (erl-eval (format "user_action:compile_and_reload_all_changes().")))

(defun erl-compile-buffer ()
  (interactive)
  (erl-eval (format "user_action:compile(\"%s\")." (buffer-file-name))))

(defun erl-compile-changed ()
  (interactive)
  (erl-eval (format "user_action:compile_all_changes().")))


(defun erl-run-testcase ()
  (interactive)
  (erl-run-testcase-with-options "[]"))

(defun erl-run-testcase-nocompile ()
  (interactive)
  (erl-run-testcase-with-options "[no_compile]"))

(defun erl-run-testcase-repeat()
  (interactive)
  (erl-eval "user_action:test()."))

(defun erl-run-suite ()
  (interactive)
  (let ((file-name (buffer-file-name))
        (module-name (erlang-module-name)))
    (cond ((string-match "_SUITE$" module-name)
           (erl-eval (format "user_action:test(ct, \"%s\")." file-name)))
          ('t
           (erl-eval (format "user_action:test(eunit, \"%s\")." file-name))))))

(defun erl-run-testcase-with-options (test-options)
  (let ((function-name (erlang-function-name))
        (file-name (buffer-file-name))
        (module-name (erlang-module-name)))
    (cond ((string-match "_SUITE$" module-name)
           (erl-eval
            (format "user_action:test(ct, \"%s\", %s, %s)."
                    file-name function-name test-options)))
          ((string-match "_test_?$" function-name)
           (erl-eval (format "user_action:test(eunit, \"%s\", %s, %s)."
                             file-name function-name test-options)))
          ('t
           (erl-eval (format "user_action:test(eqc, \"%s\", %s, %s)."
                             file-name function-name test-options))))))

(defun erlang-function-name()
  (save-excursion
    (beginning-of-defun)
    (mark-sexp)
    (let ((func-name
           (buffer-substring-no-properties (mark) (point))))
      (pop-mark)
      func-name)))

(defun erlang-module-name ()
  (file-name-base (buffer-file-name)))

;; watchmedo shell-command --patterns='*_flag' --wait --command="./rebar skip_deps=true compile && make dialyzer-quick && cat dialyzer_unhandled_warnings && echo '==> riak_kv (dialyzer) DONE' "
(defun erl-run-dialyzer()
  (interactive)
  (call-process "touch" nil nil nil
                "/Users/raghav/github/riak_ee/deps/riak_kv/dialyzer_watch_flag"))

(defun erl-kill-dialyzer()
  (interactive)
  (call-process "pkill" nil nil nil "make"))

;; -----------------------------------------------------------------------------
;; Set transparency of emacs
;; -----------------------------------------------------------------------------
 (defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

;; -----------------------------------------------------------------------------
;; S3 API
;; -----------------------------------------------------------------------------;;
;;; watchmedo shell-command --patterns='*_flag' --wait --command='do_cmd ${watch_src_path}'
(defun s3-api-tests-gradle-build ()
  (interactive)
  (let ((default-directory "~/github/s3-api-tests"))
    (shell-command-to-string "echo 'gradle build' > run_flag")))

;; Elscreen re-ordering
(defun seq-missing (list)
    (cl-set-difference
     (number-sequence (seq-min list) (seq-max list))
     list))

(defun elscreen-screen-0-index-org ()
  (interactive)
  (if (eq 0 (helm-elscreen-find-file "~/org/index.org"))
      (elscreen-toggle)
    (progn (elscreen-goto 0)
           (elscreen-swap)
           (elscreen-toggle))))

(defun elscreen-reorder-last ()
  (interactive)
  (let ((screen-max-index (seq-max (elscreen-get-screen-list)))
        (screen-missing (car (seq-missing (elscreen-get-screen-list)))))
    (when screen-missing
      (elscreen-goto screen-max-index)
      (elscreen-create)
      (elscreen-goto screen-missing)
      (elscreen-swap)
      (elscreen-kill screen-max-index)
      (elscreen-toggle)
      (message "elscreen swapped %s %s" screen-max-index screen-missing))))