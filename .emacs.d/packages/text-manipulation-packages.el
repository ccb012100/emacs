;;;; packages for manipulating text

(use-package company
  :diminish company-mode
  :bind (:map company-active-map
              (("C-n" . company-select-next-or-abort)
               ("C-p" . company-select-previous-or-abort)))
  :hook (after-init . global-company-mode)
  :init (setq company-idle-delay 0.1) ; delay (in s) before display suggestions
  (setq company-global-modes #'(not text-mode markdown-mode)))

(use-package drag-stuff
  :init
  (drag-stuff-global-mode 1)
  (drag-stuff-mode t)
  :bind (:map drag-stuff-mode-map
              (("<M-up>" . drag-stuff-up)
               ("<M-down>" . drag-stuff-down)))
  :config
  (add-to-list #'drag-stuff-except-modes #'emacs-lisp-mode)
  (add-to-list #'drag-stuff-except-modes #'helm-mode)
  (add-to-list #'drag-stuff-except-modes #'ielm-mode)
  (add-to-list #'drag-stuff-except-modes #'lisp-interaction-mode)
  (add-to-list #'drag-stuff-except-modes #'lisp-mode)
  :hook (after-init . drag-stuff-define-keys))

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

(use-package thingatpt)

(use-package undo-tree
  :diminish undo-tree-mode
  :config (global-undo-tree-mode))
