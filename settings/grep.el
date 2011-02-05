;; (setq grep-find-use-xargs t) ;; uses xargs in grep-find
;; (setq grep-find-use-xargs nil)
(setq grep-find-command "find . -type f -print | xargs -n1 grep -nH -e "
      grep-find-template "find . <X> -type f <F> -print | xargs -n1 grep <C> -nH -e <R>"
      )

(add-hook 'grep-mode-hook
          '(lambda ()
             (define-key grep-mode-map "j" 'next-error-no-select)
             (define-key grep-mode-map "k" 'previous-error-no-select)))
