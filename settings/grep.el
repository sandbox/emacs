;; (setq grep-find-use-xargs t) ;; uses xargs in grep-find
;; (setq grep-find-use-xargs nil)
(setq grep-find-command "find . -type f -print | xargs -n1 grep -nH -e "
      grep-find-template "find . <X> -type f <F> -print | xargs -n1 grep <C> -nH -e <R>"
      )
