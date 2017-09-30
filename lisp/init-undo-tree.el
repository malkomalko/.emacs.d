(use-package undo-tree
  :diminish undo-tree-mode
  :init (global-undo-tree-mode)
  :bind (:map undo-tree-map
	      ("C-/" . nil)))

(provide 'init-undo-tree)
