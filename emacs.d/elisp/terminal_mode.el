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
  (emamux:run-command (format "ssh %s-%s"
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

;;; PDSH helper commands
(defun container-for-shard (shard-id)
  (emamux:run-command
   (format
    "pdsh -g ecs-ae \
                     'for i in $(docker ps -f name=aefrenglogmsgs- -q); \
                        do \
                         docker exec \$i \
                          /usr/lib/aefr_eng/bin/aefr_eng eval \" io:format(\\\"~s ~s ~n\\\", [aefr_eng:get_shard_id(), al_sd2:container_id()]). \" ; \
                        done' \
                    | grep %s" shard-id)))

(defun ecs-container-name (container-id)
  (emamux:run-command
   (format
    "pdsh -g ecs-ae docker ps -f id=%s --format {{.Names}}" container-id)))

(defun ecs-container-id (ecs-name)
  (emamux:run-command
   (format
    "pdsh -g ecs-ae docker ps -f name=%s --format {{.ID}}" ecs-name)))

(defun docker-name (service)
  (cond ((string-match "aetrigger_eng" service)
         (list (concat (replace-regexp-in-string  "_" "" service) "-")
               "aetrigger_eng"))
        ((string-match "aefr_eng" service)
         (list (concat (replace-regexp-in-string  "_" "" service) "-")
               "aefr_eng"))
        ((string-match "aefr_ofl" service)
         (list (concat (replace-regexp-in-string  "_" "" service) "-")
               "aefr_eng"))
        ((string-match "aerta_eng" service)
         (list (concat (replace-regexp-in-string  "_" "" service) "-")
               "aerta_eng"))
        ((string-match "aerta_workers" service)
         (list (concat (replace-regexp-in-string  "_" "" service) "-")
               "aerta"))
        ((cl-member service '("aefr" "aerta" "aetag" "aepublish" "aecontent" "aewatchdog") :test #'string=)
         (list (concat service "-.+-" service) service))
        (t (error (format "unknown service: %s" service)))))

(defun service-connect (service &rest rest)
  (progn
    (emamux:run-command
     (format "ssh -t $(pdsh -g ecs-ae sudo docker ps %s -q | perl -F: -lane '{print $F[0]}' | sed -n 1p)"
             (if rest
                 (format "-f id=%s" (car rest))
               (format "-f name=%s" (car (docker-name service))))))
    (emamux:run-command
     (format "sudo docker exec -it $(sudo docker ps %s -q | perl -F: -lane '{print $F[0]}' | sed -n 1p) /usr/lib/%s/bin/%s remote_console"
             (if rest
                 (format "-f id=%s" (car rest))
               (format "-f name=%s" (car (docker-name service))))
             (cadr (docker-name service))
             (cadr (docker-name service))))))


(docker-name "aerta_workers")
