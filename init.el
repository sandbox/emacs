
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp")

(load-file "~/.emacs.d/platform.el")
(load-file "~/.emacs.d/vars.el")
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/setting-functions.el")
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
     ("git.sr.ht" . "sourcehut")
     ("gitlab-app.eng.qops.net" . "gitlab")))
 '(compilation-error-regexp-alist
   '(bash python-tracebacks-and-caml cmake cmake-info comma cucumber msft edg-1 edg-2 epc ftnchek iar ibm irix java jikes-file jikes-line clang-include gcc-include ruby-Test::Unit gnu lcc makepp mips-1 mips-2 msft omake oracle perl php rxp sparc-pascal-file sparc-pascal-line sparc-pascal-example sun sun-ada watcom 4bsd gcov-file gcov-header gcov-nomark gcov-called-line gcov-never-called perl--Pod::Checker perl--Test perl--Test2 perl--Test::Harness weblint guile-file guile-line))
 '(global-undo-tree-mode nil)
 '(groovy-indent-offset 2)
 '(magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
 '(magit-git-executable "/opt/local/bin/git")
 '(package-selected-packages
   '(evil tide jsonrpc elixir-mode eglot magit magit-popup jest evil-leader evil-numbers evil-paredit evil-surround browse-at-remote go-mode zenburn-theme yaml-mode web-mode smart-tab scss-mode scratch scala-mode sass-mode rspec-mode php-mode nose markdown-mode lua-mode helm-ls-git haskell-mode groovy-mode gitignore-mode gitconfig-mode flycheck expand-region exec-path-from-shell diminish csv-mode coffee-mode))
 '(safe-local-variable-values
   '((eval set
           (make-local-variable 'statwing-etl-test-command)
           (concat "cd " dirs-locals-root-project-path " && docker exec -it statwing-etl-devrunner script/test"))
     (eval set
           (make-local-variable 'abacus-worker-test-command)
           (concat "cd " dirs-locals-root-project-path "statwing-abacus-worker && script/local/test -w ./ -c ./setup.cfg "))
     (eval set
           (make-local-variable 'swproxy-server-test-command)
           (concat "cd " dirs-locals-root-project-path " && script/local/yarn run test "))
     (eval set
           (make-local-variable 'dirs-locals-root-project-path)
           (locate-dominating-file default-directory ".dir-locals.el"))
     (compile-command . swproxy-server-test-command)
     (compile-command . statwing-etl-test-command)
     (compile-command . abacus-worker-test-command)
     (compile-command . (concat
                         "cd " dirs-locals-root-project-path "statwing-abacus-worker && PIPELINE="
                         (file-name-nondirectory (shell-quote-argument buffer-file-name))
                         " SWPROXY_TESTS_UPDATE=false script/local/test -w ./ -c ./setup.cfg tests/abacus/analysis/tests.py:test_analysis_messages"))))
 '(sh-basic-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
