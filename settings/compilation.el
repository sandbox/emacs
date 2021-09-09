(require 'ansi-color)

(defun endless/colorize-compilation ()
  "Colorize from `compilation-filter-start' to `point'."
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region
     compilation-filter-start (point))))

(require 'compile)
(add-hook 'compilation-filter-hook #'endless/colorize-compilation)

(setq compilation-error-regexp-alist
     (delete 'maven compilation-error-regexp-alist))
(push 'jest-error compilation-error-regexp-alist)
(push '(jest-error
        "^[ ]*at .* (\\([^:]+\\):\\([[:digit:]]+\\):\\([[:digit:]]+\\))" 1 2)
      compilation-error-regexp-alist-alist)
