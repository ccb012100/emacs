;; start emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;; for custom settings set by emacs - don't want these polluting .emacs file
(setq custom-file "~/.emacs-custom.el")
(load custom-file)
;; adding/configuring emacs packages
(setq packages-file "~/.emacs.d/packages.el")
(load packages-file)
;; custom keybindings
(setq keybindings-file "~/.emacs.d/keybindings.el")
(load keybindings-file)
;; customizing emacs settings
(setq settings-file "~/.emacs.d/settings.el")
;; macOS settings
(setq macos-file "~/.emacs.d/macOS.el")
(load macos-file)

;; set default window size (desktop-save-mode will override this)
(when (or window-system (daemonp)) (setq default-frame-alist '( (width . 120) (height . 80) )))

;; confirm kill if emacs is started by non-deamon mode
(if (daemonp) nil (setq confirm-kill-emacs 'yes-or-no-p))

;; save recent files list every 5 minutes
(run-at-time nil (* 5 60) 'recentf-save-list)

;; reformat buffer (like "format document" in Visual Studio)
(defun indent-buffer ()
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-k C-d") 'indent-buffer)

;; set theme
(load-theme monokai-theme)
;(load-theme dracula)

;; since this is the last line, if the scratch buffer shows the default message then the .emacs file didn't load completely
(setq initial-scratch-message "*scratch* buffer")

