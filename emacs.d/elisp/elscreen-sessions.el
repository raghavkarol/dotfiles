(require 'elscreen-persist)
(elscreen-start)

(defvar my-session-dir
  (concat (getenv "HOME") "/.emacs.d/desktop-sessions/")
  "*Directory to save desktop sessions in")

(defvar my-session-name-hist nil
  "Desktop session name history")

(defvar my-current-session
  (concat (getenv "HOME") "/.emacs.d/current-desktop-session"))

(defvar my-session-loaded nil)

(defun elscreen-save-file (name)
  (concat my-session-dir name "/elscreen"))

(defun my-session-save-dir(name)
  (concat my-session-dir name))

(defun my-current-session-name ()
  (with-temp-buffer (insert-file-contents my-current-session) (buffer-string)))

(defun my-session-get-name (prompt)
  (completing-read prompt (and (file-exists-p my-session-dir)
                               (setq filter-out-dirs
                                     (if my-session-loaded
                                         (list "." ".." (my-current-session-name))
                                       (list "." "..")))
                               (remove-if
                                    (lambda (w) (member w filter-out-dirs))
                                    (directory-files my-session-dir)))
                   nil nil nil my-session-name-hist))

(defun my-save-session (name)
  (make-directory (my-session-save-dir name) t)
  (setq elscreen-persist-file (elscreen-save-file name))
  (elscreen-persist-store))

(defun my-load-session (name)
  (setq elscreen-persist-file (elscreen-save-file name))
  (elscreen-persist-restore) ; first-call to elscreen-persist-restore fails to restore the session
  (elscreen-persist-restore))

(defun session-changed (name)
  (setq my-current-session-name name)
  (with-temp-file my-current-session (insert name))
  (setq my-session-loaded t))

(defun save-session ()
  ;; Save current session
  (interactive)
  (my-save-session (my-current-session-name))
  (session-changed (my-current-session-name)))

(defun new-session (&optional name)
  ;; Create a new session
  (interactive)
  (unless name (setq name (my-session-get-name "New session: ")))
  (if my-session-loaded
      (my-save-session (my-current-session-name)))
  (my-save-session name)
  (session-changed name))

(defun switch-session (&optional name)
  (interactive)
  (unless name (setq name (my-session-get-name "Session: ")))
  (if my-session-loaded
      (my-save-session (my-current-session-name)))
  (my-load-session name)
  (session-changed name))

(defun delete-session ()
  (interactive)
  (setq name (my-session-get-name "Delete current and switch to: "))
  (setq delete-session-name (my-current-session-name))
  (switch-session name)
  (session-changed name)
  (delete-directory (my-session-save-dir delete-session-name) t))



(add-to-list
 'kill-emacs-hook (lambda () (save-session)))

(when (file-exists-p my-current-session)
  (switch-session (my-current-session-name)))
