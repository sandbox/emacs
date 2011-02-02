;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (rspec-buffer-is-spec-p rspec-mode) "rspec-mode"
;;;;;;  "rspec-mode/rspec-mode.el" (19784 48834))
;;; Generated autoloads from rspec-mode/rspec-mode.el

(autoload 'rspec-mode "rspec-mode" "\
Minor mode for rSpec files

\(fn &optional ARG)" t nil)

(autoload 'rspec-buffer-is-spec-p "rspec-mode" "\
Returns true if the current buffer is a spec

\(fn)" nil nil)

(eval-after-load 'ruby-mode '(add-hook 'ruby-mode-hook (lambda nil (when (rspec-buffer-is-spec-p) (rspec-mode)))))

(eval-after-load 'ruby-mode '(add-hook 'ruby-mode-hook (lambda nil (local-set-key (kbd "C-c ,v") 'rspec-verify) (local-set-key (kbd "C-c ,a") 'rspec-verify-all) (local-set-key (kbd "C-c ,t") 'rspec-toggle-spec-and-target))))

(eval-after-load 'rails '(add-hook 'rails-minor-mode-hook (lambda nil (local-set-key (kbd "C-c ,v") 'rspec-verify) (local-set-key (kbd "C-c ,a") 'rspec-verify-all) (local-set-key (kbd "C-c ,t") 'rspec-toggle-spec-and-target))))

;;;***

;;;### (autoloads nil nil ("rspec-mode/rspec-mode-expectations.el")
;;;;;;  (19784 48834 718197))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
