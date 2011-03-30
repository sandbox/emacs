(message "loading the ubuntu specific settings")

(setq shell-file-name "bash")
(setenv "SHELL" shell-file-name)
(setq exec-path (cons "/usr/local/bin" exec-path))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
