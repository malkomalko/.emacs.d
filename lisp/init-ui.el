; turn off gui chrome
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; turn off startup screen
(setq inhibit-startup-screen t)

;; no titles
(setq frame-title-format "")

;; load theme
(load-theme 'gruvbox t)

(provide 'init-ui)
