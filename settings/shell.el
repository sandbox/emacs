;;========================================================================
;; shell-mode
;;========================================================================
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq ansi-term-color-vector
      [unspecified "gray3" "light coral" "pale green" "khaki"
                   "RoyalBlue2" "MediumPurple1" "sky blue" "gray98"])
