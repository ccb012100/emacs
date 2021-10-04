;;;; PACKAGE INITIALIZATION
;;;; located in ~/.emacs.d/packages-init.el

(require #'package)

(add-to-list #'package-archives
              #'("melpa" . "https://melpa.org/packages/") t)
(add-to-list #'package-archives
              #'("melpagnu" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(package-install-selected-packages)

(require 'use-package)

(setq use-package-verbose t)
(setq use-package-always-ensure t)

(global-set-key (kbd "C-h C-k") #'describe-personal-keybindings)
