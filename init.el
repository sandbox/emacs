(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins")

(require 'color-theme)
(color-theme-initialize)

(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(ibuffer-saved-filter-groups nil)
 '(ibuffer-saved-filters (quote (("builder-stats" ((filename . "main/work_code/builder/public/javascripts"))) ("builder_stats" (filename . "main/work_code/builder/public/javascripts/milkshake/stats/")) ("gnus" ((or (mode . message-mode) (mode . mail-mode) (mode . gnus-group-mode) (mode . gnus-summary-mode) (mode . gnus-article-mode)))) ("programming" ((or (mode . emacs-lisp-mode) (mode . cperl-mode) (mode . c-mode) (mode . java-mode) (mode . idl-mode) (mode . lisp-mode)))))))
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
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
      `((menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (cursor-type . bar)
        (mouse-color . "grey")))
;; default-frame-alist is defined in terms of initial-frame-alist.  Don't
;; use copy-sequence here -- it doesn't copy the list elements, just the
;; list's cons cells.  Use copy-alist instead.
(setq default-frame-alist (copy-alist initial-frame-alist))

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

;;
;;  Loading modes that didn't come default with emacs
;;
(load-file "~/.emacs.d/modes.el")
(load-file "~/.emacs.d/hooks.el")

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

;; making sure the emacs also deals with paths correctly for different systems
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
    ;; mostly exec-path information for the mac
    (setq shell-file-name "bash")
    (setenv "SHELL" shell-file-name)
    (setq exec-path (cons "/opt/local/sbin" exec-path))
    (setq exec-path (cons "/opt/local/bin" exec-path))
    (setq exec-path (cons "/opt/local/lib/postgresql84/bin" exec-path))
    (setq exec-path (cons "/usr/local/git/bin" exec-path))
    (setq exec-path (cons "/usr/texbin" exec-path))
    (setenv "PATH" (concat "/usr/local/git/bin:" (getenv "PATH")))
    (setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
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
    ;; some stupid mac shit
    (set-face-attribute 'region nil :background "gray20")
    (global-hl-line-mode 1)
    (setq default-frame-alist
	  (append
	   '((cursor-type . (bar . 1)))
           default-frame-alist))
    (set-default-font "-*-DejaVu Sans Mono-*-*-*-*-14-*-*-*-m-0-iso10646-1")
    (if (fboundp 'blink-cursor-mode) (blink-cursor-mode 0))))

;; for emailing with emacs!
(setq mail-archive-file-name "~/.emacs.d/sentmail")
(defconst user-mail-address "johnle@cs.stanford.edu")

(set-register ?e '(file . "~/.emacs.d/init.el"))

;; ==============================================================================
;; window management across sessions
;; ==============================================================================
(require 'windows)
(win:startup-with-window)

(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

;;;(define-key ctl-x-map "C" 'see-you-again)

;; testing out the ido mode
(ido-mode t)
(setq ido-enable-flex-matching t) ;; enable fuzzy matching

(setq grep-find-use-xargs t) ;; uses xargs in grep-find
;; (cua-mode t)

(put 'dired-find-alternate-file 'disabled nil)
