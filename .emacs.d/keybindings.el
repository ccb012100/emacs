;;;; KEY BINDINGS
;;;;
;;;; located in ~/.emacs.d/keybindings.el

(define-key input-decode-map "\C-i" [C-i])  ; map C-i separate from <tab> key

(global-unset-key (kbd "C-x f"))            ; I keep hitting 'C-x f' on accident
(global-unset-key (kbd "C-k"))              ; unset so I can use for chords

(global-set-key [f5]  #'revert-buffer)
(global-set-key [f7]  #'which-key-show-top-level)
(global-set-key [f11] #'eval-buffer)

(global-set-key [mouse-2] #'yank)

(global-set-key (kbd "<end>") #'end-of-line)
(global-set-key (kbd "<home>") #'beginning-of-line)

(global-set-key (kbd "C-k c") #'recenter-top-bottom)
(global-set-key (kbd "C-k e") #'eval-buffer)
(global-set-key (kbd "C-k i") #'indent-for-comment)
(global-set-key (kbd "C-k m") #'set-mark-command)
(global-set-key (kbd "C-k s") #'sort-lines)
(global-set-key (kbd "C-k u") #'untabify)
(global-set-key (kbd "C-k w") #'whitespace-mode)     ; toggle whitespace-mode

(global-set-key (kbd "C-k C-k") #'kill-region)       ; cut

(global-set-key (kbd "C-x C-/") #'comment-region)    ; paste
(global-set-key (kbd "C-x C-e") #'pp-eval-last-sexp) ; pretty-print
(global-set-key (kbd "C-x C-j") #'recentf-open-files)

(global-set-key (kbd "C-x k") #'kill-this-buffer)    ; kill without asking

(global-set-key (kbd "C-.") #'redo)
(global-set-key (kbd "C-;") #'kill-line)             ; delete from cursor to EOL
(global-set-key (kbd "C-,") #'repeat)

(global-set-key (kbd "<C-i>") #'forward-word)

(global-set-key (kbd "C-l") #'kill-whole-line)
(global-set-key (kbd "C-o") #'move-beginning-of-line)
(global-set-key (kbd "C-]") #'set-mark-command)
(global-set-key (kbd "C-u") #'backward-word)

(global-set-key (kbd "M-:") #'pp-eval-expression)    ; pretty-print results
(global-set-key (kbd "M-n") #'scroll-up-line)
(global-set-key (kbd "M-p") #'scroll-down-line)
(global-set-key (kbd "M-q") #'universal-argument)
(global-set-key (kbd "M-w") #'mode-line-other-buffer) ; open previous buffer
