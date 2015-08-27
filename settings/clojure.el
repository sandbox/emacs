(require 'clojure-mode)
(require 'clojure-test-mode)
(require 'nrepl)

;; for jumping to clojure test in test/namespace/test/file.clj directory structure
(defun john-clojure-test-for (namespace)
  (let* ((thing (split-string namespace "/")))
    (mapconcat 'identity (append (append (butlast thing 1) '("test")) (last thing 1)) "/")))

(defun clojure-jump-to-test ()
  "Jump from implementation file to test."
  (interactive)
  (find-file (format "%stest/%s.clj"
                     (file-name-as-directory
                      (locate-dominating-file buffer-file-name "src/"))
                     (john-clojure-test-for (clojure-test-for (clojure-find-ns))))))


;; for jumping to clojure implemenation from test in src/namespace/file.clj directory structure
(defun clojure-test-implementation-for (namespace)
  "Returns the path of the src file for the given test namespace."
  (let* ((namespace (clojure-underscores-for-hyphens namespace))
         (segments (split-string namespace "\\."))
         (impl-segments (append (butlast segments 2) (last segments 1))))
    (format "%s/src/%s.clj"
            (locate-dominating-file buffer-file-name "src/")
            (mapconcat 'identity impl-segments "/"))))

(eval-after-load "clojure-mode"
  '(progn
     (defun clojure-paredit-hook () (paredit-mode +1))
     (add-hook 'clojure-mode-hook 'clojure-paredit-hook)
     (defun clojure-indent-hook ()
       (define-clojure-indent (clone-for 1) (at 1)))
     (add-hook 'clojure-mode-hook 'clojure-indent-hook)))

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-tab-command 'indent-for-tab-command)
