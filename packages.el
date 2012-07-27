;; ;; So the idea is that you copy/paste this code into your *scratch* buffer,
;; ;; hit C-j, and you have a working el-get.
;; (if (require 'el-get nil t)
;;     (message "el-get is already installed, try M-x el-get-update")
;;   (url-retrieve
;;    "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
;;    (lambda (s)
;;      (end-of-buffer)
;;      (eval-print-last-sexp))))
;;
;; Dependencies
;;   darcs
;;   bzr
;;   git
(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                         ("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(load "~/.emacs.d/el-get/el-get/el-get.elc")

(require 'el-get)

;; Figure these out later
(setq el-get-sources
      '(
        package
        cedet

        caml-mode
        clojure-mode
        coffee-mode
        color-theme
        csv-mode
        diminish
        dired+
        el-get
        gist

        markdown-mode
        haml-mode
	sass-mode
        scss-mode

        haskell-mode
        hs-lint
        json
        lua-mode
        magit

        ;; matlab-mode
        mode-compile
        php-mode
        processing-mode

        python
	;; python-mode
        ;; pymacs
	;; ipython
        ;; django-mode

	el-expectations
        rspec-mode

        scala-mode
        ensime
        scratch
        vimpulse
        wrap-region
        yaml-mode
        yasnippet

        full-ack
        
        ;; elpa
        ;; (:name find-file-in-project :type elpa)
	(:name dired-isearch :type elpa)
        (:name htmlize :type elpa)
        (:name kill-ring-search :type elpa)
        (:name slime :type elpa)
        (:name slime-repl :type elpa)
        (:name ruby-mode :type elpa)
        (:name paredit :type elpa)
        ;; (:name less-css-mode :type elpa)
        ))

(setq my-packages
      (mapcar 'el-get-source-name el-get-sources))

(el-get 'sync my-packages)
;; (mapc 'el-get-install el-get-sources)

;;
;; Load modes that emacs doesn't have and el-get doesn't properly
;; install
;;
;; (load "~/.emacs.d/lisp/magit.el")
(add-to-list 'load-path "~/.emacs.d/el-get/magit/contrib")
(load "~/.emacs.d/lisp/matlab.el")
(load "~/.emacs.d/lisp/csharp-mode.el")

;; (package-install-file "~/.emacs.d/lisp/less-css-mode-0.6.el")

(require 'scratch)

(require 'package)
(package-initialize)
