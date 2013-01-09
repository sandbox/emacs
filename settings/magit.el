(require 'magit)

(defun magit-merge-no-ff (revision)
  "Merge REVISION into the current 'HEAD'; leave changes uncommitted.
With a prefix-arg, the merge will be squashed.
\('git merge --no-commit [--squash|--no-ff] REVISION')."
  (interactive
   (list (magit-read-rev "Merge (Manually)" (magit-default-rev))))
  (if revision
      (apply 'magit-run-git
             "merge"
             (magit-rev-to-git revision)
             '("--no-ff"))))

(defun magit-log-all (&optional arg)
  (interactive "P")
  (magit-display-log arg "--all"))

(defun magit-prune-origin (&optional arg)
  (interactive)
  (magit-run-git-async "remote" "prune" "origin"))

(defun magit-clean-local-branches (&optional arg)
  (interactive)
  (shell-command "git branch | grep -v develop | grep -v master | xargs git branch -d"))

(defun magit-merge-develop (&optional arg)
  (interactive)
  (magit-run-git "merge" "origin/develop"))

(magit-define-command push ()
  (interactive)
  (let* ((branch (or (magit-get-current-branch)
		     (error "Don't push a detached head.  That's gross")))
	 (branch-remote (magit-get-remote branch))
	 (push-remote (if (or current-prefix-arg
			      (not branch-remote))
			  (magit-read-remote (format "Push %s to: " branch)
					     branch-remote)
			branch-remote))
	 (ref-branch (magit-get "branch" branch "merge")))
    (if (and (not branch-remote)
	     (not current-prefix-arg))
	(magit-set push-remote "branch" branch "remote"))
    (apply 'magit-run-git-async "push" "-v" push-remote
           (if ref-branch
               (format "%s:%s" branch ref-branch)
             branch)
           magit-custom-options)
    (magit-set push-remote "branch" branch "remote")
    ;; Although git will automatically set up the remote,
    ;; it doesn't set up the branch to merge (at least as of Git 1.6.6.1),
    ;; so we have to do that manually.
    (unless ref-branch
      (magit-set (concat "refs/heads/" branch) "branch" branch "merge"))))

(setq magit-mode-map
      (let ((map (make-keymap)))
        (suppress-keymap map t)
        (define-key map (kbd "n") 'magit-goto-next-section)
        (define-key map (kbd "p") 'magit-goto-previous-section)
        (define-key map (kbd "TAB") 'magit-toggle-section)
        (define-key map (kbd "<backtab>") 'magit-expand-collapse-section)
        (define-key map (kbd "1") 'magit-show-level-1)
        (define-key map (kbd "2") 'magit-show-level-2)
        (define-key map (kbd "3") 'magit-show-level-3)
        (define-key map (kbd "4") 'magit-show-level-4)
        (define-key map (kbd "M-1") 'magit-show-level-1-all)
        (define-key map (kbd "M-2") 'magit-show-level-2-all)
        (define-key map (kbd "M-3") 'magit-show-level-3-all)
        (define-key map (kbd "M-4") 'magit-show-level-4-all)
        (define-key map (kbd "M-h") 'magit-show-only-files)
        (define-key map (kbd "M-H") 'magit-show-only-files-all)
        (define-key map (kbd "M-s") 'magit-show-level-4)
        (define-key map (kbd "M-S") 'magit-show-level-4-all)
        (define-key map (kbd "g") 'magit-refresh)
        (define-key map (kbd "G") 'magit-refresh-all)
        (define-key map (kbd "?") 'magit-describe-item)
        (define-key map (kbd ":") 'magit-git-command)
        (define-key map (kbd "C-x 4 a") 'magit-add-change-log-entry-other-window)
        (define-key map (kbd "RET") 'magit-visit-item)
        (define-key map (kbd "SPC") 'magit-show-item-or-scroll-up)
        (define-key map (kbd "DEL") 'magit-show-item-or-scroll-down)
        (define-key map (kbd "C-w") 'magit-copy-item-as-kill)
        (define-key map (kbd "R") 'magit-rebase-step)
        (define-key map (kbd "$") 'magit-display-process)
        (define-key map (kbd "c") 'magit-log-edit)
        (define-key map (kbd "E") 'magit-interactive-rebase)
        (define-key map (kbd "e") 'magit-ediff)
        (define-key map (kbd "w") 'magit-wazzup)
        (define-key map (kbd "q") 'magit-quit-window)
        ;; my additions
        (define-key map (kbd "V") 'magit-show-branches)
        (define-key map (kbd "J") 'magit-prune-origin)
        (define-key map (kbd "Y") 'magit-key-mode-popup-pushing)
        (define-key map (kbd "H") 'magit-merge-develop)
        (define-key map (kbd "N") 'magit-clean-local-branches)
        ;; my changes
        (define-key map (kbd "!") 'magit-shell-command)
        (define-key map (kbd "t") 'magit-tag)
        (define-key map (kbd "r") 'magit-key-mode-popup-rewriting)
        (define-key map (kbd "P") 'magit-push)
        (define-key map (kbd "f") 'magit-fetch-current)
        (define-key map (kbd "b") 'magit-checkout)
        (define-key map (kbd "B") 'magit-create-branch)
        (define-key map (kbd "F") 'magit-pull)
        (define-key map (kbd "l") 'magit-display-log)
        (define-key map (kbd "L") 'magit-log-all)
        map))

(setq magit-status-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "-") 'magit-diff-smaller-hunks)
        (define-key map (kbd "+") 'magit-diff-larger-hunks)
        (define-key map (kbd "0") 'magit-diff-default-hunks)
        (define-key map (kbd "s") 'magit-stage-item)
        (define-key map (kbd "S") 'magit-stage-all)
        (define-key map (kbd "u") 'magit-unstage-item)
        (define-key map (kbd "U") 'magit-unstage-all)
        (define-key map (kbd "i") 'magit-ignore-item)
        (define-key map (kbd "I") 'magit-ignore-item-locally)
        (define-key map (kbd ".") 'magit-mark-item)
        (define-key map (kbd "=") 'magit-diff-with-mark)
        (define-key map (kbd "d") 'magit-diff-working-tree)
        (define-key map (kbd "D") 'magit-diff)
        (define-key map (kbd "a") 'magit-apply-item)
        (define-key map (kbd "A") 'magit-cherry-pick-item)
        (define-key map (kbd "v") 'magit-revert-item)
        (define-key map (kbd "k") 'magit-discard-item)
        (define-key map (kbd "C") 'magit-add-log)
        (define-key map (kbd "x") 'magit-reset-head)
        (define-key map (kbd "X") 'magit-reset-working-tree)
        ;; my changes
        (define-key map (kbd "b") 'magit-checkout)
        (define-key map (kbd "m") 'magit-merge-no-ff)
        (define-key map (kbd "M") 'magit-merge)
        (define-key map (kbd "z") 'magit-stash)
        map))

(setq magit-log-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd ".") 'magit-mark-item)
        (define-key map (kbd "=") 'magit-diff-with-mark)
        (define-key map (kbd "d") 'magit-diff-working-tree)
        (define-key map (kbd "D") 'magit-diff)
        (define-key map (kbd "a") 'magit-apply-item)
        (define-key map (kbd "A") 'magit-cherry-pick-item)
        (define-key map (kbd "v") 'magit-revert-item)
        (define-key map (kbd "x") 'magit-reset-head)
        (define-key map (kbd "e") 'magit-log-show-more-entries)
        ;; my changes
        (define-key map (kbd "b") 'magit-checkout)
        (define-key map (kbd "B") 'magit-create-branch)
        (define-key map (kbd "m") 'magit-merge-no-ff)
        (define-key map (kbd "M") 'magit-merge)
        (define-key map (kbd "l") 'magit-display-log)
        (define-key map (kbd "t") 'magit-tag)
        map))

(setq magit-wazzup-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd ".") 'magit-mark-item)
        (define-key map (kbd "=") 'magit-diff-with-mark)
        (define-key map (kbd "d") 'magit-diff-working-tree)
        (define-key map (kbd "D") 'magit-diff)
        (define-key map (kbd "a") 'magit-apply-item)
        (define-key map (kbd "A") 'magit-cherry-pick-item)
        (define-key map (kbd "v") 'magit-revert-item)
        (define-key map (kbd "x") 'magit-reset-head)
        (define-key map (kbd "i") 'magit-ignore-item)
        ;; my changes
        (define-key map (kbd "b") 'magit-checkout)
        (define-key map (kbd "B") 'magit-create-branch)
        (define-key map (kbd "m") 'magit-merge-no-ff)
        (define-key map (kbd "M") 'magit-merge)
        map))

(define-minor-mode magit-commit-mode
  "Minor mode to view a git commit.

\\{magit-commit-mode-map}"
  :group magit
  :init-value ()
  :lighter ()
  :keymap magit-commit-mode-map)

(define-minor-mode magit-status-mode
  "Minor mode for looking at git status.

\\{magit-status-mode-map}"
  :group magit
  :init-value ()
  :lighter ()
  :keymap magit-status-mode-map)

(define-minor-mode magit-stash-mode
  "Minor mode for looking at a git stash.

\\{magit-stash-mode-map}"
  :group magit
  :init-value ()
  :lighter ()
  :keymap magit-stash-mode-map)

(define-minor-mode magit-log-mode
  "Minor mode for looking at git log.

\\{magit-log-mode-map}"
  :group magit
  :init-value ()
  :lighter ()
  :keymap magit-log-mode-map)

(define-minor-mode magit-reflog-mode
  "Minor mode for looking at git reflog.

\\{magit-reflog-mode-map}"
  :group magit
  :init-value ()
  :lighter ()
  :keymap magit-reflog-mode-map)

(define-minor-mode magit-diff-mode
  "Minor mode for looking at a git diff.

\\{magit-diff-mode-map}"
  :group magit
  :init-value ()
  :lighter ()
  :keymap magit-diff-mode-map)

(define-minor-mode magit-wazzup-mode
  "Minor mode for looking at commits that could be merged from other branches.

\\{magit-wazzup-mode-map}"
  :group magit
  :init-value ()
  :lighter ()
  :keymap magit-wazzup-mode-map)

(defalias 'magit-log 'magit-display-log)
