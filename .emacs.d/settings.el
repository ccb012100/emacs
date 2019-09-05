;;;
;;; EMACS SETTINGS
;;;
(blink-cursor-mode t)
(column-number-mode t)
(delete-selection-mode 1)
(desktop-save-mode 1) ; remember last desktop settings
(display-time) ; show time in mode line
(electric-pair-mode 1)
(fset 'yes-or-no-p 'y-or-n-p) ; y/n instead of yes/no
(global-auto-revert-mode t)
(global-hl-line-mode 1) ; highlight current line
(global-linum-mode t)
(global-visual-line-mode 1) ; line-wrap on word boundaries
(global-whitespace-mode)
(menu-bar-mode t)
(recentf-mode 1)
(show-paren-mode t)
(size-indication-mode t)
(transient-mark-mode 1)     ; highlight text selections
(tool-bar-mode -1)
(whitespace-mode 1)

(setq-default cursor-type 'bar
              major-mode 'text-mode ; default new buffers to text mode
              tab-width 4
              indent-tabs-mode nil)

;; set TLS version to fix bug in Emacs.
;; See: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq column-number-mode t)
(setq custom-safe-themes t ); stop emacs from asking if it's ok to load themes
(setq delete-by-moving-to-trash t ); move deleted files to trash
(setq echo-keystrokes 0.1) ; show unfinished keystrokes in mini-buffer
(setq gc-cons-threshold 50000000 ); increase threshold to 50 MB
(setq ido-enable-flex-matching t)
(setq inhibit-startup-screen t)
(setq large-file-warning-threshold 100000000) ; increase threshold to 100MB
(setq line-number-mode t)
(setq ns-pop-up-frames nil ); always open in same frame
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 50)
(setq sentence-end-double-space nil) ; sentence ends in single space

;; use 4 spaces instead of tabs
(setq-default tab-width 4
              indent-tabs-mode nil)
;; (setq-indent-line-function 'insert-tab)

;; show full file path in frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; improve scrolling
(setq scroll-margin 0
      scroll-conservatively 100000000
      scroll-preserve-screen-position 1)

;; file backups
(setq backup-directory-alist '(("." . "~/.emacs.backup"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 1000
      kept-old-versions 1000
      version-control t)

;; savehist
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length 1
      history-delete-duplicates t
      savehist-save-minibuffer-history 1
      savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

;; use hs-mode to fold/unfold code in Javascript/JSON
