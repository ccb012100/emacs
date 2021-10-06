;;; Packages for specific file modes

(use-package js2-mode :mode "\\.js\\'")
(use-package json-mode :mode "\\.json\\'")
(use-package json-navigator)
(use-package csharp-mode)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc")
  :hook (markdown-mode . (lambda () (setq-local whitespace-line-column 120))))

(use-package syslog-mode :mode "/var/log.*\\'")

(use-package vimrc-mode
  :init (add-to-list #'auto-mode-alist #'("\\.vim\\(rc\\)?\\'" . vimrc-mode)))

(use-package yaml-mode :mode "\\.yml\\'")
