;;; Clojure configuration
;;; mostly from https://github.com/flyingmachine/emacs-for-clojure/
;;; ~/.emacs.d/clojure.el
(use-package clojure-mode
  :after smartparens-mode drag-stuff-mode
  :config (add-to-list 'drag-stuff-except-modes 'clojure-mode)
  :mode (("\\.edn$" . clojure-mode)
         ("\\.boot$" . clojure-mode)
         ("\\.cljs.*$" . clojure-mode))
  :hook (clojure-mode-hook . turn-on-smartparens-strict-mode))

(add-hook 'clojure-mode-hook #'turn-on-smartparens-strict-mode);

(use-package helm-clojuredocs :after helm)
(use-package cljr-helm :after helm)

(use-package cider
  :after clojure-mode
  :config (setq cider-repl-history-file "~/.emacs.d/cider-history"
                cider-repl-pop-to-buffer-on-connect t
                cider-repl-wrap-history t
                cider-show-error-buffer t
                cider-font-lock-dynamically '(macro core function var)
                cider-auto-select-error-buffer t
                cider-repl-display-help-banner 'nil
                cider-save-file-on-load t)
  (add-to-list 'drag-stuff-except-modes 'cider-repl-mode)
  :bind ("C-c c j" . cider-jack-in)
  ;; use longer idle delay for company than elsewhere
  :hook (cider-repl-mode . (lambda () (setq company-idle-delay 0.5))))
