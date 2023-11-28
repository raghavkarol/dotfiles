(elscreen-start)

;; Elscreen wrappers - to use Mac-Command 0 to navigate elscreen
(defun raghav/elscreen-goto-0 ()  (interactive) (elscreen-goto 0))
(defun raghav/elscreen-goto-1 ()  (interactive) (elscreen-goto 1))
(defun raghav/elscreen-goto-2 ()  (interactive) (elscreen-goto 2))
(defun raghav/elscreen-goto-3 ()  (interactive) (elscreen-goto 3))
(defun raghav/elscreen-goto-4 ()  (interactive) (elscreen-goto 4))
(defun raghav/elscreen-goto-5 ()  (interactive) (elscreen-goto 5))
(defun raghav/elscreen-goto-6 ()  (interactive) (elscreen-goto 6))
(defun raghav/elscreen-goto-7 ()  (interactive) (elscreen-goto 7))
(defun raghav/elscreen-goto-8 ()  (interactive) (elscreen-goto 8))
(defun raghav/elscreen-goto-9 ()  (interactive) (elscreen-goto 9))

(global-set-key (kbd "M-1") 'raghav/elscreen-goto-0)
(global-set-key (kbd "M-2") 'raghav/elscreen-goto-1)
(global-set-key (kbd "M-3") 'raghav/elscreen-goto-2)
(global-set-key (kbd "M-4") 'raghav/elscreen-goto-3)
(global-set-key (kbd "M-5") 'raghav/elscreen-goto-4)
(global-set-key (kbd "M-6") 'raghav/elscreen-goto-5)
(global-set-key (kbd "M-7") 'raghav/elscreen-goto-6)
(global-set-key (kbd "M-8") 'raghav/elscreen-goto-7)
(global-set-key (kbd "M-9") 'raghav/elscreen-goto-8)
(global-set-key (kbd "M-0") 'raghav/elscreen-goto-9)

(load-file "~/.emacs.d/elisp/revive.el")
(add-to-list 'load-path "~/github/elscreen-persist")
(require 'elscreen-persist)
(elscreen-persist-mode 1)
