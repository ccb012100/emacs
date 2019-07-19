;;;
;;; PACKAGES
;;;

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpagnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(package-install-selected-packages)

(setq use-package-verbose t)
(setq use-package-always-ensure t)

(use-package magit)
(use-package smartparens)
(use-package thingatpt)
(use-package windmove)

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc"))

(use-package company
  :hook (after-init . global-company-mode))

(use-package drag-stuff
  :init (drag-stuff-global-mode 1)
  (drag-stuff-mode t)
  :hook (after-init . drag-stuff-define-keys))

(use-package helm
  :bind (("C-b" . helm-buffers-list)
         ("M-x" . helm-M-x)
		 ("C-x C-f" . helm-find-files)
		 ("C-x b" . helm-buffers-list)
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
        helm-move-to-line-cycle-in-source t))

(use-package helm-descbinds
  :after helm
  :bind ("C-h b" . helm-descbinds))

(use-package ace-window
  :bind ("M-o" . ace-window)
  :init (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)))

(use-package doom-themes
  :after neotree)

;; TODO: figure out how to include these in (use-package doom-themes)
(set-theme-dark)
(doom-themes-neotree-config)
(doom-themes-visual-bell-config)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :hook prog-mode)

;; (use-package dashboard
;; :config (dashboard-setup-startup-hook))

;; figure out why these won't work in the :hook
(use-package hlinum
  :init (hlinum-activate))

(use-package smart-mode-line
  :config (setq sml/theme 'dark)
  :init (smart-mode-line-enable))

(use-package smartparens
  :config (progn
            (require 'smartparens-config)
            (smartparens-global-mode 1)
            (show-paren-mode t)))
