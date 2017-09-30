(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init
  (setq which-key-idle-delay 0.5)
  :config
  (which-key-mode))

(provide 'init-which-key)
