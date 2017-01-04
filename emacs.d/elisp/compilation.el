;; ------------------------------------------------------------------------------
;; Colorize compilation buffer
;; ------------------------------------------------------------------------------
;; Set TERM in compilation-environment variable
(require 'ansi-color)
(setq compilation-scroll-output t)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
