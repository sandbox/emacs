;; make sure to remove the undo-tree dependency from evil after evil downloads
;;  in evil-pkg remove undo-tree from define-package list in evil-pkg.el under .emacs.d/evil
;;
;; may need to change load-path for packages to be consistent
;; (add-to-list 'load-path "~/.emacs.d/evil")

(require 'evil)
(evil-mode 1)

(require 'evil-leader)
(global-evil-leader-mode)

(require 'evil-surround)
(global-evil-surround-mode nil)

(setq evil-ex-search-vim-style-regexp t
      evil-want-fine-undo t
      evil-leader/in-all-states nil
      evil-mode-line-format nil
      evil-move-cursor-back t
      evil-search-module 'evil-search)

(evil-leader/set-leader "<SPC>")
(setq-default evil-shift-width 2)

(add-to-list 'evil-emacs-state-modes 'git-rebase-mode)
(add-to-list 'evil-emacs-state-modes 'occur-mode)
(add-to-list 'evil-emacs-state-modes 'shell-mode)
(add-to-list 'evil-emacs-state-modes 'tar-mode)
(add-to-list 'evil-emacs-state-modes 'customize-mode)

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

;; key bindings
;; normal state
(define-key evil-normal-state-map (kbd "C-u") 'universal-argument)
(define-key evil-normal-state-map (kbd "u") 'undo)
(define-key evil-normal-state-map (kbd "C-r") 'isearch-backward-regexp)
(define-key evil-normal-state-map (kbd "C-y") 'evil-paste-before)
(define-key evil-normal-state-map (kbd "C-n") 'next-line)
(define-key evil-normal-state-map (kbd "C-p") 'previous-line)
(define-key evil-normal-state-map (kbd "P") 'evil-paste-after)
(define-key evil-normal-state-map (kbd "p") 'yank)
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "C-r") 'isearch-backward-regexp)

;; motion state
(define-key evil-motion-state-map (kbd "C-u") 'universal-argument)
(define-key evil-motion-state-map (kbd "C-d") 'delete-char)
(define-key evil-motion-state-map (kbd "C-e") 'evil-end-of-line)

;; insert-state
(define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-g") 'evil-keyboard-quit)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)
(define-key evil-insert-state-map (kbd "C-y") 'yank)
(define-key evil-insert-state-map (kbd "C-e") 'move-end-of-line)
(define-key evil-insert-state-map (kbd "C-x C-s") 'evil-normal-state-and-save)

;; evil leader
(evil-leader/set-key
  "'" 'delete-pair
  "=" 'ediff-buffers
  "a" 'helm-grep-do-git-grep
  "A" 'helm-grep-repo
  "b" 'ido-switch-buffer
  "B" 'ido-switch-buffer-other-window
  "c" 'compile
  "d" 'dired-jump
  "D" 'desktop-change-dir
  "e" 'er/expand-region
  "E" 'shell
  "f" 'helm-browse-project
  "F" 'ido-find-file-other-window
  "g" 'magit-status
  "k" 'kill-this-buffer
  "K" 'kill-buffer-and-window
  "o" 'browse-at-remote
  "Q" 'find-dired
  "s" 'rspec-verify-single
  "t" 'ido-goto-symbol
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
