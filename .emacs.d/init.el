;;;; Emacs init file (same as ~/.emacs file)
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

;; macOS settings
(setq macos-file "~/.emacs.d/macOS.el")
(load macos-file)

;; custom functions
;; customizing emacs settings
(setq settings-file "~/.emacs.d/settings.el")
(load-file settings-file)

(setq functions-file "~/.emacs.d/defuns.el")
(load-file functions-file)

;; custom keybindings
(setq keybindings-file "~/.emacs.d/keybindings.el")
(load-file keybindings-file)

;; adding/configuring emacs packages
(setq packages-file "~/.emacs.d/packages.el")
(load-file packages-file)

;; load Clojure configurations
(setq clojure-config-file "~/.emacs.d/clojure.el")
(load-file clojure-config-file)

(my/set-theme-dark)

(kill-buffer "*scratch*") ; kill default scratch buffer
