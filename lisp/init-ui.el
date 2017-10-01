;; turn off gui chrome
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; turn off startup screen
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; no titles
(setq frame-title-format "")

;; load theme
(load-theme 'gruvbox t)

;; turn on line numbers
(global-linum-mode t)

;; disable prompts
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

(show-paren-mode 1)

(provide 'init-ui)
