;;;; custom functions

;; taken from https://pages.sachachua.com/.emacs.d/Sacha.html
(defun my/eval-last-sexp-or-region (prefix)
  "Eval region from BEG to END if active, otherwise the last sexp."
  (interactive "P")
  (if (and (mark) (use-region-p))
      (eval-region (min (point) (mark)) (max (point) (mark)))
    (pp-eval-last-sexp prefix)))

(defun my/mark-word-under-cursor ()
  "Mark the word the cursor is on.
In Visual Studio, this is called #'Select Word Under Cursor'"
  (interactive)
  (let ((bnd (mouse-start-end (point) (point) 1)))
    (goto-char (car bnd))
    (push-mark)
    (set-mark (point))
    (goto-char (cadr bnd))))

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
