;; John Le
;; Color theme for use in a window system, 
;; at the moment made particular for a mac.
;; use all colors you want lol
;;
;;-------------------------------------------------------------------------
;; Color Theme for use in a window system
;;-------------------------------------------------------------------------
(defun my-color-theme ()
  (interactive)
  (color-theme-install
   '(my-color-theme
     ((background-color . "gray8") ;; black, gray5 
      (foreground-color . "gray80") ;; gray90
      (cursor-color . "green")     
      (background-mode . dark))
     (bold ((t (:bold t)))) ;;  :foreground "aquamarine4"
     (bold-italic ((t (:italic t :bold t))))
     (border ((t (:foreground "DimGray" 
                  :background "dark slate grey"))))
     (button ((t 
               ((supports :underline t)) 
               (:box (:line-width 2 
                      :color "grey75" 
                      :style released-button) 
                :underline t))))
     (buffer-menu-buffer ((t (:foreground "white"))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))
     (completions-common-part ((t (:foreground "green3"))))
     (completions-first-difference ((t (:foreground "gray"))))
     ;; (cursor ((t ())))
     ;; (default ((t (:family "monaco" :bold t)))) 
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
     (font-lock-builtin-face ((t (:foreground "#789bff")))) ;; RoyalBlue2
     (font-lock-comment-delimiter-face ((t (:foreground "#D31414"))))  ;;indian red, :bold t "RoyalBlue2"
     (font-lock-comment-face ((t (:foreground "#D31414")))) ;; indian red :bold t "RoyalBlue2"
     (font-lock-constant-face ((t (:foreground "#ffec8c")))) ;; f2e5a1, df9a4f ,LightGoldenrod
     (font-lock-doc-face ((t (:foreground "#D31414")))) ;; indian red, :bold t "RoyalBlue2"
     (font-lock-doc-string-face ((t (:foreground "#D31414")))) ;; indian red, :bold t "RoyalBlue2"
     (font-lock-function-name-face ((t (:foreground "#C461F2")))) ;; #B75EE0 #AD5FA5 #D31414 #ff30b0 e63c6c e639b2 b45d99 4db5ff, 4da0ff, 4d94ff orchid, DodgerBlue1
     (font-lock-keyword-face ((t (:foreground "#ffaa00")))) ;; ffa200, ff8000, ee8e07, DarkOrange2
     ;; (font-lock-negation-char-face ((t (:foreground ""))))
     (font-lock-preprocessor-face ((t (:foreground "RosyBrown4"))))
     (font-lock-reference-face ((t (:foreground "#D31414")))) ;; indian red, :bold t "RoyalBlue2"
     ;; (font-lock-regexp-grouping-backslash ((t (:foreground "blue")))))
     ;; (font-lock-regexp-grouping-construct ((t (:foreground "green"))))
     (font-lock-string-face ((t (:foreground "#82E02A")))) ;; #ff2f3f f33e35 #21d921, LimeGreen sometimes make this italic
     (font-lock-type-face ((t (:foreground "#3bc4ff")))) ;; #f33e35, SteelBlue
     (font-lock-variable-name-face ((t (:foreground "#F5ED51")))) ;; c97cff , sometimes italic MediumPurple1
     (font-lock-warning-face ((t (:foreground "white" :background "red"))))
     ;;(font-latex-math-face ((t (:foreground "green"))))
     
     (fringe ((t (:foreground "DimGray" :background "gray8"))))
     (header-line ((t (:background "white" :foreground "black"))))
     (hl-line ((t (:background "#090933")))) ;; #131740 midnight blue, quite possibly the best color for a very dark background
     ;; (highlight ((t ())))
     (isearch ((t (:underline t :background "magenta" :foreground "black"))))
     (isearch-fail ((t (:underline t :background "red" :foreground "black"))))
     (italic ((t (:italic t))))
     (lazy-highlight ((t (:background "white" :foreground "black" :underline t))))  ;; SlateBlue1
     (link ((t (:foreground "blue1" :underline t))))
     (link-visited ((t (:foreground "black" :background "blue1" :underline t))))
     ;; (match ((t ())))
     (menu ((t (:background "white" :foreground "black"))))
     ;; (minibuffer ((t (:background "white"))))
     (minibuffer-prompt ((t (:foreground "DeepSkyBlue"))))
     (mode-line ((t (:background "green2" 
                     :foreground "black" 
                     :box (:line-width 2
                           :color "grey" 
                           :style released-button)))))
     (mode-line-highlight ((((class color) (min-colors 88))
                            (:background "black" 
                             :foreground "white" 
                             :box (:line-width 1
                                   :color "grey40" 
                                   :style pressed-button)))))
     (mode-line-inactive ((t (:background "gray95" :foreground "gray5" ;; :inverse-video t 
                              :box (:line-width 1
                                    :color "grey75" 
                                    :style pressed-button)))))
     ;; (mode-line ((t (:background "white" :foreground "black"))))
     (mode-line-buffer-id ((t (:foreground "black"))))
     (mode-line-emphasis ((t (:foreground "black"))))
     ;; (mode-line-highlight ((t (:inverse-video t))))
     ;; (mode-line-inactive ((t (:inverse-video t))))
     ;; (mouse ((t (:background "black"))))
     (next-error ((t (:background "red" :foreground "white" :underline t))))
     ;; (nobreak-space ((t ())))
     ;; (query-replace ((t ())))
     (region ((t (:background "gray20")))) ;; 0f0f06 090933 #100a38 120c52 navy :background "gray15" 
     ;; (region ((t (:inverse-video t))))
     ;; (scroll-bar ((t ())))
     ;; (secondary-selection ((t ())))
     ;; (shadow ((t ())))
     (show-paren-match ((t (:background "gray15" :foreground "LimeGreen"))))  ;; black #c97cff
     (show-paren-mismatch ((t (:background "red"))))
     ;; (tool-bar
     ;; (tooltip
     ;; (trailing-whitespace ((t (:background "red" :foreground "red"))))
     ;; (underline
     ;; (variable-pitch
     ;; (veritcal-border
     ;; (widget-button 
     ;; (widget-button-pressed
     ;; (widget-documentation
     ;; (widget-field
     ;; (widget-single-line-field
     )))

;;      ((background-color . "black")
;;       (foreground-color . "gray")
;;       (cursor-color . "white")
;;       (mouse-color . "white")
;;       (background-mode . dark))
;;      (default ((t (nil))))
;;      (bold ((t (:bold t))))
;;      (bold-italic ((t (:bold t))))
;;      (italic ((t (:italic t))))
;;      (cursor ((t (:foreground "black"))))
;;      (font-lock-builtin-face ((t (:foreground "#E67321"))))
;;      (font-lock-comment-face ((t (:italic t :foreground "#8722c9"))))
;;      (font-lock-doc-string-face ((t (t :foreground "#00b200"))))
;;      (font-lock-string-face ((t (:foreground "#00b200"))))
;;      (font-lock-constant-face ((t (:foreground "DodgerBlue2"))))
;;      (font-lock-function-name-face ((t (:italic t :foreground "magenta"))))
;;      (font-lock-type-face ((t (:foreground "SteelBlue2"))))
;;      (font-lock-keyword-face ((t (:foreground "#E67321"))))
;;      (font-lock-preprocessor-face ((t (:foreground "8722c9"))))
;;      (font-lock-reference-face ((t (:foreground "red3"))))
;;      (font-lock-variable-name-face ((t (:foreground "pink"))))
;;      (font-lock-warning-face ((t (:foreground "red"))))
;;      (font-lock-string-face ((t (:foreground "salmon"))))
;;      (erc-action-face ((t (nil))))
;;      (erc-notice-face ((t (:foreground "#878899"))))
;;      (erc-bold-face ((t (:bold t :weight bold))))
;;      (erc-command-indicator-face ((t (:bold t :weight bold))))
;;      (erc-dangerous-host-face ((t (:foreground "red"))))
;;      (erc-default-face ((t (nil))))
;;      (erc-timestamp-face ((t (:bold nil :foreground "gray45" :weight normal))))
;;      (erc-prompt-face ((t (:bold t :foreground "GoldenRod3" :weight bold))))
;;      (trailing-whitespace ((t (:background "red")))))))