;;;; GLOBAL KEY BINDINGS

;(define-key input-decode-map "\C-i" [C-i])             ; map C-i separate from <tab> key
(global-set-key (kbd "C-l") nil)                        ; free up 'C-l' as a prefix key
(global-set-key (kbd "C-x C-l") nil)                    ; unbind 'downcase-region'
(global-set-key (kbd "<S-tab>") #'indent-rigidly-right) ; unindent

;;; MOUSE
(global-set-key [mouse-2] #'yank)

;;; FUNCTION KEYS
(global-set-key [f5]  #'revert-buffer)
(global-set-key [f7]  #'which-key-show-top-level)
(global-set-key [f11] #'eval-buffer)

(global-set-key (kbd "<end>") #'end-of-line)
(global-set-key (kbd "<home>") #'beginning-of-line)

;;; CONTROL
(global-set-key (kbd "C-;") #'set-mark-command)
(global-set-key (kbd "C-,") #'repeat)
(global-set-key (kbd "C-\\") #'universal-argument)
(global-set-key (kbd "C-i") #'forward-word)
(global-set-key (kbd "C-k") #'kill-whole-line)
(global-set-key (kbd "C-u") #'backward-word)

;;; META
(global-set-key (kbd "<M-up>") #'drag-stuff-up)
(global-set-key (kbd "<M-down>") #'drag-stuff-down)
(global-set-key (kbd "M-:") #'pp-eval-expression)       ; pretty-print results
(global-set-key (kbd "M-U") #'upcase-char)
(global-set-key (kbd "M-W") #'yank)
(global-set-key (kbd "M-k") #'kill-line)
(global-set-key (kbd "M-n") #'scroll-up-line)
(global-set-key (kbd "M-p") #'scroll-down-line)
(global-set-key (kbd "M-q") #'universal-argument)

;;;; CHORD BINDINGS
(global-set-key (kbd "C-l e") #'eval-buffer)
(global-set-key (kbd "C-l i") #'indent-for-comment)
(global-set-key (kbd "C-l m") #'recenter)               ; recenter window at point
(global-set-key (kbd "C-l s") #'sort-lines)
(global-set-key (kbd "C-l u") #'untabify)
(global-set-key (kbd "C-l C-w") #'global-whitespace-mode)
(global-set-key (kbd "C-l M-w") #'toggle-word-wrap)
(global-set-key (kbd "C-c C-c") #'eval-defun)           ; same as 'cider' package
(global-set-key (kbd "C-x ;") #'comment-region)
(global-set-key (kbd "C-x C-e") #'pp-eval-last-sexp)    ; pretty-print
(global-set-key (kbd "C-x C-j") #'recentf-open-files)
(global-set-key (kbd "C-x k") #'kill-this-buffer)       ; kill without asking
