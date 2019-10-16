;;;; Emacs init file (same as ~/.emacs file)

;; start emacs server
(require #'server)
(unless (server-running-p) (server-start))

;; for custom settings set by emacs - don't want these polluting .emacs file
(setq custom-file (make-temp-file "emacs-custom"))

;; set default window size (desktop-save-mode will override this)
(when (or window-system (daemonp))
  (setq default-frame-alist #'( (width . 120) (height . 80) )))

;; confirm kill if emacs is started by non-deamon mode
(if (daemonp) nil (setq confirm-kill-emacs #'y-or-n-p))

;;; Configuration files
(setq settings-file
      "~/.emacs.d/settings.el")
(load-file settings-file)

;; Functions
(setq functions-file
      "~/.emacs.d/defuns.el")
(load-file functions-file)

;; Keybindings
(setq keybindings-file
      "~/.emacs.d/keybindings/keybindings.el")
(setq windmove-keybinds-file
      "~/.emacs.d/keybindings/windmove-keybindings.el")
(setq custom-keybinds-file
      "~/.emacs.d/keybindings/custom-fn-keybindings.el")
(load-file keybindings-file)
(load-file windmove-keybinds-file)
(load-file custom-keybinds-file)

;; Packages
(setq pack-init-file
      "~/.emacs.d/packages/packages-init.el")
(setq theme-packs
      "~/.emacs.d/packages/theme-packages.el")
(setq packages-file
      "~/.emacs.d/packages/packages.el")
(setq helm-packs-file
      "~/.emacs.d/packages/helm-packages.el")
(setq clojure-packs-file
      "~/.emacs.d/packages/clojure-packages.el")
(setq file-mode-packages-file
      "~/.emacs.d/packages/file-mode-packages.el")
(setq display-packages-file
      "~/.emacs.d/packages/display-packages.el")
(setq navigation-packages-file
      "~/.emacs.d/packages/navigation-packages.el")
(setq text-manipulation-packages-file
      "~/.emacs.d/packages/text-manipulation-packages.el")

(load-file pack-init-file)
(load-file theme-packs)
(load-file packages-file)
(load-file file-mode-packages-file)
(load-file navigation-packages-file)
(load-file display-packages-file)
(load-file text-manipulation-packages-file)
(load-file helm-packs-file)
(load-file clojure-packs-file)

;; OS-specific
(setq macos-file "~/.emacs.d/macOS.el") ; configurations specific to MacOS

(load-file macos-file)

;; Themes
(setq dark-theme #'atom-one-dark)
(setq light-theme #'gruvbox-light-soft)

(my/set-theme-dark)
