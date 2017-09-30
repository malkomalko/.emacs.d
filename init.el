; package management
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

; add config files into load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

; use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

; init
(require 'init-evil)
(require 'init-helm)
(require 'init-ui)

; turn off backups
(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)
