(provide 'yasnippet_extensions)

(defun insert_yardoc_comments_for_arguments ()
  (save-excursion
    (re-search-forward "def \\([a-zA-Z_0-9.?!]+\\)" nil t)
    (match-data)
    (let ((method-name (buffer-substring (match-beginning 1) (match-end 1)))
          ;; this assumes that ruby methods are defined on a single line
          (arguments-string (buffer-substring (match-end 1) (line-end-position))))
      (let ((args-list
             (remove-if
              (lambda (x) (string= x ""))
              (mapcar
               (lambda (arg) (car (split-string (replace-regexp-in-string "[ ()]" "" arg) "=")))
               (split-string arguments-string ",")))))
        (apply 'concat (mapcar (lambda (arg) (concat "\n# @param [${type}] " arg " ${description}")) args-list))
        )
      )
    )
  )

(defun insert_rdoc_comments_for_arguments ()
  (save-excursion
    (re-search-forward "def \\([a-zA-Z_0-9.?!]+\\)" nil t)
    (match-data)
    (let ((method-name (buffer-substring (match-beginning 1) (match-end 1)))
          ;; this assumes that ruby methods are defined on a single line
          (arguments-string (buffer-substring (match-end 1) (line-end-position))))
      (let ((args-list
             (remove-if
              (lambda (x) (string= x ""))
              (mapcar
               (lambda (arg) (car (split-string (replace-regexp-in-string "[ ()]" "" arg) "=")))
               (split-string arguments-string ",")))))
        (apply 'concat (mapcar (lambda (arg) (concat "#  " arg "<>::\n#    ${description}\n")) args-list))
        )
      )
    )
  )
