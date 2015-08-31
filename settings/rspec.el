(require 'rspec-mode)

(add-hook 'rspec-compilation-mode-hook
          (lambda ()
            (define-key rspec-compilation-mode-map "p" 'compilation-previous-error)
            (define-key rspec-compilation-mode-map "n" 'compilation-next-error)))

(setq rspec-use-rake-flag nil
      rspec-use-bundler-when-possible nil
      rspec-use-rvm nil
      rspec-bundle-p t)
