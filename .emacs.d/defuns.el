(defun duplicate-line-or-region (&optional n)
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

;; join line with next line
(defun join-lines ()
  (interactive)
  (join-line 1))

;; create new line below current line and move the cursor to it
(defun new-line-below ()
  (interactive)
  (end-of-line)
  (newline))

(defun select-word-under-cursor ()
  (interactive)
  '(thing-at-point 'word 'no-properties))

(defun reformat-document ()
  (interactive)
  (unless (equal major-mode 'text-mode)
    (save-excursion
      (indent-region (point-min) (point-max) nil))))

;; modify kill-region and kill-ring-save to act on line if no text is selected
;; see: https://www.emacswiki.org/emacs/WholeLineOrRegion
(put 'kill-region 'interactive-form      
     '(interactive
       (if (use-region-p)
           (list (region-beginning) (region-end))
         (list (line-beginning-position) (line-beginning-position 2)))))

(defun my-kill-ring-save (beg end flash)
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

(defun set-theme-light()
  (interactive)
  (load-theme 'doom-one-light))

(defun set-theme-dark()
  (interactive)
  (load-theme 'doom-molokai)
  (set-face-background 'hl-line "#282A36")) ; more visible line highlight color
