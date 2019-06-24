;;;
;;; Keybindings
;;;

(define-key text-mode-map (kbd "TAB") 'self-insert-command) ; tab key inserts single tab char in text-mode

(global-unset-key (kbd "C-k")) ; unset so I can use for chords

(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "<home>") 'beginning-of-line)

(global-set-key (kbd "C-,") 'undo)
(global-set-key (kbd "C-.") 'redo)
(global-set-key (kbd "C-;") 'kill-line) ; delete from cursor to EOL
(global-set-key (kbd "C-i") 'forward-word)
(global-set-key (kbd "C-j") '(lambda() (interactive) (join-line 1)))
(global-set-key (kbd "C-k C-a") 'mark-whole-buffer) ; select all
(global-set-key (kbd "C-k C-c") 'kill-ring-save) ; copy
(global-set-key (kbd "C-k q") 'kill-buffer-and-window)
(global-set-key (kbd "C-k C-x") 'kill-region) ; cut
(global-set-key (kbd "C-f") 'occur)
(global-set-key (kbd "C-l") 'kill-whole-line)
(global-set-key (kbd "C-m") 'move-end-of-line)
(global-set-key (kbd "C-o") 'move-beginning-of-line)
(global-set-key (kbd "C-u") 'backward-word)
(global-set-key (kbd "C-w") '(thing-at-point 'word 'no-properties)) ; select word under cursor
(global-set-key (kbd "C-x C-/") 'comment-region) ; paste
(global-set-key (kbd "C-x C-j") 'recentf-open-files)

(global-set-key (kbd "M-i") 'forward-char)
(global-set-key (kbd "M-u") 'backward-char)
(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key (kbd "M-u") 'backward-char)
(global-set-key (kbd "M-w") 'mode-line-other-buffer) ; switch to previous buffer

(global-set-key [f12] '(lambda() (interactive) (find-file "~/.emacs")))
(global-set-key [f5] '(lambda() (interactive) (load-file "~/.emacs")))

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
