;; -----------------------------------------------------------------------------
;; Erlang Mode
;; -----------------------------------------------------------------------------
(defun erlang-get-current-version (erlang-home lib)
  (car (file-expand-wildcards
        (format "%slib/%s" erlang-home lib))))

(setq erlang-version  "21.3.8.4")
(setq erlang-home (format "/Users/%s/erlang/%s/" (user-real-login-name) erlang-version))
(setq erlang-root-dir erlang-home)

(add-to-list 'load-path (erlang-get-current-version erlang-home "tools-*/emacs"))
(add-to-list 'exec-path (concat erlang-home "bin"))
(require 'erlang-start)

(setq erlang-electric-commands nil)

;; EQC Emacs Mode -- Configuration Start
(setq eqc-installed nil)
(when eqc-installed
  (add-to-list 'load-path (erlang-get-current-version erlang-home "eqc-*/emacs"))
  (autoload 'eqc-erlang-mode-hook "eqc-ext" "EQC Mode" t)
  (add-hook 'erlang-mode-hook 'eqc-erlang-mode-hook)
  (setq eqc-max-menu-length 30)
  (setq eqc-root-dir (erlang-get-current-version erlang-home "eqc-*")))

(flycheck-define-checker erlang-edt-flycheck
  "An Erlang syntax checker using the edt  server."
  :command ("~/bin/flycheck_edt" (eval (buffer-file-name)))
  :error-parser flycheck-parse-with-patterns-without-color
  :error-patterns
  ((warning line-start
            (file-name) ":" line ": Warning:" (message) line-end)
   (error line-start
          (file-name) ":" line ": " (message) line-end))
  :modes erlang-mode
  :enabled flycheck-rebar3-project-root
  :predicate flycheck-buffer-saved-p
  :working-directory flycheck-rebar3-project-root)

(add-to-list 'flycheck-checkers 'erlang-edt-flycheck)

;; Erlang hooks
(add-hook 'erlang-mode-hook 'erlang-key-bindings)
(add-hook 'erlang-mode-hook 'erlang-editing-hook)
(add-hook 'erlang-mode-hook 'projectile-mode)
(add-hook 'erlang-mode-hook 'yas-minor-mode)
(add-hook 'erlang-mode-hook 'flycheck-mode)
(add-hook 'erlang-mode-hook 'idle-highlight-mode)

(add-hook 'after-save-hook 'erlfmt-after-save)

;; Distel

(require 'company)

(add-to-list 'load-path (format "/Users/%s/github/raghavkarol/distel/%s/elisp" (user-real-login-name) erlang-version))
(require 'distel)
(distel-setup)

(require 'company-distel)
(add-to-list 'company-backends 'company-distel)

;; Hook Definitions
(defun erlang-key-bindings()
  ;; (local-set-key (kbd "C-x c") 'show-compilation-window)
  (local-set-key (kbd "C-x e") 'erlang-run-suite)
  (local-set-key (kbd "C-x C-e") 'erlang-run-testcase)
  (local-set-key (kbd "C-x C-r") 'erlang-repeat-test)
  ;; (local-set-key (kbd "C-M-x") 'erl-compile-reload-changed)
  (local-set-key (kbd "C-c .") 'erl-find-source-under-point)
  (local-set-key (kbd "C-c ,") 'erl-find-source-unwind))

(defun erlang-editing-hook()
  (imenu-add-to-menubar "imenu")
  (local-set-key [return] 'newline-and-indent))

(defun show-compilation-window ()
  (interactive)
  (display-buffer "*compilation*"))

(setq erlang-node-name nil)

(defun erlang-run-testcase ()
  (interactive)
  (erlang-run-lambda 'erl-run-testcase))

(defun erlang-repeat-test ()
  (interactive)
  (erlang-run-lambda 'erl-run-testcase-repeat))

(defun erlang-run-suite ()
  (interactive)
  (erlang-run-lambda 'erl-run-suite))

(defun erlang-start (arg &optional input)
  (interactive "P\nsNode name: ")
  (setq erlang-node-name input)
  (erlang-start-node erlang-node-name))

(defun erlang-stop ()
  (interactive)
  (erlang-stop-node erlang-node-name))

(defun erlang-show ()
  (interactive)
  (erlang-show-node erlang-node-name))

(defun erlang-clear ()
  (interactive)
  (erlang-clear-output-node erlang-node-name))

(defun erlang-run-lambda (fun)
    (erlang-flush-compilation)
    (erlang-show)
    (erlang-clear)
    (funcall fun))

(defun erlang-flush-compilation ()
  (erlang-flush-compilation-errors-node erlang-node-name))

(defun erlang-basho-node-start-cmd (node)
  (cond ((string-match "dev[1-9]" node)
         (format "rlwrap dev/%s/bin/riak console -- dev" node))
        ('t
         ;; Use -noshell when running EQC tests
         (format "rlwrap erl -setcookie riak -name %s@127.0.0.1 -- dev" node))))

(defun erlang-alertlogic-node-start-cmd ()
  (format "~/bin/run_erl_node"))

(defun erlang-node-home (node)
  (let ((dir (format "~/github/alertlogic/%s" node)))
    (cond ((file-directory-p (format "~/github/alertlogic/%s" node)) dir)
          ('t (error (format "Could not find home directory for node %s" node))))))

(defun erlang-start-node (node)
  (let* ((node-home (erlang-node-home node))
         (node-start-cmd (erlang-alertlogic-node-start-cmd))
         (buffer (make-comint node "/bin/zsh" nil "--login")))
    (with-current-buffer buffer
      (next-error-follow-minor-mode)
      (compilation-minor-mode 't))
    (display-buffer buffer)
    (comint-send-erlang-node node (format "cd %s && echo" node-home))
    (comint-send-erlang-node node node-start-cmd)))

(defun erlang-show-node (node)
  (let ((buffer-name (comint-to-buffer-name node)))
    (if (bufferp (get-buffer buffer-name))
        (display-buffer buffer-name)
      (message (format "no %s node running" node)))))

(defun erlang-stop-node (node)
  (let ((buffer-name (comint-to-buffer-name node)))
    (if (bufferp (get-buffer buffer-name))
        (comint-send-string (get-buffer-process buffer-name)
                        "q().\n")
      (message (format "no %s node running" node)))))

(defun erlang-clear-output-node (node)
  (with-current-buffer (comint-to-buffer-name node)
    (erase-buffer)))

(defun erlang-flush-compilation-errors-node (node)
  (with-current-buffer (comint-to-buffer-name node)
    (compilation-minor-mode 0)
    (compilation-minor-mode 1)))

(defun comint-to-buffer-name (node)
  (format "*%s*" node))

(defun comint-send-erlang-node (node cmd)
  (comint-send-string (get-buffer-process (comint-to-buffer-name node))
                      (format "%s\n" cmd)))

(defconst erlang-breadcrumb-buffer-name
  "*erlang-breadcrumbs*")

(defun get-current-line-text ()
  (buffer-substring-no-properties
   (line-beginning-position)
   (line-end-position)))

(defun erlang-breadcrumbs-show ()
  (interactive)
  (display-buffer(get-buffer-create erlang-breadcrumb-buffer-name)))

(defun erlang-breadcrumbs-mark ()
  (interactive)
  (let ((filename (buffer-file-name))
        (line-number (line-number-at-pos))
        (line (get-current-line-text)))
    (with-current-buffer (get-buffer-create erlang-breadcrumb-buffer-name)
      (read-only-mode 0)
      (insert (format "%s:%s: %s\n" filename line-number line))
      (display-buffer (current-buffer))
      (grep-mode))))

(defun erlang-breadcrumbs-clear ()
  (interactive)
  (with-current-buffer (get-buffer-create erlang-breadcrumb-buffer-name)
    (read-only-mode 0)
    (erase-buffer)
    (grep-mode)))

(defun eww-other-window (url)
  (save-excursion
    (progn (eww url)
           (quit-window))))

(defun to-file-url (path)
 (format "file://%s" path))

(defun test-logs-dir ()
  (format "%s" "_build/test/logs"))

(defun erl-open-ct-suite-log ()
  (interactive)
  (let ((file (format "%s/%s" (test-logs-dir) "suite.log.latest.html")))
    (message (format "opening: %s" file))
    (eww-other-window (to-file-url file))))

(defun erl-open-ct-test-log ()
  (interactive)
  (let* ((test-name erl-run-testcase-current-function-name)
         (suite-name erl-run-testcase-current-module-name)
         (test-pattern (format "%s.%s" suite-name test-name))
         (test-files (sort (directory-files-recursively (test-logs-dir) test-pattern) 'string>))
         (latest-test-file (car test-files)))
    (message (format "opening: %s" latest-test-file))
    (eww-other-window (to-file-url latest-test-file))))

(defun erl-connect-node (_ node-name)
  "Connect to an erlang node

node-name is the name of the host without the hostname e.g., aefr_eng

The first argument to this function is prefix argument C-u but
and is not used.
"
  (interactive "P\ns node name: ")
  (setq erl-nodename-cache (intern (format "%s@%s" node-name (system-name))))
  (setq derl-cookie node-name))

;; -----------------------------------------------------------------------------
;; Watch functions for running ct testcases
;; -----------------------------------------------------------------------------
(defun erl-eval (expr)
  "Evalute an erlang expression using distel

Wrapper function to evaluate an erlang expression using distel."
  (erl-eval-expression erl-nodename-cache expr))

(setq erl-run-testcase-current-function-name nil)
(setq erl-run-testcase-current-module-name nil)

(defun erl-run-suite ()
  (interactive)
  (let ((file-name (buffer-file-name))
        (module-name (erlang-module-name)))
    (cond ((string-match "_SUITE$" module-name)
           (erl-eval (format "user_action:test(ct, \"%s\")." file-name)))
          ('t
           (erl-eval (format "user_action:test(eunit, \"%s\")." file-name))))))

(defun erl-run-testcase-with-options (test-options)
  ""
  (let ((function-name (erlang-function-name))
        (file-name (buffer-file-name)))
    (setq erl-run-testcase-current-function-name function-name)
    (setq erl-run-testcase-current-module-name module-name)
    (cond ((string-match "_SUITE$" module-name)
           (erl-eval
            (erl-eval (format "edt_api:run_test({ct, %s})." file-name))))
          ((string-match "_test_?$" function-name)
           (erl-eval (format "edt_api:run_test({eunit, %s})." file-name)))
          ('t
           (erl-eval (format "{error, %s}" file-name))))))


(defun erl-run-testcase ()
  (interactive)
  (erl-run-testcase-with-options "[]"))

;;; Find if current directory is test
(defun erlang-discover-test-dir (path)
  (let* ((dir (directory-file-name (file-name-directory path)))
         (maybe-test-dir (concat dir "/test")))
    (cond ((file-directory-p maybe-test-dir) maybe-test-dir)
          ((string-match "^/$" path) nil)
          ('t (erlang-discover-test-dir (file-name-directory dir))))))


(defun erl-run-all-ct-suites()
  (interactive)
  (let ((dir-name (erlang-discover-test-dir (buffer-file-name))))
    (erl-eval (format "user_action:test(ct, \"%s\")." dir-name))))

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

(defun erlfmt-after-save ()
  "Runs erfmt before saving a file "
  (interactive)
  (when (eq major-mode 'erlang-mode) (erlfmt)))

(defun erlfmt()
  "Run erlfmt"
  (interactive)
  (message "running erlfmt")
  (when (or (string-match-p "/edt/" (buffer-file-name))
            (string-match-p "/aecontent/" (buffer-file-name))
            (string-match-p "/aewatchdog/" (buffer-file-name))
            (string-match-p "/aeextend/" (buffer-file-name)))
    (shell-command (concat "rebar3 fmt --write " (buffer-file-name)) nil nil)
    (with-current-buffer (buffer-name)
      (revert-buffer nil t))))

;;; Tmux automatiion
(defun erl-emamux-tmux-run-line()
  "Add . suffix to a line and run in tmux"
  (interactive)
  (emamux:send-command
   (let ((line (emamux-get-line)))
     (setq line
           (cond ((string-suffix-p "," line) (string-remove-suffix "," line))
                 ((string-suffix-p "." line) (string-remove-suffix "." line))
                 (t line)))
     (concat line "."))))

(define-key erlang-mode-map (kbd "C-j") 'erl-emamux-tmux-run-line)

(defvar edt-docker-container
  nil
  "Docker container name running and erlang node with edt.")

;;; EDT helper functions
(defun edt-project-name ()
  "Returns the name of the current erlang project"
  (file-name-nondirectory (directory-file-name (flycheck-rebar3-project-root))))

(defun edt-docker-container-name ()
  (cond (edt-docker-container edt-docker-container)
        (t (edt-project-name))))

(defun edt-call-graph-buffer-name ()
  "Returns the name of the call-graph buffer for the current erlang project"
  (format "*Call Graph %s*" (edt-docker-container-name)))

(defun edt-call-summary-buffer-name ()
  "Returns the name of the call-summary buffer for the current erlang project"
  (format "*Call Summary %s*" (edt-docker-container-name)))

(defun erl-user-default-fun-p (funcall)
  (with-current-buffer (get-buffer "user_default.erl")
    (save-excursion
      (save-match-data
        (goto-char (point-min))
        (search-forward funcall nil t)))))

(defun erl-user-default-undo ()
  (interactive)
  (with-current-buffer (get-buffer "user_default.erl")
    (undo-tree-undo)
    (save-buffer)))

(defun erl-user-default-add-1 (funcall)
  "ONLY works for a singleuser_default.erl module"
  (let ((module (erlang-module-name)))
    (when (not (file-exists-p "user_default.erl"))
      (with-current-buffer (find-file-noselect "user_default.erl")
        (insert "%%\n")
        (insert "%% user_default module generated by emacs\n")
        (insert "%%\n")
        (insert "-module(user_default).\n")
        (insert "\n")
        (insert "-compile([export_all, nowarn_export_all]).\n")
        (insert "\n")
        (write-file "user_default.erl")))
    (with-current-buffer (find-file-noselect "user_default.erl")
      (save-excursion
        (goto-char (point-max))
        (insert "\n")
        (insert (format "%s ->\n    %s:%s." funcall module funcall))
        (save-buffer "user_default.erl")))))

(defun erl-user-default-add ()
  (interactive)
  (let ((funcall (buffer-substring-no-properties (point) (mark))))
    (erl-user-default-add-1 funcall)))

(defun erl-edt-profile-trace (mod func)
  (emamux:send-command (format "edt_profile:trace_opts([{%s, %s, #{capture => true}}], #{track_calls => true})." mod func)))

(defun erl-edt-trace ()
  "Enables edt_trace for the function selected in the region"
  (interactive)
  (let ((mod (erlang-module-name))
       (func (buffer-substring-no-properties (point) (mark))))
    (erl-edt-profile-trace mod func)))

(defun edt-command-in-buffer (cmd buffer-name)
  (let ((parent-buffer-container-name edt-docker-container)
        (buffer (get-buffer-create buffer-name)))
    (with-current-buffer buffer
      (read-only-mode 0)
      (erase-buffer)
      (shell-command cmd buffer)
      (erlang-mode)
      (yafolding-mode)
      (make-local-variable 'edt-docker-container) ;TODO: understand buffer local variables
      (setq edt-docker-container parent-buffer-container-name)
      (local-set-key "q" 'kill-buffer-and-window)
      (local-set-key "i" 'edt-stat-call)
      (local-set-key "g" 'edt-call-graph)
      (display-buffer-at-bottom buffer '((window-height . 30)))
      (read-only-mode 1))))

(defun edt-call-graph ()
  (interactive)
  (let* ((service (edt-docker-container-name))
         (cmd (format "docker exec %s curl -s http://localhost:65000/edt/trace/call_graph" service)))
    (edt-command-in-buffer cmd (edt-call-graph-buffer-name))))

(defun edt-call-summary ()
  (interactive)
  (let* ((service (edt-docker-container-name))
         (cmd (format "docker exec %s curl -s http://localhost:65000/edt/trace/summary" service)))
    (edt-command-in-buffer cmd (edt-call-summary-buffer-name))))

(defun edt-stat-call ()
  (interactive)
  (let* ((service (edt-docker-container-name))
         (beg-pos (save-excursion (beginning-of-line) (point)))
         (end-pos (save-excursion (end-of-line) (point)))
         (line (buffer-substring-no-properties beg-pos end-pos))
         (id (nth 2 (split-string line)))
         (cmd (format "docker exec %s curl -s 'http://localhost:65000/edt/trace/stat_call?id=%s'" service id)))
    (edt-command-in-buffer cmd "*stat call*")))

(defun edt-call-graph-move-to-call ()
  ;; TODO
  ;; - Find function make mark-sexp
  ;; - Find module name erlang-module-name
  ;;  - Use it to move the call graph to the correct function
  ;;    - forward
  ;;    - backward
  ;;    - error
  ;;
  (set-window-point
   (get-buffer-window "*call graph*")
   (with-current-buffer (get-buffer "*call graph*") (search-forward "aerta_rules:expand_rta"))))
