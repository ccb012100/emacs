(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(global-linum-mode t)
 '(indicate-buffer-boundaries (quote right))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "~/Dropbox")
 '(initial-scratch-message ";;*scratch* buffer")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "DejaVu_Sans_Mono"))))
 '(cursor ((t (:background "red" :foreground "red"))))
 '(custom-changed ((((min-colors 88) (class color)) (:background "blue1"))))
 '(custom-state ((((class color) (background dark)) (:foreground "lime green"))))
 '(custom-themed ((((min-colors 88) (class color)) (:background "blue" :foreground "white"))))
 '(fixed-pitch ((t (:family "dejavu sans mono"))))
 '(linum ((t (:inherit (shadow default) :foreground "yellow"))))
 '(sldb-restartable-frame-line-face ((t (:foreground "lime green"))))
 '(variable-pitch ((t (:family "Georgia"))))
 '(widget-documentation ((((class color) (background dark)) (:foreground "lime green")))))

(setq initial-frame-alist '((top . 1) (width . 120) (height . 60)));set initial frame dimensionsxh

(scroll-bar-mode -1);remove scrollbar

;(global-visual-line-mode 1);line-wrap on word boundaries

;;use bar cursor
(setq initial-frame-alist
 (cons '(cursor-type . bar) 
           (copy-alist initial-frame-alist)))
(setq default-frame-alist 
  (cons '(cursor-type . bar)
            (copy-alist default-frame-alist)))
(setq x-stretch-cursor 't);stretch cursor across tabs

;;set tab width to 4 spaces in text mode
(add-hook 'text-mode-hook
  (function
   (lambda ()
     (setq tab-width 4)
     (define-key text-mode-map "\C-i" 'self-insert-command)
     )))

(setq default-major-mode 'text-mode);make text mode the default mode for new buffers

;;Ido Mode
(ido-mode 1)
(setq ido-enable-flex-matching t)

(setq visible-bell t);use visible bell instead of audible

;;key bindings
(global-set-key [f1] '(lambda () (interactive) (find-file "~/.emacs")));open .emacs
(global-set-key [f2] '(lambda () (interactive) (load-file "~/.emacs")));reload .emacs
(global-set-key [f3] 'slime);'(lambda () (interactive) (slime)));M-x slime
(setq mac-command-modifier 'meta)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(defalias 'qrr 'query-replace-regexp)
(global-set-key [(control .)] 'eval-buffer);Ctrl-. for M-x eval-buffer
;(global-set-key (kbd "<C-tab>") 'other-window);switch focus to other window
;(global-set-key (kbd "<C-tab>") 'bury-buffer) ;cycle through buffers with C-TAB
(global-set-key [kp-delete] 'delete-char) ;enable forward deleting
(delete-selection-mode 1);typing overrides selected region
(define-key text-mode-map (kbd "TAB") 'self-insert-command);TAB keys inserts single tab in text-mode
(global-set-key "\C-ct" 'text-mode);change buffer to text mode
(global-set-key "\C-cl" 'lisp-interaction-mode);change buffer to lisp interaction mode
(global-set-key "\C-ch" 'hippie-expand);auto-completion

;;macro to move to beginning of the next line
(fset 'start-next-line
   "\C-n\C-a")
(global-set-key (kbd "M-n") 'start-next-line)

;;macro to insert line of 25 asterisks
(fset 'asterisk-line
   "\C-u25*")
(global-set-key (kbd "C-,") 'asterisk-line)

(setq echo-keystrokes 0.1);Immediately show unfinished keystrokes in mini-buffer

(fset 'yes-or-no-p 'y-or-n-p);y/n instead of yes/no

;;if no text is selected, M-w will copy line instead of region
(defadvice kill-ring-save (before slick-copy activate compile)
  (interactive
   (if (region-active-p) (list (region-beginning) (region-end))
     (message "Copied line.")
     (list (line-beginning-position)
	   (line-beginning-position 2)))))
(defadvice kill-region (before slick-cut activate compile)
  (interactive
   (if (region-active-p) (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

;;show matching parenthesis
(show-paren-mode t)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

(global-linum-mode 1);number lines
(setq line-number-mode t)
(setq column-number-mode t)

(global-hl-line-mode 1);highlight current line

;;save place in file between visits
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(setq delete-by-moving-to-trash t);move deleted files to trash

;;builds list of recent files
(require 'recentf)
(recentf-mode 1)

;;return a backup file path of a given file path
;;with full directory mirroring from a root dir
;;non-existant dir will be created
(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let (backup-root bpath)
    (setq backup-root "~/.emacs.d/emacs-backup")
    (setq bpath (concat backup-root fpath "~"))
    (make-directory (file-name-directory bpath) bpath)
    bpath))
(setq make-backup-file-name-function 'my-backup-file-name)

(require 'undo-tree);undo-tree
(require 'list-register);package to list contents of registers

;;Change title bar to ~/file-directory if the current buffer is a real file,
;;or buffer name if it is just a buffer.
(setq frame-title-format 
      '(:eval 
        (if buffer-file-name 
            (replace-regexp-in-string 
             (getenv "HOME") "~"
             (file-name-directory buffer-file-name)) 
       (buffer-name))))

;;SLIME
(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/lisp/slime")
;;;(setq inferior-lisp-program "/Applications/Clozure/dx86cl -K utf-8");Clozure
(setq inferior-lisp-program "/opt/local/bin/clisp");CLISP
(require 'slime-autoloads)
(require 'slime)
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-fancy))
(require 'slime)
(slime-autodoc-mode)
(slime-setup)
(add-hook 'lisp-mode-hook (lambda ()  
	(slime-mode t) 
	(local-set-key (kbd "<return>") 'newline-and-indent)
	(setq lisp-indent-function 'common-lisp-indent-function)
	(setq indent-tabs-mode nil)
	(make-variable-buffer-local
	 (defvar sldb-saved-window-configuration))))

;;enable autocomplete in ielm
(defun ielm-auto-complete ()
  "Enables `auto-complete' support in \\[ielm]."
  (setq ac-sources '(ac-source-functions
                     ac-source-variables
                     ac-source-features
                     ac-source-symbols
                     ac-source-words-in-same-mode-buffers))
  (add-to-list 'ac-modes 'inferior-emacs-lisp-mode)
  (auto-complete-mode 1))
(add-hook 'ielm-mode-hook 'ielm-auto-complete)

(put 'dired-find-alternate-file 'disabled nil)