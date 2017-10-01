(when (memq window-system '(mac ns))
  (setq ns-use-srgb-colorspace nil))

(use-package powerline
  :ensure t
  :config
  (setq powerline-default-separator (if (display-graphic-p) 'arrow nil))
  (powerline-default-theme))

(use-package airline-themes
  :ensure t)

(provide 'init-powerline)
