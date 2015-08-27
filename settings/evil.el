(evil-mode 1)
(global-undo-tree-mode -1)
(global-evil-leader-mode)
(require 'evil-leader)

(setq evil-ex-search-vim-style-regexp t
      evil-want-fine-undo t
      evil-leader/in-all-states t
      evil-mode-line-format nil
      evil-move-cursor-back t
      evil-search-module 'evil-search)

(evil-leader/set-leader "<SPC>")
(setq-default evil-shift-width 2)

(loop for (mode . state) in
      '(
        (nrepl-mode                . normal)
        (Info-mode                 . emacs)
        (ack-mode                  . emacs)
        (comint-mode               . emacs)
        (compilation-mode          . emacs)
        (rspec-compilation-mode    . emacs)
        (completion-list-mode      . emacs)
        (custom-mode               . emacs)
        (erc-mode                  . emacs)
        (eshell-mode               . emacs)
        (inferior-ess-mode         . emacs)
        (magit-key-mode            . emacs)
        (dired-mode                . emacs)
        (Custom-mode               . emacs)
        (efs-mode                  . emacs)
        (tar-mode                  . emacs)
        (magit-branch-manager-mode . emacs)
        (magit-log-edit-mode       . emacs)
        (grep-mode                 . emacs)
        (occur-mode                . emacs)
        (shell-mode                . emacs)
        (sql-interactive-mode      . emacs)
        (sql-mode                  . emacs)
        (view-mode                 . emacs)
        (inferior-emacs-lisp-mode  . emacs)
        )
      do (evil-set-initial-state mode state))

;; key bindings
(fill-keymap evil-normal-state-map
             ;; "SPC"   'ace-jump-char-mode
             "C-u"   'universal-argument
             "u"     'undo
             "C-r"   'isearch-backward-regexp
             "C-y"   'evil-paste-before
             "C-n"   'next-line
             "C-p"   'previous-line
             "P"     'evil-paste-after
             "p"     'yank
             "C-c +" 'evil-numbers/inc-at-pt
             "C-c -" 'evil-numbers/dec-at-pt)

(fill-keymap evil-motion-state-map
             (kbd "C-u") 'universal-argument
             (kbd "C-d") 'delete-char
             (kbd "C-e") 'evil-end-of-line)

(defun evil-keyboard-quit ()
  (interactive)
  (if (eq evil-state 'insert)
      (progn
        (evil-normal-state)
        (keyboard-quit))
    (keyboard-quit)))

(defun evil-normal-state-and-save ()
  (interactive)
  (if (eq evil-state 'insert)
      (progn
        (evil-normal-state)
        (save-buffer))
    (save-buffer)))

(fill-keymap evil-insert-state-map
             (kbd "C-d") 'delete-char
             (kbd "C-g") 'evil-keyboard-quit
             (kbd "C-k") 'kill-line
             (kbd "C-y") 'yank
             (kbd "C-e") 'move-end-of-line
             (kbd "C-x C-s") 'evil-normal-state-and-save)

;; evil leader
(evil-leader/set-key
  "a" 'grep-find
  "b" 'ido-switch-buffer
  "B" 'ido-switch-buffer-other-window
  "d" 'dired-jump
  "e" 'er/expand-region
  "E" 'shell
  "f" 'anything
  "F" 'ido-find-file-other-window
  "g" 'magit-status
  "k" 'kill-this-buffer
  "K" 'kill-buffer-and-window
  "o" 'browse-url-of-file
  "s" 'rspec-verify-single
  "t" 'ido-goto-symbol
  "T" 'clojure-jump-between-tests-and-code
  "v" 'rspec-verify
  "w" 'evil-write)

(defun evil-undefine ()
  (interactive)
  (let (evil-mode-map-alist)
    (call-interactively (key-binding (this-command-keys)))))

(define-key evil-motion-state-map [left] 'evil-undefine)
(define-key evil-motion-state-map [right] 'evil-undefine)
(define-key evil-motion-state-map [up] 'evil-undefine)
(define-key evil-motion-state-map [down] 'evil-undefine)

;; compilation mode
(add-hook 'compilation-mode-hook '(lambda ()
                                    (local-unset-key "h")
                                    (local-unset-key "0")))

;; org mode
(evil-declare-key 'normal org-mode-map
  "za"        'org-cycle
  "zA"        'org-shifttab
  "zc"        'hide-subtree
  "zC"        'org-hide-block-all
  "zm"        'hide-body
  "zo"        'show-subtree
  "zO"        'show-all
  "zr"        'show-all
  (kbd "RET") 'org-open-at-point
  (kbd "M-j") 'org-shiftleft
  (kbd "M-k") 'org-shiftright
  (kbd "M-H") 'org-metaleft
  (kbd "M-J") 'org-metadown
  (kbd "M-K") 'org-metaup
  (kbd "M-L") 'org-metaright)
