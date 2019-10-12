;;;; Keybindings bound to custom functions defined in ~/.emacs./defuns.el
;;;;
;;;; located in ~/.emacs.d/custom-fn-keybindings.el

(global-set-key (kbd "M-<return>") #'my/new-line-below)

(global-set-key (kbd "M-T") #'my/reopen-killed-file) ; <SHIFT> + <META> + t
(global-set-key (kbd "C-M-<return>") #'my/open-new-line-above)
(global-set-key (kbd "C-<return>") #'my/open-new-line-below)

(global-set-key (kbd "C-j") #'my/join-lines)
(global-set-key (kbd "C-o") #'my/move-beginning-of-line-enhanced)
(global-set-key (kbd "C-w") #'my/mark-word-under-cursor)

(global-set-key (kbd "C-l C-d") #'my/reformat-document)
(global-set-key (kbd "C-l C-l") #'my/kill-ring-save-modified) ; copy

(global-set-key (kbd "C-l d") #'my/insert-current-date)
(global-set-key (kbd "C-l k") #'my/duplicate-line-or-region)

(global-set-key (kbd "C-x k") #'my/save-and-kill-buffer)

(add-hook #'emacs-lisp-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") #'my/eval-last-sexp-or-region)))
