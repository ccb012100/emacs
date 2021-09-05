;;;; MacOS-specific settings
;;;; located at ~/.emacs.d/macOS.el
(when (eq system-type #'darwin)
  (setq mac-option-modifier #'super)         ; 'alt/option' sends 'M'
  (setq mac-command-modifier #'meta)         ; 'command' sends 'M'

  (global-set-key [kp-delete] #'delete-char) ; maps fn-delete to right-delete

  (defun mac/show-in-finder ()
    "Show current buffer file in macOS Finder."
    (interactive)
    (shell-command "open ."))

  ;; set font properties
  (set-face-attribute #'default nil :family "SF Mono" :height 120)

  ;; ITERM2 MOUSE SUPPORT
  (unless window-system
    (require #'mouse)
    (xterm-mouse-mode t)
    (defun track-mouse (e))
    (setq mouse-sel-mode t))

  ;; add `/usr/local/bin` to PATH and exec-path
  ;; see https://www.emacswiki.org/emacs/EmacsApp#toc9
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (setq-default exec-path (split-string (getenv "PATH") ":")))
