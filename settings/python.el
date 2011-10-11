;; (add-hook 'python-mode-hook
;;           (function (lambda ()
;;                       (setq indent-tabs-mode nil
;;                             tab-width 2))))
(require 'python)
(setq python-indent-guess-indent-offset nil)
(setq python-indent-offset 2)

