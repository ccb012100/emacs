;;;
;;; Keybindings
;;;

(define-key text-mode-map (kbd "TAB") 'self-insert-command) ; tab key inserts single tab char in text-mode

(global-unset-key (kbd "C-k")) ; unset so I can use for chords

(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "<home>") 'beginning-of-line)

(global-set-key (kbd "C-.") 'redo)
(global-set-key (kbd "C-;") 'kill-line) ; delete from cursor to EOL
(global-set-key (kbd "C-i") 'forward-word)
(global-set-key (kbd "C-j") '(lambda() (interactive) (join-line 1)))
(global-set-key (kbd "C-k C-a") 'mark-whole-buffer) ; select all
(global-set-key (kbd "C-k C-c") 'kill-ring-save) ; copy
(global-set-key (kbd "C-k C-x") 'kill-region) ; cut
(global-set-key (kbd "C-f") 'occur)
(global-set-key (kbd "C-l") 'kill-whole-line)
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
