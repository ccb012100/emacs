;;;; EMACS SETTINGS
;;;; located in ~/.emacs.d/settings.el
(blink-cursor-mode 0)
(column-number-mode t)
(delete-selection-mode 1)
(desktop-save-mode 1)           ; remember last desktop settings
(display-time)                  ; show time in mode line
(electric-pair-mode 1)
(fset #'yes-or-no-p #'y-or-n-p) ; y/n instead of yes/no
(global-auto-revert-mode t)
(global-font-lock-mode t)       ; turn on syntax highlighting
(global-hl-line-mode 1)         ; highlight current line
(global-linum-mode t)
(global-visual-line-mode 1)     ; line-wrap on word boundaries
(menu-bar-mode t)
(show-paren-mode t)
(size-indication-mode t)
(transient-mark-mode 1)         ; highlight text selections
(tool-bar-mode -1)
(whitespace-mode 1)

;; Don't show native OS scroll bars for buffers because they're redundant
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq-default cursor-type #'bar)

;; use 4 spaces instead of tabs
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; set TLS version to fix bug in Emacs.
;; See: https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(setq column-number-mode t)
(setq create-lockfiles nil)         ; dont need lockfiles
(setq custom-safe-themes t )        ; don't prompt to load themes
(setq delete-by-moving-to-trash t ) ; move deleted files to trash
(setq display-time-24hr-format t)
(setq echo-keystrokes 0.1)          ; show unfinished keystrokes
(setq gc-cons-threshold 50000000 )  ; increase threshold to 50 MB
(setq ido-enable-flex-matching t)
(setq inhibit-startup-screen t)
(setq large-file-warning-threshold 100000000) ; increase threshold to 100MB
(setq line-number-mode t)
(setq major-mode #'text-mode)       ; use text mode for new buffers
(setq ns-pop-up-frames nil)         ; always open in same frame
(setq save-interprogram-paste-before-kill t)
(setq select-enable-clipboard t)    ; integrate with OS clipboard
(setq select-enable-primary t)      ; cut/paste uses primary selection
(setq sentence-end-double-space nil); sentence ends in single space

;; show full file path in frame title
(setq frame-title-format
      #'((:eval (if (buffer-file-name)
                    (abbreviate-file-name (buffer-file-name))
                  "%b"))))

;; improve scrolling
(setq scroll-margin 0
      scroll-conservatively 100000000
      scroll-preserve-screen-position 1)

;; file backups
(setq backup-directory-alist #'(("." . "~/.emacs.backup"))
      backup-by-copying t
      delete-old-versions t
      kept-new-versions 1000
      kept-old-versions 1000
      version-control t)

;; savehist
(setq savehist-file "~/.emacs.d/savehist"
      history-length 1
      history-delete-duplicates t
      savehist-save-minibuffer-history 1
      savehist-additional-variables #'(kill-ring search-ring regexp-search-ring)
      vc-make-backup-files t) ; also backup files in version control
(savehist-mode 1)

;; Shows all options when running apropos. For more info,
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Apropos.html
(setq apropos-do-all t)

;; Mouse yank commands yank at point instead of at click.
(setq mouse-yank-at-point t)

;; Save point position between sessions
;; from http://whattheemacsd.com/init.el-03.html
(require #'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; save list of recently visited files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 50)

;; better method of giving buffers unique names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; customize white-space-mode to > 80 chars/line for some modes
(add-hook
 #'text-mode-hook
 (lambda () (setq-local whitespace-line-column 120)))
