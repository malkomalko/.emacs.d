(defun mm/config-evil-leader ()
  "Configure evil leader mode."
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "be" 'helm-buffers-list
    "fa" 'helm-fzf-project-root
    "S"  'split-window-vertically
    "V"  'split-window-horizontally))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)

  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (mm/config-evil-leader)))

(provide 'init-evil)
