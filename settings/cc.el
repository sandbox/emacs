;; Setting some C/C++ mod stuff
(add-hook 'c-mode-hook
          (lambda ()
            (global-set-key "\C-cr" 'compile)))
(add-hook 'c++-mode-hook
          (lambda ()
            (global-set-key "\C-cr" 'compile)))

(setq c-default-style "bsd" c-basic-offset 2)
