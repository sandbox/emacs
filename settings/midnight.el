(require 'midnight)
(setq
 midnight-mode t
 clean-buffer-list-delay-general 1
 clean-buffer-list-kill-never-regexps (quote
                                       ("^ \\*Minibuf-.*\\*$" "\\*magit:.*\\*$" "\\*slime-repl.*\\*$"))
 )
