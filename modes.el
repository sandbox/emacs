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
(add-to-list 'load-path "~/.emacs.d/lisp/rinari/util")
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(autoload 'inf-ruby-keys "inf-ruby" "" t)
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook 'inf-ruby-keys))

;; (setq load-path (cons (expand-file-name "~/.emacs.d/rails-reloaded") load-path))
;; (require 'rails-autoload)
