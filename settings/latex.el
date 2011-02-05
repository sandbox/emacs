;;========================================================================
;; Latex
;;========================================================================
(setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist))

(add-hook 'tex-mode-hook
          '(lambda ()
             (define-key tex-mode-map [f7] 'tex-compile)
             (setq fill-column 80); where auto-fill should wrap
             (turn-on-auto-fill)
             (flyspell-mode)))
