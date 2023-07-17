(helm-mode 1)

(define-key helm-find-files-map "\t" 'helm-execute-persistent-action)

(defun helm-grep-repo (arg)
  (interactive "P")
  (require 'helm-files)
  (helm-grep-git-1
   (vc-root-dir)
   arg))
