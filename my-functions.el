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

(defun bash-term ()
  (interactive)
  (term "bash"))



(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))
