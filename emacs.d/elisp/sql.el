(require 'sql)
(ignore-errors (sql-connect 'localhost)) ;; Workaround first connection to sql always fails
(add-hook 'sql-mode-hook 'projectile-mode)
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-mode-hook 'yas-minor-mode)
