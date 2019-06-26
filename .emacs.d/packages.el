;;;
;;; PACKAGES
;;;

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
					(not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable desired a
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(package-install-selected-packages)

(require 'use-package)
(require 'monokai-theme)
(require 'smartparens)
(require 'thingatpt)
(require 'windmove)

(use-package company
  :hook (after-init . global-company-mode))

(use-package drag-stuff
  :init (drag-stuff-global-mode 1)
  (drag-stuff-mode t))

(drag-stuff-define-keys)

(use-package helm
  :bind (("M-x" . helm-M-x)
		 ("C-x r b" . helm-filtered-bookmarks)
		 ("C-x C-f" . helm-find-files)
		 ("C-x b" . helm-buffers-list)
		 ("C-x m" . helm-mini)
		 :map helm-map
		 ("C-i" . helm-execute-persistent-action)
		 :map helm-find-files-map
		 ("C-<backspace>" . helm-find-files-up-one-level)) ; map <TAB> to 
  :init (helm-mode 1))

(use-package dracula-theme)
(use-package monokai-theme)
(use-package smartparens)
(use-package thingatpt)
(use-package windmove)
