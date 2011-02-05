;; making sure the emacs also deals with paths correctly for different systems
(if (and (equal (getenv "OS") "Windows_NT")
         (not (string-match "[cC]ygwin"
                            (or (getenv "XTERM_VERSION") "oops"))))
    (progn
      ;; This assumes that Cygwin is installed in C:\cygwin (the
      ;; default) and that C:\cygwin\bin is not already in your
      ;; Windows Path (it generally should not be).
      ;;
      (setq exec-path (cons "C:/cygwin/bin" exec-path))
      (setenv "PATH" (concat "C:\\cygwin\\bin;" (getenv "PATH")))
      ;;
      ;; NT-emacs assumes a Windows command shell, which you change
      ;; here.
      ;;
      (setq shell-file-name "bash")
      (setenv "SHELL" shell-file-name)
      (setq explicit-shell-file-name shell-file-name)
      ;;
      ;; This removes unsightly ^M characters that would otherwise
      ;; appear in the output of java applications.
      ;;
      (add-hook 'comint-output-filter-functions
                'comint-strip-ctrl-m))
  (progn
    ;; mostly exec-path information for the mac
    (setq shell-file-name "bash")
    (setenv "SHELL" shell-file-name)
    (setq exec-path (cons "/opt/local/sbin" exec-path))
    (setq exec-path (cons "/opt/local/bin" exec-path))
    (setq exec-path (cons "/opt/local/lib/postgresql84/bin" exec-path))
    (setq exec-path (cons "/usr/local/git/bin" exec-path))
    (setq exec-path (cons "/usr/texbin" exec-path))
    (setq exec-path (cons "/usr/local/bin" exec-path))
    (setenv "PATH" (concat "/usr/local/git/bin:" (getenv "PATH")))
    (setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))
    (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
    ))
