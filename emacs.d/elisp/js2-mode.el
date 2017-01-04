;; -----------------------------------------------------------------------------
;; js2-mode
;; -----------------------------------------------------------------------------
;; requires ac-js2 mode to be active
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
;; (setq ac-js2-evaluate-calls t)
(add-hook 'js2-mode-hook 'projectile-mode)
