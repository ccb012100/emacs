;;; Text manipulation/editing functions

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

(defun my/insert-current-date ()
  "Insert current date in format 'Day MM-DD-YYYY' (example: Mon Sep-16-2019)"
  (interactive)
  (insert (format-time-string "%a %m-%d-%Y")))

(defun my/join-lines ()
  "Join line with next line."
  (interactive)
  (join-line 1))

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

(defun my/reformat-document ()
  "Indent document.
Similar to 'Reformat Document' in Visual Studio."
  (interactive)
  (unless (or (equal major-mode #'text-mode) (equal major-mode #'markdown-mode))
    (save-excursion (indent-region (point-min) (point-max) nil))))
