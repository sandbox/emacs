(setq grep-find-use-xargs t) ;; uses xargs in grep-find
;; (setq grep-find-use-xargs nil)
(setq grep-find-command "find . \\( -path \\*/.gems -o -path \\*/venv.backup -o -path \\*/venv -o -path \\*/generated -o -path \\*/vendor -o -path \\*/SCCS -o -path \\*/RCS -o -path \\*/CVS -o -path \\*/MCVS -o -path \\*/.svn -o -path \\*/.git -o -path \\*/.hg -o -path \\*/.bzr -o -path \\*/_MTN -o -path \\*/_darcs -o -path \\*/\\{arch\\} \\) -prune -o \\( -name .\\#\\* -o -name \\*.o -o -name \\*\\~ -o -name \\*.bin -o -name \\*.lbin -o -name \\*.so -o -name \\*.a -o -name \\*.ln -o -name \\*.blg -o -name \\*.bbl -o -name \\*.elc -o -name \\*.lof -o -name \\*.glo -o -name \\*.idx -o -name \\*.lot -o -name \\*.fmt -o -name \\*.tfm -o -name \\*.class -o -name \\*.fas -o -name \\*.lib -o -name \\*.mem -o -name \\*.x86f -o -name \\*.sparcf -o -name \\*.fasl -o -name \\*.ufsl -o -name \\*.fsl -o -name \\*.dxl -o -name \\*.pfsl -o -name \\*.dfsl -o -name \\*.p64fsl -o -name \\*.d64fsl -o -name \\*.dx64fsl -o -name \\*.lo -o -name \\*.la -o -name \\*.gmo -o -name \\*.mo -o -name \\*.toc -o -name \\*.aux -o -name \\*.cp -o -name \\*.fn -o -name \\*.ky -o -name \\*.pg -o -name \\*.tp -o -name \\*.vr -o -name \\*.cps -o -name \\*.fns -o -name \\*.kys -o -name \\*.pgs -o -name \\*.tps -o -name \\*.vrs -o -name \\*.pyc -o -name \\*.pyo -o -name \\*.cache -o -name \\*.tar.gz -o -name \\*.map -o -name \\*.min.css \\) -prune -o -type f -print0 | xargs -0 grep -nH -e "
      grep-find-template "find . <X> -type f <F> -print0 | xargs -0 grep <C> -nH -e <R>"
      )

(add-hook 'grep-mode-hook
          #'(lambda ()
              (define-key grep-mode-map "j" 'next-error-no-select)
              (define-key grep-mode-map "k" 'previous-error-no-select)))
