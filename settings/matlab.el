;;========================================================================
;; MATLAB
;;========================================================================
(autoload 'matlab-mode "~/.emacs.d/lisp/matlab.el" "Enter Matlab mode." t)
(autoload 'matlab-shell "~/.emacs.d/lisp/matlab.el" "Interactive Matlab mode." t)

;; matlab mode for matlab
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))

(defun my-matlab-mode-hook ()
  (setq matlab-function-indent t); if you want function bodies indented
  (setq fill-column 76); where auto-fill should wrap
  (font-lock-mode 1)
  (turn-on-auto-fill)
  (if (not running-xemacs)
      (matlab-mode-hilit)))
(setq matlab-mode-hook 'my-matlab-mode-hook)

(defun my-matlab-shell-mode-hook ()
  (setq matlab-function-indent t); if you want function bodies indented
  (setq fill-column 76); where auto-fill should wrap
  (font-lock-mode 1))
(setq matlab-shell-mode-hook 'my-matlab-shell-mode-hook)


