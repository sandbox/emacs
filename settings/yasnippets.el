;;========================================================================
;; yasnippets - this adds some auto completion commands for several
;; languages
;;========================================================================
;; (require 'yasnippet)
;; (require 'yasnippet_extensions)
;; (setq yas/root-directory '("~/.emacs.d/snippets" "~/.emacs.d/el-get/yasnippet/snippets"))

;; (yas/initialize)
;; (mapc 'yas/load-directory yas/root-directory)

;; (setq
;;  hippie-expand-try-functions-list (quote
;;                                    (yas/hippie-try-expand
;;                                     try-complete-file-name-partially
;;                                     try-complete-file-name
;;                                     try-expand-all-abbrevs
;;                                     try-expand-list
;;                                     try-expand-line
;;                                     try-expand-dabbrev
;;                                     try-expand-dabbrev-all-buffers
;;                                     try-expand-dabbrev-from-kill
;;                                     try-complete-lisp-symbol-partially
;;                                     try-complete-lisp-symbol
;;                                     )))

;; (defun insert_yardoc_comments_for_arguments ()
;;   (save-excursion
;;     (re-search-forward "def \\([a-zA-Z_0-9.?!]+\\)" nil t)
;;     (match-data)
;;     (let ((method-name (buffer-substring (match-beginning 1) (match-end 1)))
;;           ;; this assumes that ruby methods are defined on a single line
;;           (arguments-string (buffer-substring (match-end 1) (line-end-position))))
;;       (let ((args-list
;;              (remove-if
;;               (lambda (x) (string= x ""))
;;               (mapcar
;;                (lambda (arg) (car (split-string (replace-regexp-in-string "[ ()]" "" arg) "=")))
;;                (split-string arguments-string ",")))))
;;         (apply 'concat (mapcar (lambda (arg) (concat "\n# @param [${type}] " arg " ${description}")) args-list))
;;         )
;;       )
;;     )
;;   )

;; (defun insert_rdoc_comments_for_arguments ()
;;   (save-excursion
;;     (re-search-forward "def \\([a-zA-Z_0-9.?!]+\\)" nil t)
;;     (match-data)
;;     (let ((method-name (buffer-substring (match-beginning 1) (match-end 1)))
;;           ;; this assumes that ruby methods are defined on a single line
;;           (arguments-string (buffer-substring (match-end 1) (line-end-position))))
;;       (let ((args-list
;;              (remove-if
;;               (lambda (x) (string= x ""))
;;               (mapcar
;;                (lambda (arg) (car (split-string (replace-regexp-in-string "[ ()]" "" arg) "=")))
;;                (split-string arguments-string ",")))))
;;         (apply 'concat (mapcar (lambda (arg) (concat "#  " arg "<>::\n#    ${description}\n")) args-list))
;;         )
;;       )
;;     )
;;   )
