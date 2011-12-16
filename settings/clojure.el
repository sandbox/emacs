(require 'slime)
(eval-after-load 'slime '(setq slime-protocol-version 'ignore))
(slime-setup '(slime-repl))
(require 'clojure-mode)
(require 'clojure-test-mode)

(eval-after-load "clojure-mode"
  '(progn
     (defun clojure-paredit-hook () (paredit-mode +1))
     (add-hook 'clojure-mode-hook 'clojure-paredit-hook)
     (defun clojure-indent-hook ()
       (define-clojure-indent (clone-for 1) (at 1)))
     (add-hook 'clojure-mode-hook 'clojure-indent-hook)
))
