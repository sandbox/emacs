(add-hook 'html-mode-hook
          (lambda ()
                  (define-key html-mode-map "\C-ch" 'sgml-close-tag)))
