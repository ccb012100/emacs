;;;; specific settings for MAC OS
;;;; located at ~/.emacs.d/macOS.el

(when (eq system-type #'darwin)
  (setq mac-option-modifier #'meta)
  (setq mac-command-modifier #'meta)
  (global-set-key [kp-delete] #'delete-char) ; maps fn-delete to right-delete
  (set-face-attribute #'default nil :family "mononoki" :height 120) ; set font

  ;; ITERM2 MOUSE SUPPORT
  (unless window-system
    (require #'mouse)
    (xterm-mouse-mode t)
    (defun track-mouse (e)) 
    (setq mouse-sel-mode t))

  ;; integrate copy/paste with macOS clipboard
  ;; taken from https://gist.github.com/the-kenny with the functions modified to make sense
  (defun paste-from-osx ()
    (shell-command-to-string "pbpaste"))
  (defun copy-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))
  (setq interprogram-cut-function #'copy-to-osx)
  (setq interprogram-paste-function #'paste-from-osx))
