;;;; PACKAGES

(use-package ace-window
  :bind (("M-o" . ace-window)
         ("C-l a" . ace-swap-window))
  :init (setq aw-keys #'(?a ?s ?d ?f ?j ?k ?l)))

;; (use-package aggressive-indent :init (global-aggressive-indent-mode t))

(use-package avy
  :bind (("C-'" . avy-goto-char-2)
         ("C-l g" . avy-goto-line)
         ("C-l l" . avy-copy-line)
         ("M-g M-g" . avy-goto-line)
         :map isearch-mode-map ("C-'" . avy-isearch)))

(use-package auto-package-update)

(use-package company
  :diminish company-mode
  :bind (:map company-active-map
              (("C-n" . company-select-next-or-abort)
               ("C-p" . company-select-previous-or-abort)))
  :hook (after-init . global-company-mode)
  :init (setq company-idle-delay 0.1) ; delay (in s) before display suggestions
  (setq company-global-modes #'(not text-mode markdown-mode)))

(use-package diminish
  :diminish eldoc-mode visual-line-mode global-whitespace-mode whitespace-mode)

(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-mode t)
  :bind (:map drag-stuff-mode-map
              (("<M-up>" . drag-stuff-up)
               ("<M-down>" . drag-stuff-down)))
  :config
  (add-to-list #'drag-stuff-except-modes #'emacs-lisp-mode)
  (add-to-list #'drag-stuff-except-modes #'lisp-mode)
  (add-to-list #'drag-stuff-except-modes #'lisp-interaction-mode)
  (add-to-list #'drag-stuff-except-modes #'ielm-mode)
  (add-to-list #'drag-stuff-except-modes #'helm-mode)
  :hook (after-init . drag-stuff-define-keys))

(use-package git-commit)

(use-package hlinum :init (hlinum-activate))
(use-package magit :after git-commit)

(use-package origami
  :bind (("C-l o t" . origami-forward-toggle-node)
         ("C-l o p" . origami-previous-fold)
         ("C-l o n" . origami-forward-fold)
         ("C-l o b" . origami-backward-fold-same-level)
         ("C-l o f" . origami-forward-fold-same-level)
         ("C-l o c" . origami-close-node))
  :init (global-origami-mode))

(use-package paredit
  :config
  (add-to-list #'drag-stuff-except-modes #'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
  (add-hook 'ielm-mode-hook #'enable-paredit-mode)
  (add-hook 'lisp-mode-hook #'enable-paredit-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'paredit-mode)
  :bind (:map paredit-mode-map 
              ("C-l C-k" . paredit-hack-kill-region)))

(use-package pcmpl-git :after git-commit)
(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))
(use-package rainbow-mode :hook html-mode css-mode scss-mode)

(use-package rotate
  :bind(("C-l r w" . rotate-window)
        ("C-l r l" . rotate-layout)))

(use-package smart-mode-line
  :init (sml/setup)
  :config (setq sml/theme 'respectful))

(use-package thingatpt)

(use-package undo-tree
  :diminish undo-tree-mode
  :config (global-undo-tree-mode))

(use-package which-key
  :diminish which-key-mode
  :bind ("C-h j" . which-key-show-major-mode)
  :init (which-key-mode)
  (which-key-setup-side-window-right-bottom)
  :config (setq which-key-max-description-length 80)
  (setq which-key-popup-type #'side-window)
  (setq which-key-side-window-location #'(right bottom)))
