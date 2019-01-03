;;; Backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;;; Enable matching parenthesis
(show-paren-mode)

;;; Open all files in read-only mode
(add-hook 'find-file-hook
          '(lambda ()
             (when (and (buffer-file-name)
                        (file-exists-p (buffer-file-name))
                        (file-writable-p (buffer-file-name)))
               (message "Toggle to read-only for existing file")
               (toggle-read-only 1))))


;;; Keyboard bindings
(global-set-key (kbd "C-x %") 'split-window-horizontally)
(global-set-key (kbd "C-x \"") 'split-window-vertically)
