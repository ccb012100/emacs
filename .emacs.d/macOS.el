;;;; MacOS-specific settings
;;;; located at ~/.emacs.d/macOS.el
(when (eq system-type #'darwin)
  (setq mac-option-modifier #'meta)
  (setq mac-command-modifier #'meta)
  (global-set-key [kp-delete] #'delete-char) ; maps fn-delete to right-delete
  (set-face-attribute #'default nil :family "Hack" :height 120) ; set font

  ;; ITERM2 MOUSE SUPPORT
  (unless window-system
    (require #'mouse)
    (xterm-mouse-mode t)
    (defun track-mouse (e)) 
    (setq mouse-sel-mode t))

  ;; add `/usr/local/bin` to PATH and exec-path
  ;; see https://www.emacswiki.org/emacs/EmacsApp#toc9
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (setq exec-path (split-string (getenv "PATH") ":")))
