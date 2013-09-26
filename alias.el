;; -*- emacs-lisp -*-
;;
;; a file for my aliases

(define-key global-map "\C-xo" 'next-multiframe-window)
(define-key global-map "\C-xp" 'previous-multiframe-window)

(define-key global-map "\C-cc" 'comment-region)
(define-key global-map "\C-cv" 'uncomment-region)

;; (define-key global-map "\C-c\C-c" 'compile)
;; (define-key global-map [f7] 'compile)

(define-key global-map "\C-cs" 'shell)
(define-key global-map "\C-c;ss" 'bash-term)
(define-key global-map (kbd "C-'") 'bash-term)
(define-key global-map (kbd "C-x C-'") 'term)

(define-key global-map "\M-/" 'smart-tab)

(define-key global-map "\C-x\C-b" 'anything-mini)
(define-key global-map "\C-xnb" 'rename-buffer)

(define-key global-map [(right)] 'windmove-right)
(define-key global-map [(left)] 'windmove-left)
(define-key global-map [(down)] 'windmove-down)
(define-key global-map [(up)] 'windmove-up)

(define-key global-map "\C-ci" 'ido-goto-symbol) ; or any key you see fit

(define-key global-map (kbd "M-[ 5 c") 'forward-word)
(define-key global-map (kbd "M-[ 5 D") 'backward-word)
(define-key global-map "\M-[5c" 'forward-word)
(define-key global-map "\M-[5d" 'backward-word)
(define-key global-map [mouse-4] 'previous-line)
(define-key global-map [mouse-5] 'next-line)

;;(define-key global-map "\C-j" 'newline-and-indent) ;; this is what it was
;;(define-key global-map "\C-l" 'recenter) ;; this is what it was
;; (define-key global-map "\M-p" 'backward-paragraph)
;; (define-key global-map "\M-n" 'forward-paragraph)


;; I really dislike this binding
;; (define-key global-map "\C-x\C-x" 'exchange-point-and-mark)
;; (define-key global-map "\C-x\C-p" 'mark-page)
(define-key global-map "\C-x\C-p" nil)
(define-key global-map "\C-m" 'newline-and-indent)

(define-key global-map "\C-xwl" 'highlight-lines-matching-regexp)
(define-key global-map "\C-xwh" 'highlight-regexp)
(define-key global-map "\C-xwr" 'unhighlight-regexp)
(define-key global-map (kbd "C-c C-a") 'align-regexp)

(define-key global-map "\C-c\C-t" 'toggle-truncate-lines)

(define-key global-map "\C-c\C-f" 'grep-find)
(define-key global-map "\C-cf" 'grep-find)
(define-key global-map "\C-xf" 'anything)
(define-key global-map "\M-%" 'query-replace-regexp)
(define-key global-map "\C-s" 'isearch-forward-regexp)
(define-key global-map "\C-r" 'isearch-backward-regexp)
(define-key global-map "\M-g" 'goto-line)

;; zapping to string/regexp and the like
(define-key global-map (kbd "M-Z") 'zap-to-string)
(define-key global-map (kbd "M-z") 'zap-to-regexp)
(define-key global-map (kbd "C-M-z") 'zap-to-char)

(define-key global-map "\C-c\C-r" 'recursive-edit)

(define-key global-map "\C-xwe" 'ediff)
(define-key global-map "\C-xwd" 'diff)
(define-key global-map "\C-xv=" 'vc-diff)
(define-key global-map "\C-xve" 'john-svn-ediff)

(define-key global-map "\C-c;sp" 'sql-postgres)
(define-key global-map "\C-c;sb" 'sql-set-sqli-buffer)

(define-key global-map [C-f12] 'save-window-layout)
(define-key global-map [f12]    'load-window-layout)

(define-key global-map "\C-c;js" 'javascript-mode)
(define-key global-map "\C-c;jh" 'sgml-mode)

(define-key global-map "\C-c;jj" 'nrepl-jack-in)

(define-key global-map "\C-c;f" 'follow-mode)
(define-key global-map [backtab] 'table-backward-cell)

(define-key global-map "\C-xm" 'magit-status)
(define-key global-map "\C-cM" 'magit-status)

(define-key global-map "\C-xr\C-@" 'cua-set-rectangle-mark)

(define-key global-map "\C-cw" 'whitespace-cleanup)

;;(define-key global-map "\C-xs" 'viper-save)
;; (define-key global-map "\C-c;v" 'toggle-viper-mode)
;; (define-key global-map "\C-x\C-s" 'viper-save)
;;(define-key global-map "\C-g" 'viper-keyboard-quit)
