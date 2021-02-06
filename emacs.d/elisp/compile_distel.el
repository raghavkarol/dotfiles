(defun erlang-get-current-version (erlang-home lib)
  (car (file-expand-wildcards
        (format "%slib/%s" erlang-home lib))))

(setq erlang-version  "21.3.8.4")
(setq erlang-home (format "/Users/%s/erlang/%s/" (user-real-login-name) erlang-version))
(setq erlang-root-dir erlang-home)

(add-to-list 'load-path (erlang-get-current-version erlang-home "tools-*/emacs"))
(add-to-list 'exec-path (concat erlang-home "bin"))
(require 'erlang-start)
