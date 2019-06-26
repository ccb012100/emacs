;;;
;;; Keybindings
;;;

;; like "format document" in Visual Studio
(defun format-buffer ()
  (interactive)
  (save-excursion
	(indent-region (point-min) (point-max) nil)))

;; join line with next line
(defun join-lines () (interactive) (join-line 1))

;; create new line below current line and move the cursor to it
(defun new-line-below () (interactive) (end-of-line) (newline))

(defun select-word-under-cursor () (interactive) '(thing-at-point 'word 'no-properties))

(global-unset-key (kbd "C-k")) ; unset so I can use for chords
(global-unset-key (kbd "C-k f")) ; this is useless but I keep calling it on accident

(define-key text-mode-map (kbd "TAB") 'self-insert-command) ; tab key inserts single tab char in text-mode

(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "<home>") 'beginning-of-line)

(global-set-key (kbd "C-.") 'redo)
(global-set-key (kbd "C-;") 'kill-line) ; delete from cursor to EOL
(global-set-key (kbd "C-i") 'forward-word)
(global-set-key (kbd "C-j") 'join-lines)
(global-set-key (kbd "C-k C-d") 'format-buffer)
(global-set-key (kbd "C-k a") 'mark-whole-buffer) ; select all
(global-set-key (kbd "C-k c") 'kill-ring-save) ; copy
(global-set-key (kbd "C-k x") 'kill-region) ; cut
(global-set-key (kbd "C-f") 'occur)
(global-set-key (kbd "C-l") 'kill-whole-line)
(global-set-key (kbd "C-o") 'move-beginning-of-line)
(global-set-key (kbd "C-u") 'backward-word)
(global-set-key (kbd "C-w") 'select-word-under-cursor)
(global-set-key (kbd "C-x C-/") 'comment-region) ; paste
(global-set-key (kbd "C-x C-j") 'recentf-open-files)

(global-set-key (kbd "M-i") 'forward-char)
(global-set-key (kbd "M-u") 'backward-char)
(global-set-key (kbd "M-n") 'scroll-up-line)

(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key (kbd "M-u") 'backward-char)
(global-set-key (kbd "M-w") 'mode-line-other-buffer) ; switch to previous buffer

(global-set-key [f12] '(lambda() (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key [f5] '(lambda() (interactive) (load-file "~/.emacs.d/init.el")))

;; newline-below
;; C-m can't be bound separately from RET on terminal so I have a lot of overloads
(global-set-key (kbd "C-m") 'new-line-below)
(global-set-key (kbd "C-RET") 'new-line-below)
(global-set-key (kbd "S-RET") 'new-line-below)

;; rebinding Enter as a result of rebinding C-m
;; see: http://makble.com/rebind-ctrlm-and-enter-in-emac
(global-set-key (kbd "<return>") 'newline)
(global-set-key (kbd "RET") 'newline) ; necessary to work in iTerm2
(add-hook 'ielm-mode-hook
	  (lambda () (define-key ielm-map (kbd "<return>") 'ielm-return)))
(define-key minibuffer-local-map (kbd "<return>") 'exit-minibuffer)
(eval-after-load 'help-mode
  '(define-key help-mode-map (kbd "<return>") 'help-follow-symbol))
(define-key button-map (kbd "<return>") 'push-button)
