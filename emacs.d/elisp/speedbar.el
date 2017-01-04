(require 'speedbar)
(setq speedbar-mode-hook
      '(lambda ()
         (local-set-key
          (kbd "\\t")
          'speedbar-toggle-line-expansion)))
