(use-package helm-descbinds
  :ensure t
  :bind (("C-h b" . helm-descbinds)))

(use-package helm
  :ensure t
  :commands helm-mode
  :diminish helm-mode
  :bind (("M-x" . helm-M-x)
	 ("C-/" . helm-M-x)
	 :map helm-map
	 ("C-h" . helm-execute-persistent-action)
	 ("C-j" . helm-next-line)
	 ("C-k" . helm-previous-line))
  :config
  (helm-mode 1)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (setq helm-buffers-fuzzy-matching t))

(provide 'init-helm)
