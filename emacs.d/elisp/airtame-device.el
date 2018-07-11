(defconst link-local-ip
  "169.254.13.37")

(defconst ssh-connection-string
  (format "%s@%s" "root" link-local-ip))

(defun comint-buffer-name (prefix)
  (format "%s-%s" prefix airtame-device-link-local-ip))

(defun airtame-ssh()
  (interactive)
  (let ((buffer (make-comint (comint-buffer-name "ssh")
                             "ssh"
                             nil
                             "-q"
                             ssh-connection-string)))
    (display-buffer buffer)
    (format "created buffer %s" (buffer-name buffer))))

(defun airtame-journalctl-f()
  (interactive)
  (let ((buffer (make-comint (comint-buffer-name "journalctl-f")
                             "ssh"
                             nil
                             "-q"
                             ssh-connection-string
                             "journalctl"
                             "-f")))
    (display-buffer buffer)
    (format "created buffer %s" (buffer-name buffer))))
