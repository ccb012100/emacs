;;;; windmove keybindings
;;;;
;;;; located in ~/.emacs.d/windmove-keybindings.el

;;; use arrow keys
(global-set-key (kbd "C-c <left>")  #'windmove-left)
(global-set-key (kbd "C-c <right>") #'windmove-right)
(global-set-key (kbd "C-c <up>")    #'windmove-up)
(global-set-key (kbd "C-c <down>")  #'windmove-down)

;;; use vi hjkl key bindings
(global-set-key (kbd "C-c h") #'windmove-left)
(global-set-key (kbd "C-c l") #'windmove-right)
(global-set-key (kbd "C-c k") #'windmove-up)
(global-set-key (kbd "C-c j") #'windmove-down)
