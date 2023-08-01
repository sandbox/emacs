(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless package-archive-contents (package-refresh-contents))

(setq url-http-attempt-keepalives nil)

(use-package async :ensure t)

;; navigation
(use-package browse-at-remote :ensure t)
(use-package helm :ensure t)
(use-package helm-ls-git :ensure t)
(use-package helm-tree-sitter :ensure t)
(use-package magit :ensure t)

;; system
(use-package exec-path-from-shell :ensure t)

;; editing
(use-package expand-region :ensure t)
(use-package evil :ensure t)
(use-package evil-leader :ensure t)
(use-package evil-surround :ensure t)
(use-package evil-numbers :ensure t)
(use-package evil-textobj-tree-sitter :ensure t)
(use-package paredit :ensure t)
(use-package smart-tab :ensure t)

;; IDE-like support packages
(use-package tide
  :ensure t
  :after (company flycheck))

(use-package flycheck :ensure t)
(use-package dap-mode :ensure t)
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :custom
  (company-idle-delay 0))

;; major modes
(use-package elixir-mode :ensure t)
(use-package go-mode :ensure t)
(use-package csv-mode :ensure t)
(use-package json :ensure t)
(use-package lua-mode :ensure t)
(use-package markdown-mode :ensure t)
(use-package php-mode :ensure t)
(use-package python :ensure t)
(use-package ruby-mode :ensure t)
(use-package rspec-mode :ensure t)
(use-package sass-mode :ensure t)
(use-package scala-mode :ensure t)
(use-package scss-mode :ensure t)
(use-package web-mode :ensure t)
(use-package yaml-mode :ensure t)

;; minor modes
(use-package diminish :ensure t)
(use-package dash :ensure t)

;; misc
(use-package scratch :ensure t)

;; themes
(use-package zenburn-theme :ensure t)

;; emacs speaks statistics
(use-package ess :ensure t)

(require 'scratch)
