;;;
;;; EMACS SETTINGS
;;;
(blink-cursor-mode t)
(column-number-mode t)
(desktop-save-mode 1) ; remember last desktop settings
(display-time) ; show time in mode line
(fset 'yes-or-no-p 'y-or-n-p) ; y/n instead of yes/no
(global-auto-revert-mode t)
(global-hl-line-mode 1) ; highlight current line
(global-linum-mode t)
(global-visual-line-mode 1) ; line-wrap on word boundaries
(ido-mode 1)
(menu-bar-mode t)
(recentf-mode 1)
(show-paren-mode t)
(size-indication-mode t)
(tool-bar-mode -1)
(transient-mark-mode 1)	; highlight text selections
(unless (display-graphic-p)  (electric-pair-mode 1)) ; use electic-pair-mode in terminal

(setq column-number-mode t)
(setq custom-safe-themes t) ; stop emacs from asking if it's ok to load themes
(setq delete-by-moving-to-trash t) ; move deleted files to trash
(setq echo-keystrokes 0.1) ; immediately show unfinished keystrokes in mini-buffer
(setq gc-cons-threshold 50000000) ; increase garbage collection threhold to 50 MB
(setq ido-enable-flex-matching t)
(setq inhibit-startup-screen t)
(setq large-file-warning-threshold 100000000) ; increase large file warning threshold to 100MB
(setq line-number-mode t)
(setq ns-pop-up-frames nil) ; always open in same frame
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 50)

;; show full file path in frame title
;; (setq frame-title-format
	  ;; '((:eval (if (buffer-file-name)
				   ;; (abbreviate-file-name (buffer-file-name))
				 ;; "%b"))))

;; improve scrolling
(setq scroll-margin 0
	  scroll-conservatively 100000000
	  scroll-preserve-screen-position 1)

;; file backups
(setq backup-directory-alist `(("." . "~/.emacs.backup")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 10
      kept-old-versions 10
      version-control t)

(setq-default cursor-type 'bar)
(setq-default major-mode 'text-mode) ; make text mode the default mode for new buffers

(setq-default tab-width 4
			  indent-tabs-mode nil)

