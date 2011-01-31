;;========================================================================
;; nxhtml mode
;;========================================================================
;; (load "~/.emacs.d/plugins/nxhtml/autostart.el")
;; (load "~/.emacs.d/lisp/multi-mode.el")

;;========================================================================
;; yasnippets - this adds some auto completion commands for several
;; languages
;;========================================================================
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(require 'yasnippet_extensions)
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;;========================================================================
;; php
;;========================================================================
;; (require 'php-mode)
;; (add-hook 'php-mode-hook
;;           '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))

;; (setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))

;;========================================================================
;; javascript
;;========================================================================
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

;;========================================================================
;; c sharp
;;========================================================================
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

;;========================================================================
;; shell-mode
;;========================================================================
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq ansi-term-color-vector
      [unspecified "gray3" "light coral" "pale green" "khaki"
                   "RoyalBlue2" "MediumPurple1" "sky blue" "gray98"])

;;========================================================================
;; MATLAB
;;========================================================================
(autoload 'matlab-mode "~/.emacs.d/matlab.el" "Enter Matlab mode." t)
(autoload 'matlab-shell "~/.emacs.d/matlab.el" "Interactive Matlab mode." t)

;; matlab mode for matlab
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))

(defun my-matlab-mode-hook ()
  (setq matlab-function-indent t); if you want function bodies indented
  (setq fill-column 76); where auto-fill should wrap
  (font-lock-mode 1)
  (turn-on-auto-fill)
  (if (not running-xemacs)
      (matlab-mode-hilit)))
(setq matlab-mode-hook 'my-matlab-mode-hook)

(defun my-matlab-shell-mode-hook ()
  (setq matlab-function-indent t); if you want function bodies indented
  (setq fill-column 76); where auto-fill should wrap
  (font-lock-mode 1))
(setq matlab-shell-mode-hook 'my-matlab-shell-mode-hook)

;;========================================================================
;; Latex
;;========================================================================


;;========================================================================
;; R
;;========================================================================
(require 'ess-site)


;;========================================================================
;; CSV
;;========================================================================
(require 'csv-mode)
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)

;;========================================================================
;; Markdown
;;========================================================================
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; ==============================================================================
;; MODE AUTOLOAD setup for extensions
;; ==============================================================================

;; processing mode
(setq auto-mode-alist (cons '("\\.pde$" . java-mode) auto-mode-alist))

;; flex mode for CS143 class
(setq auto-mode-alist (cons '("\\.lex$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.flex$" . c++-mode) auto-mode-alist))

;; figure out how to actually change the default using this for now.
(setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist))

;; figure out how to actually change the default using this for now.
(setq auto-mode-alist (cons '("\\.ru$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("^Rakefile$" . ruby-mode) auto-mode-alist))

;; (setq auto-mode-alist (cons '("\\.erb$" . eruby-nxhtml-mumamo-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.erb$" . html-mode) auto-mode-alist))


;;
;; MODES FOR RUBY ON RAILS SHIT
;;
(require 'ruby-electric)

(add-to-list 'load-path "~/.emacs.d/lisp/rinari/util")
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; (setq load-path (cons (expand-file-name "~/.emacs.d/rails-reloaded") load-path))
;; (require 'rails-autoload)

;;
;; BETTER GIT SUPPORT
;;
(require 'magit)

;;
;; textmate
;;
;; (add-to-list 'load-path "~/.emacs.d/vendor/textmate.el")
;; (require 'textmate)
;; (textmate-mode)


;; ==============================================================================
;; window management across sessions
;; ==============================================================================
(require 'switch-window)

(require 'windows)
(win:startup-with-window)
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

;; testing out the ido mode
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

;;(setq grep-find-use-xargs t) ;; uses xargs in grep-find
;; (setq grep-find-use-xargs nil)
;; (cua-mode t)

(put 'dired-find-alternate-file 'disabled nil)

;;
;;  Loading modes that didn't come default with emacs
;;

(defun viper-cua-region-fix()
  (define-key viper-vi-global-user-map [backspace] 'backward-delete-char-untabify)
  (define-key viper-vi-global-user-map "\C-d" 'delete-char)
  (define-key viper-insert-global-user-map [backspace] 'backward-delete-char-untabify)
  (define-key viper-insert-global-user-map "\C-d" 'delete-char)
  (define-key viper-vi-global-user-map "\C-e" 'viper-goto-eol)
  (define-key viper-vi-basic-map "p" 'vimpulse-Put-and-indent)
  (define-key viper-vi-basic-map "P" 'vimpulse-put-and-indent)
  )
(eval-after-load 'viper '(viper-cua-region-fix))

(require 'vimpulse)

;;
;; Loading a wrap region to enclose text in parentheses and shit!
;;
(require 'wrap-region)
(wrap-region-global-mode)

(require 'haml-mode)
