(defvar my-load-path "~/github/raghavkarol/dotfiles/emacs.d/elisp/")
(defun my-load(filename)
  (load (concat my-load-path (symbol-name filename))))

(defun delete-trailing-blank-lines ()
  "Deletes All Blank Lines At The End Of The File."
  (interactive)
  (save-excursion
    (save-restriction
      (widen)
      (goto-char (point-max))
      (delete-blank-lines))))

(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (revert-buffer t t))

;; -----------------------------------------------------------------------------
;; Set transparency of emacs
;; -----------------------------------------------------------------------------
 (defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))

;; -----------------------------------------------------------------------------
;; S3 API
;; -----------------------------------------------------------------------------;;
;;; watchmedo shell-command --patterns='*_flag' --wait --command='do_cmd ${watch_src_path}'
(defun s3-api-tests-gradle-build ()
  (interactive)
  (let ((default-directory "~/github/s3-api-tests"))
    (shell-command-to-string "echo 'gradle build' > run_flag")))

;; Elscreen re-ordering
(defun seq-missing (list)
    (cl-set-difference
     (number-sequence (seq-min list) (seq-max list))
     list))

(defun elscreen-screen-0-index-org ()
  (interactive)
  (if (eq 0 (helm-elscreen-find-file "~/org/index.org"))
      (elscreen-toggle)
    (progn (elscreen-goto 0)
           (elscreen-swap)
           (elscreen-toggle))))

(defun elscreen-reorder-continuous1 (elscreen-actual elscreen-reorder)
  (cond ((eq elscreen-actual elscreen-reorder)
         't)
        ((eq (car elscreen-actual) (car elscreen-reorder))
         (elscreen-reorder-continuous1
          (cdr elscreen-actual)
          (cdr elscreen-reorder)))
        ('t
         (progn
           (when (not (seq-contains elscreen-actual (car elscreen-reorder)))
             (elscreen-create))
           (elscreen-goto (car elscreen-actual))
           (elscreen-goto (car elscreen-reorder))
           (elscreen-swap)
           (elscreen-kill (car elscreen-actual))
           (elscreen-reorder-continuous1 (cdr elscreen-actual) (cdr elscreen-reorder))))))

(defun elscreen-reorder-continuous ()
  (interactive)
  (let ((elscreen-actual (elscreen-get-screen-list))
        (elscreen-reorder (number-sequence 0 (1- (length (elscreen-get-screen-list))))))
    (elscreen-reorder-continuous1 (seq-sort '< elscreen-actual) elscreen-reorder)))


;; Underscores to camel case confversion
(defun mapcar-head (fn-head fn-rest list)
  "Like MAPCAR, but applies a different function to the first element."
  (if list
      (cons (funcall fn-head (car list))
            (mapcar fn-rest (cdr list)))))

(defun upper-camelcase (s)
  "Convert under_score string S to CamelCase string."
  (mapconcat 'identity (mapcar
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s "_")) ""))
(defun lower-camelcase (s)
  "Convert under_score string S to camelCase string."
  (mapconcat 'identity (mapcar-head
                        '(lambda (word) (downcase word))
                        '(lambda (word) (capitalize (downcase word)))
                        (split-string s "_")) ""))

(defun camelcase-region (camel-case-fun)
  (let* ((start (region-beginning))
         (end (region-end))
         (new-string (funcall camel-case-fun (buffer-substring-no-properties start end))))
    (save-excursion
      (delete-region start end)
      (goto-char start)
      (insert new-string))))

(defun upper-camelcase-region ()
  (interactive)
  (camelcase-region 'upper-camelcase))

(defun lower-camelcase-region ()
  (interactive)
  (camelcase-region 'lower-camelcase))


(setq cloud-reviewers '("keating@airtame.com" "bogdan@airtame.com"))

(defun magit-gerrit-add-cloud-reviewers ()
  (interactive)
  "ssh -x -p 29418 user@gerrit gerrit set-reviewers --project toplvlroot/prjname --add email@addr"

  (dolist (email cloud-reviewers)
    (gerrit-ssh-cmd "set-reviewers"
                    "--project" (magit-gerrit-get-project)
                    "--add" email
                    (cdr-safe (assoc 'id (magit-gerrit-review-at-point))))))

(setq ops-reviewers '("jakob@airtame.com" "peter.hrvola@airtame.com"))
(defun magit-gerrit-add-ops-reviewers ()
  (interactive)
  "ssh -x -p 29418 user@gerrit gerrit set-reviewers --project toplvlroot/prjname --add email@addr"

  (dolist (email ops-reviewers)
    (gerrit-ssh-cmd "set-reviewers"
                    "--project" (magit-gerrit-get-project)
                    "--add" email
                    (cdr-safe (assoc 'id (magit-gerrit-review-at-point))))))

;;; Transparency functions for emacs from: https://www.emacswiki.org/emacs/TransparentEmacs
(defun toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(85 . 50) '(100 . 100)))))

(defun transparency (value)
   "Sets the transparency of the frame window. 0=transparent/100=opaque"
   (interactive "nTransparency Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))


;;; -----------------------------------------------------------------------------
;;; Frame management
;;; -----------------------------------------------------------------------------
(defun frame-has-name (frame name)
  (string= (frame-parameter frame 'name) name))

(defun speedbar-frame (frame)
  (frame-has-name frame "Speedbar 1.0"))

(defun scratch-frame (frame)
  (frame-has-name frame "*scratch"))

(defun get-speedbar-frame ()
  (elt
   (seq-take-while #'speedbar-frame (frame-list)) 0))

(defun get-main-frame ()
  (elt
   (seq-take-while (lambda (frame) (frame-has-name frame "*scratch*"))
                   (frame-list)) 0))

(defun dual-screen-frames ()
  (interactive)
  (set-frame-size (get-main-frame) 210 72)
  (set-frame-size (get-speedbar-frame) 30 73))
