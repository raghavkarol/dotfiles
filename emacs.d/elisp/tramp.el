;;; Fix for docker tramp on apline linux
;;; See https://github.com/emacs-pe/docker-tramp.el
(add-to-list 'load-path "/Users/raghav/github/docker-tramp.el/")
(require 'docker-tramp-compat)
