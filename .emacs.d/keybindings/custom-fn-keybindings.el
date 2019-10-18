;;;; Keybindings bound to custom functions

;;; Meta
(global-set-key (kbd "M-<return>") #'my/new-line-below)
(global-set-key (kbd "M-T") #'my/reopen-killed-file)
(global-set-key (kbd "M-N") #'my/next-line-10)
(global-set-key (kbd "M-P") #'my/previous-line-10)
(global-set-key (kbd "C-M-'") #'my/insert-sharp-quote)

;;; Super
(global-set-key (kbd "s-k") #'my/save-and-kill-buffer)

;;; Ctrl-Meta
(global-set-key (kbd "C-M-<return>") #'my/open-new-line-above)

(global-set-key (kbd "C-<return>") #'my/open-new-line-below)

;;; Ctrl
(global-set-key (kbd "C-j") #'my/join-lines)
(global-set-key (kbd "C-o") #'my/move-beginning-of-line-enhanced)
(global-set-key (kbd "C-w") #'my/mark-word-under-cursor)

(global-set-key (kbd "C-l C-d") #'my/reformat-document)
(global-set-key (kbd "C-l C-l") #'my/kill-ring-save-modified) ; copy
(global-set-key (kbd "C-l C-o") #'my/open-new-line-below)
(global-set-key (kbd "C-l M-o") #'my/open-new-line-above)

(global-set-key (kbd "C-l d") #'my/insert-current-date)
(global-set-key (kbd "C-l k") #'my/duplicate-line-or-region)

(global-set-key (kbd "C-x 2") #'my/split-window-below-improved)
(global-set-key (kbd "C-x 3") #'my/split-window-right-improved)
(global-set-key (kbd "C-x k") #'my/save-and-kill-buffer)

(add-hook #'emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") #'my/eval-last-sexp-or-region)))
