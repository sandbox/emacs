(add-hook 'org-mode-hook
          #'(lambda ()
             (define-key org-mode-map "\C-\M-j" 'org-insert-heading)
             (define-key org-mode-map "\M-j" 'org-insert-heading)
             (define-key org-mode-map "\C-cl" 'org-metaright)
             (define-key org-mode-map "\C-cj" 'org-metaleft)))
