;;;; PACKAGES
;(use-package git-commit)
;(use-package magit :after git-commit)
;(use-package pcmpl-git :after git-commit)

(use-package auto-package-update
  :bind ("C-c u" . auto-package-update-now))

(use-package which-key
  :diminish which-key-mode
  :bind ("C-h j" . which-key-show-major-mode)
  :init (which-key-mode)
  (which-key-setup-side-window-right-bottom)
  :config (setq which-key-max-description-length 80)
  (setq which-key-popup-type #'side-window)
  (setq which-key-side-window-location #'(right bottom)))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; commented out because it's failing to download from melpa
;; (use-package tree-sitter
;;   :init (use-package tree-sitter-langs))
