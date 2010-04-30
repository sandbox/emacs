(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins")

(require 'color-theme)
(color-theme-initialize)

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;;(tool-bar-mode -1)
;;(menu-bar-mode -1)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(save-place t nil (saveplace))
 '(save-place-limit 20)
 '(scroll-bar-mode nil)
 '(shift-select-mode nil)
 '(show-paren-mode t)
 '(standard-indent 4)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(text-mode-hook (quote (text-mode-hook-identify))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(setq initial-frame-alist
      `(
        ;; (font . ,(if (getenv "XTERM_VERSION")
        ;;              "-bitstream-Bitstream Vera Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"
        ;;            "-bitstream-Bitstream Vera Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
        ;;(icon-type . t)
        (cursor-type . bar)
        ;;(height . 30)
        ;;(width . 80)
        (mouse-color . "grey")))
;; default-frame-alist is defined in terms of initial-frame-alist.  Don't
;; use copy-sequence here -- it doesn't copy the list elements, just the
;; list's cons cells.  Use copy-alist instead.
(setq default-frame-alist (copy-alist initial-frame-alist))

;;(scroll-bar-mode -1)
(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq-default truncate-lines t)
(delete-selection-mode t)
(setq comment-style 'indent)
(setq scroll-conservatively 10000)

;;enable syntax highlight by default
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq next-screen-context-lines 5)
(setq-default indent-tabs-mode nil)

;;========================================================================
;; Yasnippets - this adds some auto completion commands for several
;; languages
;;========================================================================
;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

;;========================================================================
;; php
;;========================================================================

(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))

(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))

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
;; Hooks
;;========================================================================

;; Setting some C/C++ mod stuff
(add-hook 'c-mode-hook
          '(lambda ()
             (global-set-key "\C-cr" 'compile)))
(add-hook 'c++-mode-hook
          '(lambda ()
             (global-set-key "\C-cr" 'compile)))

(setq c-default-style "bsd" c-basic-offset 2)
;;

(add-hook 'tex-mode-hook
          '(lambda ()
             ;; (define-key tex-mode-map "\C-j" 'backward-word)
             ;; (define-key tex-mode-map "\M-j" 'tex-terminate-paragraph)
             (define-key tex-mode-map [f7] 'tex-compile)
             (setq fill-column 80); where auto-fill should wrap
             (turn-on-auto-fill)))

(require 'csv-mode)
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)

;;==============================================================================
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
;;==============================================================================
(defvar autosave-dir
 (concat "~/.emacs.d/emacs_autosaves/" (user-login-name) "/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "~/.emacs.d/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))
;;====== end auto save code =====

;;
;; Things do after I save a file
;;
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p t)
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(if (and (equal (getenv "OS") "Windows_NT")
         (not (string-match "[cC]ygwin"
                            (or (getenv "XTERM_VERSION") "oops"))))
    (progn
      ;; This assumes that Cygwin is installed in C:\cygwin (the
      ;; default) and that C:\cygwin\bin is not already in your
      ;; Windows Path (it generally should not be).
      ;;
      (setq exec-path (cons "C:/cygwin/bin" exec-path))
      (setenv "PATH" (concat "C:\\cygwin\\bin;" (getenv "PATH")))
      ;;
      ;; NT-emacs assumes a Windows command shell, which you change
      ;; here.
      ;;
      (setq shell-file-name "bash")
      (setenv "SHELL" shell-file-name)
      (setq explicit-shell-file-name shell-file-name)
      ;;
      ;; This removes unsightly ^M characters that would otherwise
      ;; appear in the output of java applications.
      ;;
      (add-hook 'comint-output-filter-functions
                'comint-strip-ctrl-m))
  (progn
    (setq shell-file-name "bash")
    (setenv "SHELL" shell-file-name)
    (setq exec-path (cons "/opt/local/sbin" exec-path))
    (setq exec-path (cons "/opt/local/bin" exec-path))
    (setq exec-path (cons "/opt/local/lib/postgresql83/bin" exec-path))
    (setq exec-path (cons "/usr/local/git/bin" exec-path))
    (setenv "PATH" (concat "/usr/local/git/bin:" (getenv "PATH")))
    ))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq ansi-term-color-vector
      [unspecified "gray3" "light coral" "pale green" "khaki"
                   "RoyalBlue2" "MediumPurple1" "sky blue" "gray98"])

;;
;; Sets my aliases last has stuff specific for terminal or window
;;
(load-file "~/.emacs.d/alias.el")
(if (not window-system)
    (progn
      (load-file "~/.emacs.d/theme.el")
      (my-terminal-color-theme))
  (progn
    (load-file "~/.emacs.d/window-theme.el")
    (my-color-theme)
    (global-hl-line-mode 1)
    (setq default-frame-alist
	  (append
	   '(;;(width . 80)
	     ;;(height . 30)
	     (cursor-type . (bar . 1)))
           default-frame-alist))
    ;;(set-default-font "-misc-fixed-medium-r-normal--13-100-100-100-c-70-iso8859-1")
    ;;(set-default-font "lucidasanstypewriter-bold-14")
    ;;(set-default-font "-Bitstream-Charter-normal-normal-normal-*-15-*-*-*-*-*-iso10646-1")
    ;;(set-default-font "-bitstream-Bitstream Vera Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1")
    (set-default-font "-*-DejaVu Sans Mono-*-*-*-*-14-*-*-*-m-0-iso10646-1")
    ;;(set-default-font "-Misc-Fixed-Medium-R-Normal--20-200-75-75-C-100-ISO8859-1")
    ;;(set-default-font "-schumacher-clean-bold-r-normal--16-160-75-75-c-80-iso646.1991-irv")
    (if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))))

;; for emailing with emacs!
(setq mail-archive-file-name "~/.emacs.d/sentmail")
(defconst user-mail-address "johnle@cs.stanford.edu")

(set-register ?e '(file . "~/.emacs.d/init.el"))

;; ==============================================================================
;; things needed for class
;; ==============================================================================

;; processing mode
(setq auto-mode-alist (cons '("\\.pde$" . java-mode) auto-mode-alist))

;; flex mode for CS143 class
(setq auto-mode-alist (cons '("\\.lex$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.flex$" . c++-mode) auto-mode-alist))

;; figure out how to actually change the default using this for now.
(setq auto-mode-alist (cons '("\\.tex$" . latex-mode) auto-mode-alist))


;; ==============================================================================
;; window management across sessions
;; ==============================================================================
(require 'windows)
(win:startup-with-window)

(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

;;;(define-key ctl-x-map "C" 'see-you-again)

;; some stupid mac shit
(set-face-attribute 'region nil :background "gray20")

;; testing out the ido mode
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching
