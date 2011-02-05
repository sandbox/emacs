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

(menu-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist (list (cons "." backup-dir))
      blink-cursor-mode nil
      column-number-mode t
      comment-style 'indent
      font-lock-maximum-decoration t
      inhibit-startup-message t
      inhibit-startup-screen t
      initial-scratch-message nil
      mac-command-modifier 'meta
      mac-option-modifier 'super
      next-screen-context-lines 5
      save-place-limit 20
      scroll-bar-mode nil
      scroll-conservatively 10000
      shift-select-mode nil
      show-paren-mode t
      standard-indent 4
      tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))
      text-mode-hook (quote (text-mode-hook-identify))

      linum-format (lambda (line)
                     (propertize (format
                                  (let ((w (length (number-to-string
                                                    (count-lines (point-min) (point-max))))))
                                    (concat "%" (number-to-string w) "d "))
                                  line)
                                 'face 'linum))
      )

(setq-default truncate-lines t
              indent-tabs-mode nil)

(delete-selection-mode t)
(global-font-lock-mode t)
(desktop-save-mode 1)
