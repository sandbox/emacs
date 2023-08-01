(add-hook 'occur-mode-hook
          #'(lambda ()
             (define-key occur-mode-map "n" 'occur-next)
             (define-key occur-mode-map "p" 'occur-prev)
             (define-key occur-mode-map "j" 'occur-next)
             (define-key occur-mode-map "k" 'occur-prev)))
