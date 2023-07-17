(message "loading mac specific settings")

(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

(exec-path-from-shell-initialize)
(when (eq system-type 'darwin) (customize-set-variable 'native-comp-driver-options '("-Wl,-w")))

;;
;; someone's blog on copy and pasting between mac and emacs
;;
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)

(setq interprogram-paste-function 'copy-from-osx)
