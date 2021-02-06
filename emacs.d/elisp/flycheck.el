;; (add-hook 'after-init-hook #'global-flycheck-mode)
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
