(require 'tramp)

;; http://atomized.org/2009/05/emacs-23-easier-directory-local-variables/
(defmacro absolute-dirname (path)
  "Return the directory name portion of a path.

If PATH is local, return it unaltered.
If PATH is remote, return the remote diretory portion of the path."
  `(cond ((tramp-tramp-file-p ,path)
          (elt (tramp-dissect-file-name ,path) 3))
         (t ,path)))

(defmacro dir-locals (dir vars)
  "Set local variables for a directory.

DIR is the base diretory to set variables on.

VARS is an alist of variables to set on files opened under DIR,
in the same format as `dir-locals-set-class-variables' expects."
  `(let ((name (intern (concat "dir-locals-"
                               ,(md5 (expand-file-name dir)))))
         (base-dir ,dir)
         (base-abs-dir ,(absolute-dirname dir)))
     (dir-locals-set-class-variables name ,vars)
     (dir-locals-set-directory-class ,dir name nil)))

(defmacro dir-locals-safe (directory variables)
  "Set local variables for a directory and add variables to
safe-local-variable-values."
  `(progn
     (dir-locals ,directory ,variables)
     (dolist (class ,variables)
       (dolist (variable (cdr class))
         (add-to-list 'safe-local-variable-values variable)))))

(dir-locals-safe "~/C2/statwing/cake-stats"
                 '((ruby-mode . ((rspec-spec-command . "cd /Users/john/C2/statwing/cake-stats && bundle exec rspec")))
                   (rspec-dired-mode . ((rspec-spec-command . "cd /Users/john/C2/statwing/cake-stats && bundle exec rspec")))))

(dir-locals-set-class-variables 'statwing-tab-mode
                                '((nil (indent-tabs-mode . nil))
                                  (c-mode (indent-tabs-mode . nil))
                                  (web-mode (indent-tabs-mode . nil))))

(dir-locals-set-class-variables 'qualtrics-tab-mode
                                '((nil . ((indent-tabs-mode . t)))
                                  (c-mode . ((indent-tabs-mode . t)))
                                  (web-mode . ((indent-tabs-mode . t)))))

(dir-locals-set-class-variables 'swproxy-locals
                                '((nil . ((compile-command . "cd ~/C2/qualtrics/swproxy && source ~/.nvm/nvm.sh && nvm use && npm test")
                                          (indent-tabs-mode . t)))
                                  (c-mode . ((indent-tabs-mode . t)))
                                  (web-mode . ((indent-tabs-mode . t)))))

(dir-locals-set-directory-class "/Users/john/C2/qualtrics/" 'qualtrics-tab-mode)
(dir-locals-set-directory-class "/Users/john/C2/qualtrics/swproxy" 'swproxy-locals)
(dir-locals-set-directory-class "/Users/john/C2/statwing/" 'statwing-tab-mode)
(dir-locals-set-directory-class "/Users/john/C2/statwing/cake-stats" 'statwing-tab-mode)
