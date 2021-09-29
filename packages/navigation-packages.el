;;;; packages for navigating through text/buffers/windows

(use-package ace-window
  :bind (("C-l a" . ace-swap-window))
  :init (setq aw-keys #'(?a ?s ?d ?f ?j ?k ?l)))

(use-package avy
  :bind (("C-'" . avy-goto-char-2)
         ("C-l g" . avy-goto-line)
         ("C-l l" . avy-copy-line)
         ("M-g M-g" . avy-goto-line)
         :map isearch-mode-map ("C-'" . avy-isearch)))

(use-package origami
  :bind (("C-l o t" . origami-forward-toggle-node)
         ("C-l o p" . origami-previous-fold)
         ("C-l o n" . origami-forward-fold)
         ("C-l o b" . origami-backward-fold-same-level)
         ("C-l o f" . origami-forward-fold-same-level)
         ("C-l o c" . origami-close-node))
  :init (global-origami-mode))

(use-package rotate
  :bind(("C-l r w" . rotate-window)
        ("C-l r l" . rotate-layout)))
