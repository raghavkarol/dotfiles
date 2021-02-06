(setq terminal-mode 't)
(load-file "~/.emacs.d/init.el")

(defun get-command ()
  (cond ((region-active-p)
         (buffer-substring-no-properties
          (region-beginning)
          (point)))
        (t
         (buffer-substring-no-properties
          (save-excursion (beginning-of-line-text) (point))
          (point)))))

(defun emamux-repl-run-command ()
  (interactive)
  (emamux:run-command (get-command)))

(defun emamux-send-ctrl-c ()
  (interactive)
  (emamux:send-keys "C-c" (emamux:get-runner-pane-id)))

(defun ssh-host (environment region)
  "Connect to an envrionment and it's jump host

environment: integration|production
region:      us-east-1| us-west-2| eu-west-1
"
  (emamux:run-command (format "ssh %s" environment))
  (emamux:run-command (format "sudo jump-host %s-%s"
                              (if (string= environment "production")
                                  "global-services"
                                "global-integration")
                              region)))

(defun integration-us-west-2 ()
  (interactive)
  (ssh-host "integration" "us-west-2"))

(defun production-us-east-1 ()
  (interactive)
  (ssh-host "production" "us-east-1"))

(defun production-us-west-2 ()
  (interactive)
  (ssh-host "production" "us-west-2"))

(defun production-eu-west-1 ()
  (interactive)
  (ssh-host "production" "eu-west-1"))

(defun exit ()
  (interactive)
  (emamux:run-command "exit"))

(delete-other-windows)
(define-key org-mode-map (kbd "C-j") 'emamux-repl-run-command)
(define-key org-mode-map (kbd "C-c c") 'emamux-send-ctrl-c)

(with-current-buffer "*scratch*"
  (org-mode)
  (insert "Enter a command and press C-j to execute\n\n"))
(switch-to-buffer "*scratch*")
