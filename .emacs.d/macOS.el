;;;
;;; specific settings for MAC OS
;;;
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'meta)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ; maps fn-delete to right-delete
  (set-face-attribute 'default nil :family "mononoki")
  
  ;; ITERM2 MOUSE SUPPORT
  (unless window-system
	(require 'mouse)
	(xterm-mouse-mode t)
	(defun track-mouse (e)) 
	(setq mouse-sel-mode t)))
