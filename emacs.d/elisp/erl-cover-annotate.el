(add-to-list 'load-path "/Users/raghav/github/ov.el/")
(require 'ov)

(defun cover-mark-line (line-num)
  (save-excursion
    (goto-line line-num)
    (ov-set (ov-line) 'face 'warning 'ov1 t)))

(defun cover-remove-mark ()
  (ov-clear))

(defun my-erl-eval-1 (node eval-expr)
  (erl-spawn
    (erl-send-rpc node
                  'distel
                  'eval_expression
                  (list eval-expr))
    (erl-receive ()
        ((['rex ['ok string]]
          (read-erl-reponse-and-annotate-buffer string buffer-name))
         (['rex ['error reason]]
          reason)
         (other
          other)))))

(defun ok-func (erl-response-string)
                 ((read-erl-reponse-and-annotate-buffer buffer-name erl-response-string)))

(defun cover-annotate (buffer-name)
  (message (format ">>> cover-annotate: %s" buffer-name))
  (my-erl-eval-1 erl-nodename-cache "erl_util:foo()." 'ok-func))

(my-erl-eval-1 erl-nodename-cache "erl_util:foo()." "riak_kv_sweeper.erl")

(cover-annotate "riak_kv_sweeper.erl")

(defun read-erl-reponse-and-annotate-buffer (buffer-name erl-response-string)
    (dolist (e (car (read-from-string (replace-regexp-in-string "\"" "" erl-response-string))))
      (let ((module (nth 0 e))
            (line-number (nth 1 e))
            (cover (nth 2 e))
            (not-cover (nth 3 e)))
        (with-current-buffer buffer-name
          (cover-mark-line line-number)))))

(my-erl-eval erl-nodename-cache "erl_util:foo().")
