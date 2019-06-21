(require 'server)
(unless (server-running-p)
  (server-start))

;;;
;;; PACKAGES
;;;

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
					(not (gnutls-available-p))))
	   (proto (if no-ssl "http" "https")))
  (when no-ssl
	(warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable desired a
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
	;; For important compatibility libraries like cl-lib
	(add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(require 'drag-stuff)
(require 'dracula-theme)
(require 'thingatpt)
(require 'company)
(require 'windmove)
(require 'monokai-theme)
(require 'smartparens)
;;
;; package settings
;;

(add-hook 'after-init-hook 'global-company-mode)
(drag-stuff-mode t)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)
(load-theme 'dracula t)

;; set default window size (desktop-save-mode will override this)
(when (or window-system (daemonp))
  (setq default-frame-alist '( (width . 120) (height . 80) ))
  )

;;;
;;; EMACS SETTINGS
;;;

(setq echo-keystrokes 0.1)			; immediately show unfinished keystrokes in mini-buffer
(fset 'yes-or-no-p 'y-or-n-p)		; y/n instead of yes/no
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq-default major-mode 'text-mode); make text mode the default mode for new buffers
(size-indication-mode t)
(show-paren-mode t)
(setq line-number-mode t)
(setq column-number-mode t)
(global-hl-line-mode 1)				; highlight current line
(setq delete-by-moving-to-trash t)	; move deleted files to trash
(setq-default tab-width 4)
(transient-mark-mode 1)				; highlight text selections
(blink-cursor-mode t)
(global-linum-mode t)
(show-paren-mode t)
(size-indication-mode t)
(global-visual-line-mode 1) 		; line-wrap on word boundaries
(setq inhibit-splash-screen t)
(switch-to-buffer "**")				; initial buffer
(desktop-save-mode 1)				; remember last desktop settings
(setq-default cursor-type 'bar)
;(setq ns-pop-up-frames nil)			; always open in same frame

;; confirm kill if emacs is started by non-deamon mode
(if (daemonp)
	nil
  (setq confirm-kill-emacs 'yes-or-no-p)
  )

;;;
;;; KEY BINDINGS
;;;

(define-key text-mode-map (kbd "TAB") 'self-insert-command) ; tab key inserts single tab char in text-mode

(global-unset-key (kbd "C-k")) ; unset so I can use for chords

(global-set-key (kbd "C-w") '(thing-at-point 'word 'no-properties)) ; select word under cursor
(global-set-key (kbd "M-u") 'backward-char)
(global-set-key (kbd "C-u") 'backward-word)
(global-set-key (kbd "C-i") 'forward-word)
(global-set-key (kbd "C-o") 'move-beginning-of-line)
(global-set-key (kbd "C-m") 'move-end-of-line)
(global-set-key (kbd "C-l") 'kill-whole-line)
(global-set-key (kbd "C-;") 'kill-line) ; delete from cursor to EOL
(global-set-key (kbd "C-.") 'redo)
(global-set-key (kbd "C-,") 'undo)
(global-set-key (kbd "C-j") '(lambda() (interactive) (join-line 1)))
(global-set-key (kbd "C-w") 'kill-buffer-and-window)

										;(global-unset-key (kbd "C-j"))
(global-set-key (kbd "C-k C-a") 'mark-whole-buffer) ; select all
(global-set-key (kbd "C-k C-x") 'kill-region) ; cut
(global-set-key (kbd "C-k C-c") 'kill-ring-save) ; copy
(global-set-key (kbd "C-k C-v") 'yank) ; paste
(global-set-key (kbd "C-x C-/") 'comment-region) ; paste

(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)

(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)

(global-set-key [f5] '(lambda() (interactive) (load-file "~/.emacs")))
(global-set-key [f12] '(lambda() (interactive) (find-file "~/.emacs")))

;; rebinding Enter as a result of rebinding C-m
;; see: http://makble.com/rebind-ctrlm-and-enter-in-emac
(global-set-key (kbd "<return>") 'newline)
(add-hook 'ielm-mode-hook
		  (lambda () (define-key ielm-map (kbd "<return>") 'ielm-return))
		  )
(define-key minibuffer-local-map (kbd "<return>") 'exit-minibuffer)
(eval-after-load 'help-mode
  '(define-key help-mode-map (kbd "<return>") 'help-follow-symbol)
  )
(define-key button-map (kbd "<return>") 'push-button)


;; reformat buffer
(defun indent-buffer ()
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "C-k C-d") 'indent-buffer)

;;;
;;; MAC OS
;;;
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ; maps fn-delete to right-delete
  (set-face-attribute 'default nil :family "mononoki")
  
  ;; ITERM2 MOUSE SUPPORT
  (unless window-system
	(require 'mouse)
	(xterm-mouse-mode t)
	(defun track-mouse (e)) 
	(setq mouse-sel-mode t)))
