(defun my/duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
    With argument N, make N copies.
    With negative N, comment out original line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region ; Get region if active, otherwise line
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point 'line)
                      (end-of-line)
                      (if (< 0 (forward-line 1)) ; Go to beginning of next line, or make a new one
                          (newline))))))
        (dotimes (i (abs (or n 1))) ; Insert N times, or once if not specified
          (insert text))))
    (if use-region nil ; Only if we're working with a line (not a region)
      (let ((pos (- (point) (line-beginning-position)))) ;Save column
        (if (> 0 n) ; Comment out original with negative arg
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))

(defun my/join-lines ()
  "Join line with next line."
  (interactive)
  (join-line 1))

(defun my/new-line-below ()
  "Create a new line below current line and move the cursor to it."
  (interactive)
  (end-of-line)
  (newline))

(defun my/select-word-under-cursor ()
  ;; not quite same as Visual Studio, but similar
  (interactive)
  '(thing-at-point 'word 'no-properties))

(defun my/reformat-document ()
  "Indent document.
    Similar to 'Reformat Document' document in Visual Studio."
  (interactive)
  (unless (or (equal major-mode 'text-mode) (equal major-mode 'markdown-mode))
    (save-excursion
      (indent-region (point-min) (point-max) nil))))

;; modify kill-region and kill-ring-save to act on line if no text is selected
;; see: https://www.emacswiki.org/emacs/WholeLineOrRegion
(put 'kill-region 'interactive-form      
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

(defun my/my-kill-ring-save (beg end flash)
  "Modified version of kill-ring-save. Acts on line if no text is selected"
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end) nil)
                 (list (line-beginning-position)
                       (line-beginning-position 2) 'flash)))
  (kill-ring-save beg end)
  (when flash
    (save-excursion
      (if (equal (current-column) 0)
          (goto-char end)
        (goto-char beg))
      (sit-for blink-matching-delay))))
(global-set-key [remap kill-ring-save] 'my-kill-ring-save)

;; disables all custom themes before loading (enabling) another one.
;; from: https://emacs.stackexchange.com/a/3114
(defadvice load-theme (before theme-dont-propagate activate)
  (mapc 'disable-theme custom-enabled-themes))

(defun my/set-theme-light()
  "Load light theme."
  (interactive)
  (load-theme 'doom-one-light)
  (setq sml/theme 'light))

(defun my/set-theme-dark()
  "Load dark theme."
  (interactive)
  (load-theme 'doom-one)
  (setq sml/theme 'dark))
  ;; (set-face-foreground 'font-lock-comment-face "green"); more visible comment color
  ;; (set-face-background 'hl-line "#664400")) ;; more visible line highlight color

(defun my/load-init-file()
  "Reload the init.el file."
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun my/open-todo-file()
  "Open todo.txt"
  (interactive)
  (find-file "~/todo.txt"))

(defun my/open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun my/forward-5-lines()
  "Move cursor down 5 lines."
  (interactive)
  (next-line 5))

(defun my/back-5-lines()
  "Move cursor up 5 lines."
  (interactive)
  (previous-line 5))


;; taken from https://emacs.stackexchange.com/a/3334
(defvar my/killed-file-list nil
  "List of recently killed files.")

(defun my/add-file-to-killed-file-list ()
  "If buffer is associated with a file name, add that file to the
`killed-file-list' when killing the buffer."
  (when buffer-file-name
    (push buffer-file-name my/killed-file-list)))

(add-hook 'kill-buffer-hook #'my/add-file-to-killed-file-list)

(defun my/reopen-killed-file ()
  "Reopen the most recently killed file, if one exists."
  (interactive)
  (when my/killed-file-list
    (find-file (pop my/killed-file-list))))
