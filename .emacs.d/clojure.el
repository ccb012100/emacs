;;; Clojure configuration
;;; mostly from https://github.com/flyingmachine/emacs-for-clojure/
;;; ~/.emacs.d/clojure.el
(use-package clojure-mode
  :mode (("\\.edn$" . clojure-mode)
         ("\\.boot$" . clojure-mode)
         ("\\.cljs.*$" . clojure-mode))
  :hook subword-mode smartparens-strict-mode)

(use-package helm-clojuredocs :after helm)
(use-package cljr-helm :after helm)

(use-package cider
  :config (setq cider-repl-history-file "~/.emacs.d/cider-history"
                cider-repl-pop-to-buffer-on-connect t
                cider-repl-wrap-history t
                cider-show-error-buffer t
                cider-auto-select-error-buffer t)
  (add-to-list 'drag-stuff-except-modes 'cider-repl-mode)
  :hook ((eldoc-mode . cider-mode)
         (smartparens-strict-mode . cider-repl-mode)))
