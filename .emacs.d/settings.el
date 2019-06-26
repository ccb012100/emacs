;;;
;;; EMACS SETTINGS
;;;
(blink-cursor-mode t)
(desktop-save-mode 1) ; remember last desktop settings
(fset 'yes-or-no-p 'y-or-n-p) ; y/n instead of yes/no
(global-hl-line-mode 1) ; highlight current line
(global-linum-mode t)
(global-visual-line-mode 1) ; line-wrap on word boundaries
(ido-mode 1)
(recentf-mode 1)
(show-paren-mode t)
(show-paren-mode t)
(size-indication-mode t)
(transient-mark-mode 1)	; highlight text selections

(setq-default tab-width 4)
(setq-default cursor-type 'bar)
(setq-default major-mode 'text-mode) ; make text mode the default mode for new buffers

(setq column-number-mode t)
(setq delete-by-moving-to-trash t) ; move deleted files to trash
(setq echo-keystrokes 0.1) ; immediately show unfinished keystrokes in mini-buffer
(setq ido-enable-flex-matching t)
(setq inhibit-startup-screen t)
(setq initial-major-mode 'text-mode) ; use text-mode for *scratch* buffer
(setq line-number-mode t)
(setq ns-pop-up-frames nil) ; always open in same frame
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 50)
