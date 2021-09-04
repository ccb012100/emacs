;;;; packages for enhancing Emacs display/UI

(use-package diminish
  :diminish
  eldoc-mode
  global-whitespace-mode
  visual-line-mode
  whitespace-mode)

(use-package hlinum :init (hlinum-activate))
(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))
(use-package rainbow-mode :hook html-mode css-mode scss-mode)

(use-package smart-mode-line
  :init (sml/setup)
  :config (setq sml/theme 'respectful))
