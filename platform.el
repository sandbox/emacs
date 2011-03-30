(let ((home-dir (getenv "HOME")))
  (cond
   ;; ubuntu
   ((equal home-dir "/home/john")
    (load-file "~/.emacs.d/platform/ubuntu.el"))
   ;; mac
   ((equal home-dir "/Users/john")
    (load-file "~/.emacs.d/platform/mac.el"))
   ;; windows...
   (t
    (load-file "~/.emacs.d/platform/windows.el"))
   ))
