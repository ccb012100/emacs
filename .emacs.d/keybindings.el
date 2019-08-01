;; map C-i separate from <tab> key
(define-key input-decode-map "\C-i" [C-i])
(global-set-key (kbd "<C-i>") 'forward-word)

(define-key text-mode-map (kbd "TAB") 'self-insert-command) ; insert tab char in text mode

(global-unset-key (kbd "C-k")) ; unset so I can use for chords
(global-unset-key (kbd "C-x f")) ; this is useless but I keep calling it on accident

;; (global-set-key [f6] '(lambda() (interactive) (revert-buffer "y"))) ; revert buffer without confirmation
(global-set-key [f6] 'revert-buffer) ; revert buffer without confirmation (felt too nervous doing it without confirmation)
(global-set-key [f7] 'which-key-show-top-level)
(global-set-key [f11] 'eval-buffer)

(global-set-key [mouse-2] 'yank)

(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "<home>") 'beginning-of-line)

(global-set-key (kbd "C-k b") 'eval-buffer)
(global-set-key (kbd "C-k g") 'goto-line)
(global-set-key (kbd "C-k C-k") 'kill-region) ; cut
(global-set-key (kbd "C-k l") 'avy-copy-line)
(global-set-key (kbd "C-k m") 'set-mark-command)
(global-set-key (kbd "C-k s") 'sort-lines)

(global-set-key (kbd "C-x C-/") 'comment-region) ; paste
(global-set-key (kbd "C-x C-j") 'recentf-open-files)

(global-set-key (kbd "C-x k") 'kill-this-buffer) ; just kill current buffer without asking

(global-set-key (kbd "C-t") 'set-mark-command)
(global-set-key (kbd "C-.") 'redo)
(global-set-key (kbd "C-;") 'kill-line) ; delete from cursor to EOL
(global-set-key (kbd "C-,") 'repeat)
(global-set-key (kbd "C-j") 'join-lines)
(global-set-key (kbd "C-l") 'kill-whole-line)
(global-set-key (kbd "C-o") 'move-beginning-of-line)
(global-set-key (kbd "C-u") 'backward-word)

(global-set-key (kbd "M-i") 'forward-char)
(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key (kbd "M-u") 'backward-char)
(global-set-key (kbd "M-w") 'mode-line-other-buffer) ; switch to previous buffer

;;;
;;; bound to custom/package functions
;;;
(global-set-key [f5] 'my/load-init-file)
(global-set-key [f8] 'my/open-todo-file)
(global-set-key [f9] 'my/set-theme-dark) ; defined in ~/.emacs.d/defuns.el
(global-set-key [f10] 'my/set-theme-light) ; defined in ~/.emacs.d/defuns.el
(global-set-key [f12] 'my/open-init-file)

(global-set-key (kbd "C-<return>") 'my/new-line-below)

(global-set-key (kbd "C-k C-d") 'my/reformat-document)
(global-set-key (kbd "C-k k") 'my/my-kill-ring-save) ; copy
(global-set-key (kbd "C-w") 'my/select-word-under-cursor)

(global-set-key (kbd "C-M-n") 'my/forward-5-lines)
(global-set-key (kbd "C-M-p") 'my/back-5-lines)

(global-set-key (kbd "M-<return>") 'my/new-line-below)
