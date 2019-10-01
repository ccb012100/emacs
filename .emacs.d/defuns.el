;;;; custom functions
;;;;
;;;; located in ~/.emacs.d/defuns.el

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

(defun my/duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
With argument N, make N copies.
With negative N, comment out original line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region ; Get region if active, otherwise line
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point #'line)
                      (end-of-line)
                      ;; Go to beginning of next line, or make a new one
                      (if (< 0 (forward-line 1)) (newline))))))
        (dotimes (i (abs (or n 1))) ; Insert N times, or once if not specified
          (insert text))))
    (if use-region nil ; Only if we're working with a line (not a region)
      (let ((pos (- (point) (line-beginning-position)))) ; Save column
        (if (> 0 n) ; Comment out original with negative arg
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))

;; taken from https://pages.sachachua.com/.emacs.d/Sacha.html
(defun my/eval-last-sexp-or-region (prefix)
  "Eval region from BEG to END if active, otherwise the last sexp."
  (interactive "P")
  (if (and (mark) (use-region-p))
      (eval-region (min (point) (mark)) (max (point) (mark)))
    (pp-eval-last-sexp prefix)))

(defun my/insert-current-date ()
  "Insert current date in format 'Day MM-DD-YYYY' (example: Mon Sep-16-2019)"
  (interactive)
  (insert (format-time-string "%a %m-%d-%Y")))

(defun my/join-lines ()
  "Join line with next line."
  (interactive)
  (join-line 1))

;; https://www.emacswiki.org/emacs/KillBufferUnconditionally
(defun my/kill-buffer-volatile ()
  "Kill the current buffer without confirmation, even if unmodified."
  (interactive)
  (set-buffer-modified-p nil)
  (kill-this-buffer))

;; modify kill-region and kill-ring-save to act on line if no text is selected
;; see: https://www.emacswiki.org/emacs/WholeLineOrRegion
(put #'kill-region #'interactive-form
     #'(interactive
        (if (use-region-p)
            (list (region-beginning) (region-end))
          (list (line-beginning-position) (line-beginning-position 2)))))
(defun my/kill-ring-save-modified (beg end flash)
  "Modified version of kill-ring-save. Acts on line if no text is selected"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2) #'flash)))
  (kill-ring-save beg end)
  (when flash
    (save-excursion
      (if (equal (current-column) 0)
          (goto-char end)
        (goto-char beg))
      (sit-for blink-matching-delay))))
(global-set-key [remap kill-ring-save] #'my-kill-ring-save)

(defun my/load-init-file()
  "Reload the init.el file."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

;; disables all custom themes before loading (enabling) another one.
;; from: https://emacs.stackexchange.com/a/3114
(defadvice load-theme (before theme-dont-propagate activate)
  (mapc #'disable-theme custom-enabled-themes))

(defun my/mark-word-under-cursor ()
  "Mark the word the cursor is on.
In Visual Studio, this is called #'Select Word Under Cursor'"
  (interactive)
  (let ((bnd (mouse-start-end (point) (point) 1)))
    (goto-char (car bnd))
    (push-mark)
    (set-mark (point))
    (goto-char (cadr bnd))))

;; copied from https://pages.sachachua.com/.emacs.d/Sacha.html
;; originally from
;; http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun my/move-beginning-of-line-enhanced (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))
  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))
  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point)) (move-beginning-of-line 1))))

(defun my/open-new-line-above ()
  ;; from http://whattheemacsd.com/editing-defuns.el-01.html
  "Open a new line above the current line."
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun my/open-new-line-below ()
  "Create a new line below current line and move the cursor to it."
  (interactive)
  (end-of-line)
  (newline))

(defun my/open-todo-file() 
  "Open todo.txt"
  (interactive)
  (find-file "~/daily-to-do-notes.txt"))

(defun my/reformat-document ()
  "Indent document.
Similar to 'Reformat Document' in Visual Studio."
  (interactive)
  (unless (or (equal major-mode #'text-mode) (equal major-mode #'markdown-mode))
    (save-excursion (indent-region (point-min) (point-max) nil))))

(defun my/rename-current-buffer-file ()
  ;; from http://whattheemacsd.com/file-defuns.el-01.html
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer #'%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named #'%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File #'%s' successfully renamed to #'%s'"
                   name (file-name-nondirectory new-name)))))))

(defun my/set-theme-dark(&optional theme)
  "Load dark theme."
  (interactive)
  (if (eq nil theme)
      (my/set-theme-dark 'darktooth)
    (my/set-theme theme))
  (set-face-attribute 'whitespace-space nil :foreground "gray30"))

(defun my/set-theme-light()
  "Load light theme."
  (interactive)
  (my/set-theme #'gruvbox-light-hard))

(defun my/set-theme (theme)
  "Load a theme using passed-in values.

Theme: theme to pass to (load-theme)"
  (interactive)
  (load-theme theme)
  (set-face-attribute 'whitespace-space nil :background nil)
  (my/apply-company-theme))

(defun my/save-and-kill-buffer ()
  "Before killing a buffer, ask to save it if it's unmodified."
  (interactive)
  (if (buffer-modified-p)
      (if (yes-or-no-p "Save this buffer before killing it?")
          (progn
            (save-buffer)
            (kill-buffer))
        (my/kill-buffer-volatile))
    (kill-this-buffer)))

(defun my/split-window-below-improved ()
  "Split window vertically and switch the new window to other-buffer."
  (interactive)
  (split-window-below)
  (set-window-buffer (next-window) (other-buffer)))

(defun my/split-window-right-improved ()
  "Split window horizontally and switch the new window to other-buffer."
  (interactive)
  (split-window-right)
  (set-window-buffer (next-window) (other-buffer)))

;;; KILLED FILE LIST
;; taken from https://emacs.stackexchange.com/a/3334
(defvar my/killed-file-list nil "List of recently killed files.")

;; Add the file associated with the buffer to killed file list
(defun my/add-file-to-killed-file-list ()
  "Add the file associated with the buffer to the `killed-file-list'."
  (when buffer-file-name (push buffer-file-name my/killed-file-list)))

;; add buffer file to killed-file-list every time kill-buffer is called
(add-hook #'kill-buffer-hook #'my/add-file-to-killed-file-list)
(defun my/reopen-killed-file ()
  "Reopen the most recently killed file, if one exists."
  (interactive)
  (when my/killed-file-list
    (find-file (pop my/killed-file-list))))
