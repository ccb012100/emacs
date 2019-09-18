;;;; PACKAGES
;;;; located in ~/.emacs.d/packages.el

;;; SETUP
(require #'package)
(add-to-list #'package-archives #'("melpa" . "https://melpa.org/packages/") t)
(add-to-list #'package-archives
             #'("melpagnu" . "https://elpa.gnu.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(package-install-selected-packages)
(setq use-package-verbose t)
(setq use-package-always-ensure t)

;;; PACKAGES
(use-package aggressive-indent :init (global-aggressive-indent-mode t))
(use-package auto-package-update)
(use-package gruvbox-theme)
(use-package helm-descbinds :after helm :bind ("C-h b" . helm-descbinds))
(use-package helm-swoop :after helm :bind ("C-k f" . helm-swoop))
(use-package hlinum :init (hlinum-activate))
(use-package js2-mode :mode "\\.js\\'")
(use-package json-mode :mode "\\.json\\'")
(use-package json-navigator)
(use-package magit)
(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))
(use-package rainbow-mode :hook html-mode css-mode scss-mode)
(use-package color-theme-sanityinc-tomorrow)
(use-package smart-mode-line :init (sml/setup))
(use-package smartparens)
(use-package syslog-mode :mode "/var/log.*\\'")
(use-package thingatpt)
(use-package windmove)
(use-package yaml-mode :mode "\\.yml\\'")

(use-package ace-window
  :bind ("M-o" . ace-window)
  :init (setq aw-keys #'(?a ?s ?d ?f ?j ?k ?l)))

(use-package avy
  :bind (("C-'" . avy-goto-char-2)
         ("C-k l" . avy-copy-line)
         ("M-g M-g" . avy-goto-line)
         :map isearch-mode-map
         ("C-'" . avy-isearch)))

(use-package company
  :bind (:map company-active-map
              (("C-n" . company-select-next-or-abort)
               ("C-p" . company-select-previous-or-abort)))
  :hook (after-init . global-company-mode)
  :init (setq company-idle-delay 0) ;; no delay for suggestions
  (setq company-global-modes #'(not text-mode markdown-mode)))

(use-package drag-stuff
  :init (drag-stuff-global-mode 1)
  (drag-stuff-mode t)
  :hook (after-init . drag-stuff-define-keys))

(use-package helm
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("C-k C-o" . helm-buffers-list) ; less awkward that `C-x b`
         ("C-x m" . helm-mini)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-SPC" . helm-M-x)
         ("C-z" . select-action)
         ("M-y" . helm-show-kill-ring)
         :map helm-map
         ("<tab>" . helm-execute-persistent-action)
         :map helm-find-files-map
         ("C-<backspace>" . helm-find-files-up-one-level))
  :config (helm-mode 1)
  (ido-mode -1)
  (setq helm-split-window-inside-p t
        helm-move-to-line-cycle-in-source t
        helm-mode-fuzzy-match t
        helm-completion-in-region-fuzzy-match t))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

(use-package origami
  :bind (("C-k o t" . origami-forward-toggle-node)
         ("C-k o u" . origami-previous-fold)
         ("C-k o i" . origami-forward-fold)
         ("C-k o p" . origami-backward-fold-same-level)
         ("C-k o n" . origami-forward-fold-same-level)
         ("C-k o c" . origami-close-node))
  :init (setq global-origami-mode t))

(use-package undo-tree
  :diminish undo-tree-mode
  :config (global-undo-tree-mode))

(use-package vimrc-mode
  :init (add-to-list #'auto-mode-alist #'("\\.vim\\(rc\\)?\\'" . vimrc-mode)))

(use-package which-key
  :bind ("C-h j" . which-key-show-major-mode)
  :init (which-key-mode)
  (which-key-setup-minibuffer)
  :config (setq which-key-max-description-length 80)
  (setq which-key-popup-type #'side-window)
  (setq which-key-side-window-location #'(right bottom)))
