;;; navigation functions

;; see https://endlessparentheses.com/get-in-the-habit-of-using-sharp-quote.html
(defun my/insert-sharp-quote ()
  "Insert sharp quote (\"#'\")"
  (interactive)
  (insert "#'"))

;; copied from https://pages.sachachua.com/.emacs.d/Sacha.html
;; originally fromn
;; http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-lqine/
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

(defun my/next-line-10 ()
  (interactive)
  (next-line 10))

(defun my/previous-line-10 ()
  (interactive)
  (previous-line 10))

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
