;;;; Emacs init file (same as ~/.emacs file)
;;;;
;;;; located at ~/.emacs.d/init.el

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

;;; Define configuration files
(setq macos-file "~/.emacs.d/macOS.el") ; configurations specific to MacOS
(setq settings-file "~/.emacs.d/settings.el")
(setq functions-file "~/.emacs.d/defuns.el") ; functions
(setq keybindings-file "~/.emacs.d/keybindings.el")
(setq windmove-keybinds-file "~/.emacs.d/windmove-keybindings.el")
(setq custom-keybinds-file "~/.emacs.d/custom-fn-keybindings.el")

;; Packages
(setq pack-init-file "~/.emacs.d/packages-init.el")
(setq theme-packs "~/.emacs.d/theme-packages.el")
(setq packages-file "~/.emacs.d/packages.el")
(setq helm-packs-file "~/.emacs.d/helm-packages.el")
(setq clojure-packs-file "~/.emacs.d/clojure-packages.el")

(setq dark-theme #'monokai)
(setq light-theme #'gruvbox-light-hard)

;;; load configuration files
(load-file settings-file)
(load-file functions-file)
(load-file pack-init-file)
(load-file keybindings-file)
(load-file windmove-keybinds-file)
(load-file custom-keybinds-file)
(load-file theme-packs)
(load-file packages-file)
(load-file helm-packs-file)
(load-file clojure-packs-file)
(load-file macos-file)

(my/set-theme-dark)
