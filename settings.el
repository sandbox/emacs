;;
;; Load my custom settings for modes
;;
(mapc 'load (directory-files "~/.emacs.d/settings" t "^[A-Za-z]*\\.el"))
