;;========================================================================
;; javascript
;;========================================================================
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.js\\." . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq js-indent-level 2)

;; =======================================================================
;;  generic web development stuff
;; =======================================================================
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))
(setq coffee-tab-width 2)
