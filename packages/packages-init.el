;;;; PACKAGE INITIALIZATION
;;;; located in ~/.emacs.d/packages-init.el

(require #'package)

(add-to-list #'package-archives
              #'("melpa" . "https://melpa.org/packages/") t)
(add-to-list #'package-archives
              #'("melpagnu" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

;; Bootstrap 'use-package'
(eval-after-load 'gnutls
  '(add-to-list 'gnutls-trustfiles "/etc/ssl/cert.pem"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'bind-key)

(setq use-package-always-ensure t)

(when (not package-archive-contents)
  (package-refresh-contents))

(package-install-selected-packages)

(setq use-package-verbose t)
(setq use-package-always-ensure t)

(global-set-key (kbd "C-h C-k") #'describe-personal-keybindings)
