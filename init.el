(add-to-list 'load-path "~/.emacs.d/")
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
(defconst user-mail-address "johnle@cs.stanford.edu")

(set-register ?e '(file . "~/.emacs.d/init.el"))
(put 'scroll-left 'disabled nil)
