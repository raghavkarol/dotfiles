(defconst airtame-device-link-local-ip
  "169.254.13.37")

(defconst airtame-device-comint-buffer-name
  (format "airtame-%s" airtame-device-link-local-ip))

(defconst airtame-device-ssh-connection-string
  (format "%s@%s" "root" airtame-device-link-local-ip))

(defun airtame-ssh-device-link-local()
  (interactive)
  (let ((buffer (make-comint airtame-device-comint-buffer-name
                             "ssh"
                             nil
                             airtame-device-ssh-connection-string)))
    (display-buffer buffer)
    (format "created buffer %s" (buffer-name buffer))))
