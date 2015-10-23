(setq evil-want-C-u-scroll t)

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)

(package-initialize)

(setq url-http-attempt-keepalives nil)

;; Figure these out later
(defvar john-packages
      '(
        ace-jump-mode
        anything
        anything-config
        anything-match-plugin
        auctex
        caml
        clojure-mode
        clojure-test-mode
        nrepl
        coffee-mode
        csv-mode
;;        elm-mode
        dash
        diminish
        dired+
        dired-isearch
        undo-tree
        evil
        evil-leader
        evil-surround
        evil-numbers
        evil-paredit
        exec-path-from-shell
        expand-region
        flycheck
        gitconfig-mode
        gitignore-mode
        haml-mode
        haskell-mode
        json
        lua-mode
        magit
        markdown-mode
        ;; melpa
        mode-compile
        paredit
        php-mode
        python
        nose
        rspec-mode
        ruby-mode
        sass-mode
        scala-mode
        scratch
        scss-mode
        ;; slime
        ;; slime-repl
        smart-tab
        yaml-mode
        yasnippet
        zenburn-theme))

(mapc
 (lambda (package)
   (or (package-installed-p package)
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package))))
 john-packages)

(add-to-list 'load-path "~/.emacs.d/lisp")

;;
;; Load modes that emacs doesn't have and el-get doesn't properly
;; install
;;
;; (load "~/.emacs.d/lisp/magit.el")
;; (add-to-list 'load-path "~/.emacs.d/el-get/magit/contrib")
;; (load "~/.emacs.d/lisp/matlab.el")
;; (load "~/.emacs.d/lisp/csharp-mode.el")
;; (package-install-file "~/.emacs.d/lisp/less-css-mode-0.6.el")

(require 'scratch)
