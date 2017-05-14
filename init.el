
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
(defconst user-mail-address "johnle@cs.stanford.edu")

(set-register ?e '(file . "~/.emacs.d/init.el"))
(set-register ?s '(file . "~/.emacs.d/settings"))
(set-register ?a '(file . "~/.emacs.d/alias.el"))
(put 'scroll-left 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
