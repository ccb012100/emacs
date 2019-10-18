;;;; custom functions for theming

(defun my/apply-company-theme()
  "Apply theming to company-mode"
  ;; taken from https://www.emacswiki.org/emacs/CompanyMode
  (require #'color)
  (let ((bg (face-attribute #'default :background)))
    (custom-set-faces
     `(company-tooltip
       ((t (:inherit default :background ,(color-lighten-name bg 2)))))
     `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
     `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
     `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
     `(company-tooltip-common ((t (:inherit font-lock-constant-face)))))))

;; disables all custom themes before loading (enabling) another one.
;; from: https://emacs.stackexchange.com/a/3114
(defadvice load-theme (before theme-dont-propagate activate)
  (mapc #'disable-theme custom-enabled-themes))

(defun my/set-theme-dark(&optional theme)
  "Load dark theme."
  (interactive)
  (if (eq nil theme)
      (my/set-theme dark-theme)
    (my/set-theme theme))
  ;; (set-face-attribute 'whitespace-space nil :foreground "gray30")
  ;; (set-face-attribute 'sml/minor-modes nil :foreground "gray70")
  ;; (set-face-attribute 'sml/filename nil :foreground "pink")
  )

(defun my/set-theme-light(&optional theme)
  "Load light theme."
  (interactive)
  (if (eq nil theme)
      (my/set-theme light-theme)
    (my/set-theme theme)))

(defun my/set-theme (theme)
  "Load a theme using passed-in values.

Theme: theme to pass to (load-theme)"
  (interactive)
  (load-theme theme)
  (set-face-attribute 'whitespace-space nil :background nil)
  (my/apply-company-theme))
