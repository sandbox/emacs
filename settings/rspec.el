(setq rspec-use-rake-flag nil
      rspec-use-bundler-when-possible nil
      rspec-use-rvm nil)

(defun rspec-verify-single ()
  "Runs the specified example at the point of the current buffer."
  (interactive)
  (rspec-run-single-file (concat (rspec-spec-file-for (buffer-file-name)) ":" (number-to-string (line-number-at-pos)))
                         (rspec-core-options ())))
