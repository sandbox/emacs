;;========================================================================
;; Hooks
;;========================================================================

;; Setting some C/C++ mod stuff
(add-hook 'c-mode-hook
          '(lambda ()
             (global-set-key "\C-cr" 'compile)))
(add-hook 'c++-mode-hook
          '(lambda ()
             (global-set-key "\C-cr" 'compile)))

(setq c-default-style "bsd" c-basic-offset 2)
;;

(add-hook 'tex-mode-hook
          '(lambda ()
             (define-key tex-mode-map [f7] 'tex-compile)
             (setq fill-column 80); where auto-fill should wrap
             (turn-on-auto-fill)
             (flyspell-mode)))

(add-hook 'org-mode-hook
          '(lambda ()
             (define-key org-mode-map "\C-\M-j" 'org-insert-heading)
             (define-key org-mode-map "\M-j" 'org-insert-heading)
             (define-key org-mode-map "\C-cl" 'org-metaright)
             (define-key org-mode-map "\C-cj" 'org-metaleft)))

(add-hook 'grep-mode-hook
          '(lambda ()
             (define-key grep-mode-map "j" 'next-error-no-select)
             (define-key grep-mode-map "k" 'previous-error-no-select)))

(add-hook 'occur-mode-hook
          '(lambda ()
             (define-key occur-mode-map "n" 'occur-next)
             (define-key occur-mode-map "p" 'occur-prev)
             (define-key occur-mode-map "j" 'occur-next)
             (define-key occur-mode-map "k" 'occur-prev)))
