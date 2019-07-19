


(global-unset-key (kbd "C-k")) ; unset so I can use for chords
(global-unset-key (kbd "C-x f")) ; this is useless but I keep calling it on accident

(global-set-key [f5] '(lambda() (interactive) (load-file "~/.emacs.d/init.el")))
;; (global-set-key [f6] '(lambda() (interactive) (revert-buffer "y"))) ; revert buffer without confirmation
(global-set-key [f6] 'revert-buffer) ; revert buffer without confirmation (felt too nervous doing it without confirmation)
(global-set-key [f8] '(lamda() (interactive) (load-file "~/todo.txt")))
(global-set-key [f9] 'set-theme-dark) ; defined in ~/.emacs.d/defuns.el
(global-set-key [f10] 'set-theme-light) ; defined in ~/.emacs.d/defuns.el
(global-set-key [f12] '(lambda() (interactive) (find-file "~/.emacs.d/init.el")))

(global-set-key [mouse-2] 'yank)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "<home>") 'beginning-of-line)

(global-set-key (kbd "C-k C-d") 'reformat-document)
(global-set-key (kbd "C-k k") 'kill-ring-save) ; copy

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
(global-set-key (kbd "C-f") 'isearch-forward) ; "find"
(global-set-key (kbd "C-j") 'join-lines)
(global-set-key (kbd "C-l") 'kill-whole-line)
(global-set-key (kbd "C-o") 'move-beginning-of-line)
(global-set-key (kbd "C-u") 'backward-word)
(global-set-key (kbd "C-w") 'select-word-under-cursor)

(global-set-key (kbd "M-F") 'occur) ; find all matches in buffer
(global-set-key (kbd "M-i") 'forward-char)
(global-set-key (kbd "M-n") 'scroll-up-line)
(global-set-key (kbd "M-p") 'scroll-down-line)
(global-set-key (kbd "M-u") 'backward-char)
(global-set-key (kbd "M-w") 'mode-line-other-buffer) ; switch to previous buffer

;; if it's graphic display (i.e. not terminal), C-m can be bound separately than <return>
(if (display-graphic-p)
    (progn
      (global-set-key (kbd "C-m") 'new-line-below)
      ;; rebinding Enter as a result of rebinding C-m
      ;; see: http://makble.com/rebind-ctrlm-and-enter-in-emac
      (global-set-key (kbd "<return>") 'newline)
      (add-hook 'ielm-mode-hook
                (lambda () (define-key ielm-map (kbd "<return>") 'ielm-return)))
      (define-key minibuffer-local-map (kbd "<return>") 'exit-minibuffer)
      (eval-after-load 'help-mode
        '(define-key help-mode-map (kbd "<return>") 'help-follow-symbol))
      (define-key button-map (kbd "<return>") 'push-button)))

(global-set-key (kbd "M-RET") 'new-line-below) ; for terminals, since C-m can't be bound separately from <return>

;; map C-i separate from <tab> key
(define-key input-decode-map "\C-i" [C-i])
(global-set-key (kbd "<C-i>") 'forward-word)

;; the recentf mode binds RET, so I have to bind <return> explicitly
(define-key recentf-dialog-mode-map (kbd "<return>") 'widget-button-press)

(define-key text-mode-map (kbd "TAB") 'self-insert-command) ; insert tab char in text mode

