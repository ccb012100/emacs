;;;; helm and related packages
;;;; located in ~/.emacs.d/helm-packages.el
;;;;
;;;; (Note: clojure-specific helm packs are in ~/.emacs.d/clojure-packages.el)

(use-package helm
  ;; note: use `C-o` in helm-M-x to go to "Emacs Commands" list of suggestions
  :bind (("M-x" . helm-M-x)
         ("C-k C-o" . helm-buffers-list)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("C-x m" . helm-mini)
         ("C-x r b" . helm-filtered-bookmarks)
         ("C-k h o" . helm-occur)
         ("C-SPC" . helm-M-x)
         ("C-z" . select-action)
         ("M-/" . helm-dabbrev)
         ("M-y" . helm-show-kill-ring)
         :map helm-find-files-map
         ("C-<backspace>" . helm-find-files-up-one-level))
  :config (helm-mode 1)
  (ido-mode -1)
  (setq helm-split-window-inside-p t
        helm-move-to-line-cycle-in-source 'nil
        helm-mode-fuzzy-match t
        helm-completion-in-region-fuzzy-match t
        helm-lisp-fuzzy-completion t
        helm-echo-input-in-header-line t))

(use-package helm-descbinds :after helm :bind ("C-h b" . helm-descbinds))

(use-package helm-swoop :after helm :bind ("C-k h s" . helm-swoop))
