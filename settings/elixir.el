(require 'eglot)

;; This is optional. It automatically runs `M-x eglot` for you whenever you are in `elixir-mode`
(add-hook 'elixir-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs `(elixir-mode "~/sandbox/elixir-ls/release/language_server.sh"))
