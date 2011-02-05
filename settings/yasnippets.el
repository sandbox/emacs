;;========================================================================
;; yasnippets - this adds some auto completion commands for several
;; languages
;;========================================================================
;; (require 'yasnippet)
;; (require 'yasnippet_extensions)
(setq yas/root-directory '("~/.emacs.d/snippets" "~/.emacs.d/el-get/yasnippet/snippets"))

(yas/initialize)
(mapc 'yas/load-directory yas/root-directory)

(setq
 hippie-expand-try-functions-list (quote
                                   (yas/hippie-try-expand
                                    try-complete-file-name-partially
                                    try-complete-file-name
                                    try-expand-all-abbrevs
                                    try-expand-list
                                    try-expand-line
                                    try-expand-dabbrev
                                    try-expand-dabbrev-all-buffers
                                    try-expand-dabbrev-from-kill
                                    try-complete-lisp-symbol-partially
                                    try-complete-lisp-symbol
                                    )))
