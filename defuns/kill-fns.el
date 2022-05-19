;;;; Kill functions

;; modify kill-region and kill-ring-save to act on line if no text is selected
;; see: https://www.emacswiki.org/emacs/WholeLineOrRegion
(put #'kill-region #'interactive-form
     #'(interactive
        (if (use-region-p)
            (list (region-beginning) (region-end))
          (list (line-beginning-position) (line-beginning-position 2)))))

;; https://www.emacswiki.org/emacs/KillBufferUnconditionally
(defun my/kill-buffer-volatile ()
  "Kill the current buffer without confirmation, even if unmodified."
  (interactive)
  (set-buffer-modified-p nil)
  (kill-this-buffer))

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

;;; KILLED FILE LIST
;;; taken from https://emacs.stackexchange.com/a/3334
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

;; delete to start of line
(defun my/backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))
