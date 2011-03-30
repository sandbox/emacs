(defun john-svn-ediff ()
    "using ediff for version diff"
    (interactive)
    (ediff-revision . (buffer-file-name)))

(defun save-window-layout () (interactive) (window-configuration-to-register ?z))
(defun load-window-layout () (interactive) (jump-to-register ?z))

(defun other-frame-1 () "does previous frame"
  (interactive)
  (other-frame -1))
(defun other-window-1 ()
  "does previous window"
  (interactive)
  (other-window -1))
(defun asdfd ()
  "sets my font to the thing I like on stanfords unix machines\nwhich is why it has such a ridiculous name"
  (interactive)
  (set-frame-font "-bitstream-Bitstream Vera Sans Mono-normal-normal-normal-*-12-*-*-*-m-0-iso10646-1"))

(defun delete-until-pattern ()
   "deletes until the given pattern"
   (interactive)
   (let ((regexp (read-from-minibuffer "Enter Pattern to delete until: ")))
     (let ((beg (point))
           (end (progn (search-forward-regexp regexp)
                       (search-backward-regexp regexp))))
       (delete-region beg end))))

;;
;; taken from tassilo's blog
;; 
(defun zap-to-string (arg str)
  "Same as `zap-to-char' except that it zaps to the given string
instead of a char."
  (interactive "p\nsZap to string: ")
  (kill-region (point) (progn
                         (search-forward str nil nil arg)
                         (point))))

(defun zap-to-regexp (arg regexp)
  "Same as `zap-to-char' except that it zaps to the given regexp
instead of a char."
  (interactive "p\nsZap to regexp: ")
  (kill-region (point) (progn
                         (re-search-forward regexp nil nil arg)
                         (point))))

;;
;; windows specific
;;

(make-variable-frame-local 'my-frame-state)
(defun my-frame-maximize ()
  "Maximize Emacs window in win32"
  (interactive)
  (modify-frame-parameters nil '((my-frame-state . t)))
  (w32-send-sys-command ?\xf030))

(defun my-frame-restore ()
   "Restore Emacs window in win32"
   (interactive)
   (modify-frame-parameters nil '((my-frame-state . nil)))
   (w32-send-sys-command ?\xF120))

(defun my-frame-toggle ()
  "Maximize/Restore Emacs frame based on `my-frame-state'"
  (interactive)
  (if my-frame-state
          (my-frame-restore)
        (my-frame-maximize)))

(global-set-key [(meta return)] 'my-frame-toggle)
