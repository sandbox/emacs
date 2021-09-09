(require 'flycheck)
(require 'web-mode)

(setq js-indent-level 2
      web-mode-markup-indent-offset 2
      web-mode-attr-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-code-indent-offset 2
      web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))

(defun web-mode-ident-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2
        web-mode-attr-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'web-mode-use-tabs)
(add-hook 'web-mode-hook 'web-mode-ident-hook)

;; Typescript

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  ;; (company-mode +1)
  )

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(add-hook 'web-mode-hook
          (lambda ()
            (when (or (string-equal "tsx" (file-name-extension buffer-file-name)) (string-equal "tsx" (file-name-extension buffer-file-name)))
              (setup-tide-mode))))

;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(setq tide-tsserver-executable "node_modules/typescript/bin/tsserver")
(setq tide-format-options
      '(:indentSize 2 :tabSize 2 :insertSpaceAfterFunctionKeywordForAnonymousFunctions t :placeOpenBraceOnNewLineForFunctions nil))

;;========================================================================
;; javascript
;;========================================================================
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mjs$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.mjs$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.bundle.*\\.js$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es6$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\." . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.js\\.coffee$" . coffee-mode))

;; =======================================================================
;;  generic web development stuff
;; =======================================================================
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))
(setq coffee-tab-width 2)
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
