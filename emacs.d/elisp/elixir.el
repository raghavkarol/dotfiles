;; Create a buffer-local hook to run elixir-format on save, only when we enable elixir-mode.
(add-hook 'elixir-mode-hook
          (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;;; Global elixir formatter config
;; (setq elixir-format-arguments (list "--dot-formatter" "/path/to/.formatter.exs"))

;;; Alchemist setup
;; (setq alchemist-mix-command "/usr/local/bin/mix")
;; (setq alchemist-mix-test-task "espec")
;; (setq alchemist-mix-test-default-options '()) ;; default

;; (setq alchemist-iex-program-name "/usr/local/bin/iex") ;; default: iex
;; (setq alchemist-execute-command "/usr/local/bin/elixir") ;; default: elixir
;; (setq alchemist-compile-command "/usr/local/bin/elixirc") ;; default: elixirc
;; (setq alchemist-test-status-modeline nil)
