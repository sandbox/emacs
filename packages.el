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
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(load "~/.emacs.d/el-get/el-get/el-get.elc")

(require 'el-get)

;; Figure these out later
(setq el-get-sources
      '(
        package

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
        scratch
        vimpulse
        wrap-region
        yaml-mode
        yasnippet
        
        ;; elpa

        dired-isearch
        htmlize
        kill-ring-search
        slime
        ruby-mode
        ))

(el-get)
;; (mapc 'el-get-install el-get-sources)

;;
;; Load modes that emacs doesn't have and el-get doesn't properly
;; install
;;
;; (load "~/.emacs.d/lisp/magit.el")
(add-to-list 'load-path "~/.emacs.d/el-get/magit/contrib")
(load "~/.emacs.d/lisp/matlab.el")
(load "~/.emacs.d/lisp/csharp-mode.el")

(require 'scratch)
