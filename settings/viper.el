;;
;;  Loading modes that didn't come default with emacs
;;
(setq viper-always nil
      viper-emacs-state-mode-list (quote (ack-mode fundamental-mode comint-mode magit-key-mode sql-mode dired-mode Custom-mode efs-mode tar-mode browse-kill-ring-mode recentf-mode recentf-dialog-mode occur-mode mh-folder-mode gnus-group-mode gnus-summary-mode completion-list-mode Info-mode compilation-mode rcirc-mode jde-javadoc-checker-report-mode view-mode vm-mode vm-summary-mode erc-mode eshell-mode shell-mode magit-show-branches-mode))
      viper-fast-keyseq-timeout 0
      viper-insert-state-mode-list (quote (internal-ange-ftp-mode gud-mode inferior-emacs-lisp-mode))
      viper-vi-state-mode-list (quote (help-mode Buffer-menu-mode makefile-mode awk-mode m4-mode xrdb-mode winmgr-mode autoconf-mode cvs-edit-mode html-mode html-helper-mode emacs-lisp-mode lisp-mode lisp-interaction-mode jde-mode java-mode cc-mode c-mode c++-mode objc-mode fortran-mode f90-mode basic-mode bat-mode asm-mode prolog-mode flora-mode text-mode indented-text-mode tex-mode latex-mode bibtex-mode ps-mode diff-mode idl-mode perl-mode cperl-mode javascript-mode tcl-mode python-mode sh-mode ksh-mode csh-mode gnus-article-mode mh-show-mode ruby-mode))
      )

(defun viper-cua-region-fix()
  (define-key viper-vi-global-user-map [backspace] 'backward-delete-char-untabify)
  (define-key viper-vi-global-user-map "\C-d" 'delete-char)
  (define-key viper-insert-global-user-map [backspace] 'backward-delete-char-untabify)
  (define-key viper-insert-global-user-map "\C-d" 'delete-char)
  (define-key viper-insert-basic-map "\C-e" 'viper-goto-eol)
  (define-key viper-vi-global-user-map "\C-e" 'viper-goto-eol)
  (define-key viper-insert-basic-map "\C-y" 'yank)
  (define-key viper-vi-basic-map "\C-y" 'vimpulse-Put-and-indent)
  (define-key viper-vi-basic-map "p" 'vimpulse-Put-and-indent)
  (define-key viper-vi-basic-map "P" 'vimpulse-put-and-indent)
  )
(eval-after-load 'viper '(viper-cua-region-fix))

(require 'vimpulse)

(defun viper-save ()
  (interactive)
  (if (eq viper-current-state 'emacs-state)
      (save-buffer)
    (progn
      (viper-exit-insert-state)
      (save-buffer))))

(defun viper-keyboard-quit ()
  (interactive)
  (if (eq viper-current-state 'emacs-state)
      (keyboard-quit)
    (progn
      (viper-exit-insert-state)
      (keyboard-quit))))
