;; go get -u github.com/nsf/gocode
;; go get -u golang.org/x/tools/cmd/godoc
;; go get -u golang.org/x/tools/cmd/guru
;; go get -u github.com/golang/lint/golint
;; go get -u github.com/onsi/ginkgo/ginkgo
;; go get -u github.com/motemen/gore
;; go get -u github.com/davecgh/go-spew/spew
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing

(require 'company)
(require 'company-go)

(add-hook 'go-mode-hook
          (lambda ()
            (flycheck-mode)
            (projectile-mode)
            (add-hook 'before-save-hook 'gofmt-before-save)
            (local-set-key (kbd "M-.") 'go-guru-definition)
            (local-set-key (kbd "M-,") 'pop-tag-mark)
            (company-mode)
            (set (make-local-variable 'company-backends) '(company-go))
            (gorepl-mode)
            (local-set-key (kbd "C-M-x") 'gorepl-eval-line)))

(add-to-list 'load-path
             (concat (getenv "GOPATH") "/src/github.com/golang/lint/misc/emacs"))

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
