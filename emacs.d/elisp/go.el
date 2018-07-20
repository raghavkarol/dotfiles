;; go get -u github.com/nsf/gocode
;; go get -u golang.org/x/tools/cmd/godoc
;; go get -u golang.org/x/tools/cmd/guru
;; go get -u github.com/golang/lint/golint
;; go get -u github.com/onsi/ginkgo/ginkgo
;; go get -u github.com/motemen/gore
;; go get -u github.com/davecgh/go-spew/spew
;; go get -u golang.org/x/tools/cmd/goimports

(setq company-tooltip-limit 20)          ; bigger popup window
(setq company-idle-delay .5) ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(require 'company)
(require 'company-go)
(require 'go-dlv)

(defun  go-mode-customization ()
  (linum-mode)
  (flycheck-mode)
  (yas-minor-mode)
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  (projectile-mode)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'go-guru-definition)
  (local-set-key (kbd "M-,") 'pop-tag-mark)
  (local-set-key (kbd "C-<return>") 'company-go)
  (gorepl-mode))

(defun gorepl-mode-customization ()
  (define-key gorepl-mode-map (kbd "C-c C-l") 'gorepl-run-reload-current-file)
  (define-key gorepl-mode-map (kbd "C-M-x") #'gorepl-eval-region-or-line))

(add-hook 'go-mode-hook 'go-mode-customization)
(add-hook 'gorepl-mode-hook 'gorepl-mode-customization)

(add-to-list 'load-path
             (concat (getenv "GOPATH") "/src/github.com/golang/lint/misc/emacs"))

(defun gorepl-eval-region-or-line ()
  (interactive)
  (if (region-active-p)
      (gorepl-eval-region
       (region-beginning)
       (region-end))
    (gorepl-eval-line)))

(defun gorepl-run-reload-current-file ()
  (interactive)
  (let ((process (get-buffer-process gorepl-buffer))
        (current-buffer (current-buffer)))
    (if process
        (comint-send-string (get-buffer-process gorepl-buffer) ":quit\n"))
    (sit-for 0.1) ; Must wait a bit for process termination to be detected
    (gorepl-run-load-current-file)
    (pop-to-buffer current-buffer)))


(require 'golint)

(defvar cloud:buffer-name "cloud-backend")

(defun zsh-comint-buffer (buffer-name)
    (let* ((buffer (make-comint buffer-name "/usr/local/bin/zsh" nil "--login")))
    (with-current-buffer buffer
      ;; (compilation-minor-mode 't)
      )
    (display-buffer buffer)))

(defun cloud-backend-comint-buffer ()
  (get-buffer (format "*%s*" cloud:buffer-name)))

(defun airtame-cloud-backend-start()
  (interactive)
  (zsh-comint-buffer cloud:buffer-name))

(defun airtame-cloud-backend-stop ()
  (interactive)
  (kill-buffer (cloud-backend-comint-buffer)))

(defun airtame-cloud-backend-show ()
  (interactive)
  (if (bufferp (cloud-backend-comint-buffer))
      (display-buffer (cloud-backend-comint-buffer))
    (message (format "no %s running" cloud:buffer-name))))

(defun airtame-cloud-backend-docker-test ()
  (interactive)
  (comint-send-string (get-buffer-process (cloud-backend-comint-buffer))
                      (format "%s\n" "docker exec -it cloud_backend_1 go test -args -ginkgo.skip=\"Database Migrator Tests\"")))


(defun airtame-cloud-backend-test ()
  (interactive)
  (comint-send-string (get-buffer-process (cloud-backend-comint-buffer))
                      (format "%s\n" "cd $GOPATH/src/airtame/backend && . ~/bin/airtame_cloud_mysql_env && go test -args -ginkgo.skip=\"Database Migrator Tests\"")))


(defun airtame-cloud-backend-watch-start ()
  (interactive)
  (comint-send-string (cloud-backend-comint-buffer)
                      (format "%s\n"
                              "watchmedo auto-restart \\
                                --patterns='*.go' \\
                                --recursive \\
                               go_build_and_run_airtame_cloud")))
