(setq linum-format
      (lambda (line)
        (propertize (format
                     (let ((w (length (number-to-string
                                       (count-lines (point-min) (point-max))))))
                       (concat "%" (number-to-string w) "d "))
                     line)
                    'face 'linum)))

(setq rspec-use-rake-flag nil)
(setq rspec-use-rvm nil)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")))

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

;; builder directory local variables
(dir-locals-safe "~/C2/builder" 
                 '((ruby-mode . ((rspec-spec-command . "cd /Users/john/C2/builder && bin/spec")))))

;; gluestick directory local variables
(dir-locals-safe "~/C2/gluestick" 
                 '((ruby-mode . ((rspec-spec-command . "cd /Users/john/C2/gluestick && GLUESTICK_ENV=test_local_vm bundle exec spec")
                                 (tags-file-name . "~/C2/gluestick/TAGS")))))


