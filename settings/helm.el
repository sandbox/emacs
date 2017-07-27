(require 'helm-config)
(helm-mode 1)

(define-key helm-find-files-map "\t" 'helm-execute-persistent-action)
