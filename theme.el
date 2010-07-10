;;; -*- Mode: Emacs-Lisp -*-
;;; my color theme for terminal using default ansi
;;; 
;;; the default foreground color should be
;;; RGB: 170 170 170

(require 'color-theme)
;;-------------------------------------------------------------------------
;; Color Theme for use in the terminal!
;;-------------------------------------------------------------------------
(defun my-terminal-color-theme ()
  (interactive)
  (color-theme-install
   '(my-terminal-color-theme
     ((background-color . nil)
      (foreground-color . nil)
      (background-mode . dark))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t :underline t))))
     (border ((t (:foreground "black" :background "white"))))
     ;; (buffer-menu-buffer ((t ())))
     ;; (completions-common-part ((t ())))
     ;; (completions-first-difference ((t ())))
     ;;(cursor ((t ())))
     ;; (default ((t (nil))))

     (cua-global-mark ((t (:background "blue" :foreground "white"))))
     (cua-rectangle ((t (:background "yellow" :foreground "black"))))
     (cua-rectangle-noselect ((t (:background "yellow" :foreground "blue"))))

     (diff-refine-change ((t (:background "yellow" :foreground "black"))))
     
     (ediff-current-diff-A ((t (:background "green" :foreground "black"))))
     (ediff-current-diff-Ancestor ((t (:background "red" :foreground "black"))))
     (ediff-current-diff-B ((t (:background "cyan" :foreground "black"))))
     (ediff-current-diff-C ((t (:background "magenta" :foreground "black"))))
     
     (ediff-even-diff-A ((t (:background "white" :foreground "green"))))
     (ediff-even-diff-Ancestor ((t (:background "white" :foreground "red"))))
     (ediff-even-diff-B ((t (:background "white" :foreground "blue"))))
     (ediff-even-diff-C ((t (:background "white" :foreground "black"))))
     
     (ediff-fine-diff-A ((t (:background "white" :foreground "black"))))
     (ediff-fine-diff-Ancestor ((t (:background "white" :foreground "black"))))
     (ediff-fine-diff-B ((t (:background "white" :foreground "black"))))
     (ediff-fine-diff-C ((t (:background "white" :foreground "black"))))
     
     (ediff-odd-diff-A ((t (:background "white" :foreground "green"))))
     (ediff-odd-diff-Ancestor ((t (:background "white" :foreground "red"))))
     (ediff-odd-diff-B ((t (:background "white" :foreground "blue"))))
     (ediff-odd-diff-C ((t (:background "white" :foreground "black"))))
     
     ;; (erc-action-face ((t (nil))))
     ;; (erc-bold-face ((t (:bold t :weight bold))))
     ;; (erc-command-indicator-face ((t (:bold t :weight bold))))
     ;; (erc-dangerous-host-face ((t (:foreground "red"))))
     ;; (erc-default-face ((t (nil))))
     ;; (erc-notice-face ((t (:foreground "#878899"))))
     ;; (erc-prompt-face ((t (:bold t :foreground "GoldenRod3" :weight bold))))
     ;; (erc-timestamp-face ((t (:bold nil :foreground "gray45" :weight normal))))
     ;; (escape-glyph ((t ())))
     ;; (file-name-shadow ((t ())))
     ;; (fixed-patch ((t ())))
     (font-latex-math-face ((t (:foreground "green"))))
     (font-lock-builtin-face ((t (:foreground "cyan"))))
     (font-lock-comment-delimiter-face ((t (:foreground "red")))) 
     (font-lock-comment-face ((t (:foreground "red"))))
     (font-lock-constant-face ((t (:foreground "white" :bold t))))
     (font-lock-doc-face ((t (:foreground "red"))))
     (font-lock-doc-string-face ((t (:foreground "red"))))
     (font-lock-function-name-face ((t (:foreground "magenta"))))
     (font-lock-keyword-face ((t (:bold t)))) ;; :foreground "orange"
     ;; (font-lock-negation-char-face ((t (:foreground ""))))
     (font-lock-preprocessor-face ((t (:foreground "white"))))
     (font-lock-reference-face ((t (:foreground "red"))))
     ;; (font-lock-regexp-grouping-backslash ((t (:foreground "blue")))))
     ;; (font-lock-regexp-grouping-blackslash ((t (:foreground "blue"))))
     ;; (font-lock-regexp-grouping-construct ((t (:foreground "green"))))
     (font-lock-string-face ((t (:foreground "green"))))
     (font-lock-type-face ((t (:foreground "cyan"))))
     (font-lock-variable-name-face ((t (:foreground "yellow"))))
     (font-lock-warning-face ((t (:foreground "white" :background "red"))))
     (fringe ((t (:foreground "black" :background "white"))))
     (header-line ((t (:underline t :background "white" :foreground "black"))))
     (hl-line ((t (:background "white" :foreground "black"))))
     ;; (highlight ((t ())))
     (highlight-changes      ((t (:inverse-video t))))
     ;; (highlight-changes-1      ((t (:inverse-video t))))
     ;; (highlight-changes-2      ((t (:background "white"))))
     ;; (highlight-changes-3      ((t (:background "white"))))
     ;; (highlight-changes-4      ((t (:background "white"))))
     ;; (highlight-changes-5      ((t (:background "white"))))
     ;; (highlight-changes-6      ((t (:background "white"))))
     (highlight-changes-delete ((t (:background "red"))))
     (isearch ((t (:underline t :background "magenta" :foreground "black"))))
     (isearch-fail ((t (:underline t :background "red" :foreground "black"))))
     (italic ((t (:inverse-video t))))
     (lazy-highlight ((t (:background "cyan" :foreground "black" :underline t :overline t))))
     ;; (link ((t ())))
     ;; (link-visited ((t ())))
     ;; (match ((t ())))
     (menu ((t (:background "white" :foreground "black"))))
     (minibuffer-prompt ((t (:foreground "magenta"))))
     (mode-line ((t (:inverse-video t)))) ;; :background "white" :foreground "black"
     (mode-line-buffer-id ((t ())))
     ;; (mode-line-highlight ((t (:inverse-video t))))
     (mode-line-inactive ((t (:background "white" :foreground "black" :inverse-video t))))
     ;; (mouse ((t (:background "black"))))
     (next-error ((t (:background "red" :foreground "white" :underline t))))
     (nobreak-space ((t (:background "magenta" :foreground "white" :underline t))))
     ;; (query-replace ((t ())))
     ;; (region ((t (:inverse-video t))))
     (region ((t (:background "blue" :foreground "white"))))
     ;; (scroll-bar ((t ())))
     ;; (secondary-selection ((t ())))
     ;; (shadow ((t ())))
     (show-paren-match ((t (:background "green" :foreground "black"))))
     ;; (show-paren-mismatch ((t ())))
     (tool-bar ((t (:background "black" :foreground "white" :underline t))))
     ;; (tooltip
     (trailing-whitespace ((t (:background "red" :foreground "red"))))
     ;; (underline
     ;; (variable-pitch
     ;; (veritcal-border
     (viper-minibuffer-emacs ((t (:background "black" :foregound "magenta"))))
     (viper-minibuffer-insert ((t (:background "black" :foreground "magenta"))))
     (viper-search ((t (:underline t :background "magenta" :foreground "black"))))
     ;; (widget-button-pressed
     ;; (widget-documentation
     ;; (widget-field
     ;; (widget-single-line-field
     ;; (yas/field-debug-face ((t (:background "black"))))
     (yas/field-highlight-face ((t (:background "magenta" :foreground "black"))))
     ;; (widget-button
     (mumamo-background-chunk-major ((t (:background nil))))
     (mumamo-background-chunk-submode1 ((t (:background "black"))))
     (mumamo-background-chunk-submode2 ((t (:background "black"))))
     (mumamo-background-chunk-submode3 ((t (:background "black"))))
     (mumamo-background-chunk-submode4 ((t (:background "black"))))
     )))
