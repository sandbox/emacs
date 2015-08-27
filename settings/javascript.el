;;========================================================================
;; javascript
;;========================================================================
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\." . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.js\\.coffee$" . coffee-mode))
(autoload 'javascript-mode "javascript" nil t)
(setq js-indent-level 2)

;; =======================================================================
;;  generic web development stuff
;; =======================================================================
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))
(setq coffee-tab-width 2)
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
