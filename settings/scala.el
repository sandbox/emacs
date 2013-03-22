(require 'scala-mode-auto)

(add-hook 'scala-mode-hook
          '(lambda ()
             (scala-mode-feature-electric-mode)
             ))

(require 'scala-mode)

;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
