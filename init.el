
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(load-file "~/.emacs.d/platform.el")
(load-file "~/.emacs.d/vars.el")
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/settings.el")
(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/themes.el")

(load-file "~/.emacs.d/alias.el")
(load-file "~/.emacs.d/locals.el")

;; for emailing with emacs!
(setq mail-archive-file-name "~/.emacs.d/sentmail")
(defconst user-mail-address "le.johnq@gmail.com")

(set-register ?e '(file . "~/.emacs.d/init.el"))
(set-register ?s '(file . "~/.emacs.d/settings"))
(set-register ?a '(file . "~/.emacs.d/alias.el"))

(put 'scroll-left 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-at-remote-remote-type-domains
   '(("bitbucket.org" . "bitbucket")
     ("github.com" . "github")
     ("gitlab.com" . "gitlab")
     ("git.savannah.gnu.org" . "gnu")
     ("gist.github.com" . "gist")
     ("git.sr.ht" . "sourcehut")))
 '(compilation-error-regexp-alist
   '(bash python-tracebacks-and-caml cmake cmake-info comma cucumber msft edg-1 edg-2 epc ftnchek iar ibm irix java jikes-file jikes-line clang-include gcc-include ruby-Test::Unit gnu lcc makepp mips-1 mips-2 msft omake oracle perl php rxp sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint guile-file guile-line))
 '(global-undo-tree-mode nil)
 '(groovy-indent-offset 2)
 '(magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
 '(magit-git-executable "/opt/local/bin/git")
 '(package-selected-packages
   '(tide paredit company ess evil-textobj-tree-sitter helm-tree-sitter tree-sitter-langs tree-sitter dap-mode browse-at-remote csv-mode diminish eglot elixir-mode evil evil-leader evil-numbers evil-surround exec-path-from-shell expand-region flycheck go-mode haskell-mode helm-ls-git jest jsonrpc lua-mode magit magit-popup markdown-mode nose php-mode rspec-mode sass-mode scala-mode scratch scss-mode smart-tab web-mode yaml-mode zenburn-theme))
 '(sh-basic-offset 2)
 '(warning-suppress-types '((comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
