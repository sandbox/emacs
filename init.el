(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/plugins")
(let ((default-directory "~/.emacs.d/lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

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
 '(css-indent-offset 2)
 '(grep-find-command "find . -type f -print | xargs -n1 grep -nH -e ")
 '(grep-find-template "find . <X> -type f <F> -print | xargs -n1 grep <C> -nH -e <R>")
 '(ibuffer-saved-filter-groups (quote (("c2_vm" ("gluestick_vm" (filename . "main/code/gluestick_vm")) ("clients" (filename . "main/code/clients")) ("gluestick" (filename . "main/code/gluestick")) ("microsoft" (filename . "main/jobs/Microsoft")) ("skunkworks" (filename . "main/code/skunkworks")) ("shell" (mode . shell-mode)) ("builder" (filename . "main/code/builder"))) ("gluestick_vm" ("clients" (filename . "main/code/clients")) ("gluestick" (filename . "main/code/gluestick")) ("microsoft" (filename . "main/jobs/Microsoft")) ("skunkworks" (filename . "main/code/skunkworks")) ("shell" (mode . shell-mode)) ("builder" (filename . "main/code/builder"))) ("clients" ("gluestick" (filename . "main/code/gluestick")) ("microsoft" (filename . "main/jobs/Microsoft")) ("skunkworks" (filename . "main/code/skunkworks")) ("shell" (mode . shell-mode)) ("builder" (filename . "main/code/builder"))) ("chef" ("skunkworks" (filename . "main/code/skunkworks")) ("shell" (mode . shell-mode)) ("builder" (filename . "main/code/builder"))) ("john" ("c2_vm" (filename . "main/code/c2")) ("gluestick_vm" (filename . "main/code/gluestick_vm")) ("clients" (filename . "main/code/clients")) ("gluestick" (filename . "main/code/gluestick")) ("microsoft" (filename . "main/jobs/Microsoft")) ("skunkworks" (filename . "main/code/skunkworks")) ("shell" (mode . shell-mode)) ("builder" (filename . "main/code/builder"))))))
 '(ibuffer-saved-filters (quote (("gluestick_vm" (saved . "gluestick_vm") (filename . "main/code/gluestick_vm")) ("clients" (filename . "main/code/clients")) ("gnus" ((or (mode . message-mode) (mode . mail-mode) (mode . gnus-group-mode) (mode . gnus-summary-mode) (mode . gnus-article-mode)))) ("programming" ((or (mode . emacs-lisp-mode) (mode . cperl-mode) (mode . c-mode) (mode . java-mode) (mode . idl-mode) (mode . lisp-mode)))))))
 '(ruby-deep-arglist nil)
 '(ruby-deep-indent-paren nil)
 '(save-place t nil (saveplace))
 '(save-place-limit 20)
 '(scroll-bar-mode nil)
 '(shift-select-mode nil)
 '(show-paren-mode t)
 '(standard-indent 4)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(text-mode-hook (quote (text-mode-hook-identify)))
 '(viper-always nil)
 '(viper-emacs-state-mode-list (quote (Custom-mode efs-mode tar-mode browse-kill-ring-mode recentf-mode recentf-dialog-mode occur-mode mh-folder-mode gnus-group-mode gnus-summary-mode completion-list-mode Info-mode compilation-mode rcirc-mode jde-javadoc-checker-report-mode view-mode vm-mode vm-summary-mode erc-mode eshell-mode shell-mode)))
 '(viper-fast-keyseq-timeout 0)
 '(viper-insert-state-mode-list (quote (internal-ange-ftp-mode comint-mode gud-mode inferior-emacs-lisp-mode)))
 '(viper-vi-state-mode-list (quote (dired-mode help-mode Buffer-menu-mode fundamental-mode makefile-mode awk-mode m4-mode xrdb-mode winmgr-mode autoconf-mode cvs-edit-mode html-mode html-helper-mode emacs-lisp-mode lisp-mode lisp-interaction-mode jde-mode java-mode cc-mode c-mode c++-mode objc-mode fortran-mode f90-mode basic-mode bat-mode asm-mode prolog-mode flora-mode sql-mode text-mode indented-text-mode tex-mode latex-mode bibtex-mode ps-mode diff-mode idl-mode perl-mode cperl-mode javascript-mode tcl-mode python-mode sh-mode ksh-mode csh-mode gnus-article-mode mh-show-mode ruby-mode))))
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

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-ignore-buffers-re "^\\*")

;;enable syntax highlight by default
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq next-screen-context-lines 5)
(setq-default indent-tabs-mode nil)

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

(load-file "~/.emacs.d/alias.el")
(load-file "~/.emacs.d/theme.el")
(my-terminal-color-theme)
(load-file "~/.emacs.d/modes.el")
(load-file "~/.emacs.d/hooks.el")

;; for emailing with emacs!
(setq mail-archive-file-name "~/.emacs.d/sentmail")
(defconst user-mail-address "johnle@cs.stanford.edu")

(set-register ?e '(file . "~/.emacs.d/init.el"))
