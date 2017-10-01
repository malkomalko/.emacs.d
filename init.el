;; package management
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

;; add config files into load-path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(let ((files (directory-files-and-attributes "~/.emacs.d/lisp" t)))
  (dolist (file files)
    (let ((filename (car file))
          (dir (nth 1 file)))
      (when (and dir
                 (not (string-suffix-p "." filename)))
        (add-to-list 'load-path (car file))))))

;; custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; use package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; try packages
(use-package try
  :ensure t)

;; init
(require 'diminish)
(require 'init-fonts)
(require 'init-ui)
(require 'init-evil)
(require 'init-helm)
(require 'init-undo-tree)
(require 'init-which-key)

;; turn off backups
(defvar backup-dir "~/.emacs.d/backups/")
(setq auto-save-default nil)
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)
