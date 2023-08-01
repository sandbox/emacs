;; (add-hook 'python-mode-hook
;;           (function (lambda ()
;;                       (setq indent-tabs-mode nil
;;                             tab-width 2))))
(require 'python)
(setq python-indent-guess-indent-offset nil)
(setq python-indent-offset 2)
;; (setq nose-use-verbose nil)

;; (require 'nose)

;; (add-to-list 'nose-project-names "script/test")
;; (add-to-list 'nose-project-names "script/docker-test")
;; (add-to-list 'nose-project-names "script/local/test")

;; (add-hook 'python-mode-hook
;;           (lambda ()
;;            (local-set-key "\C-c,a" 'nosetests-all)
;;            (local-set-key "\C-c,m" 'nosetests-module)
;;            (local-set-key "\C-c,s" 'nosetests-one)))

(setq auto-mode-alist (cons '("\\.pyx$" . python-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pxd$" . python-mode) auto-mode-alist))
