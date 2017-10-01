(defcustom helm-fzf-executable "fzf"
  "Default executable for fzf"
  :type 'stringp
  :group 'helm-fzf)

(defun helm-fzf--project-root ()
  (cl-loop for dir in '(".git/" ".hg/" ".svn/" ".git")
          when (locate-dominating-file default-directory dir)
          return it))

(defun helm-fzf (directory)
  (interactive "D")
  (let ((default-directory directory))
    (helm :sources '(helm-fzf-source)
          :buffer "*helm-fzf*")))

(defun helm-fzf-project-root ()
  (interactive)
  (let ((default-directory (helm-fzf--project-root)))
    (unless default-directory
      (error "Could not find the project root."))
    (helm :sources '(helm-fzf-source)
          :buffer "*helm-fzf*")))

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
  (setq helm-buffers-fuzzy-matching t)

  (defvar helm-fzf-source
    (helm-build-async-source "fzf"
      :candidates-process 'helm-fzf--do-candidate-process
      :filter-one-by-one 'identity
      :requires-pattern 0
      :action 'helm-find-file-or-marked
      :candidate-number-limit 500))

  (defun helm-fzf--do-candidate-process ()
    (let* ((cmd-args (-filter 'identity (list helm-fzf-executable
                                              "--no-sort"
                                              "-f"
                                              helm-pattern)))
          (proc (apply 'start-file-process "helm-fzf" helm-buffer cmd-args)))
      (prog1 proc
        (set-process-sentinel
        (get-buffer-process helm-buffer)
        #'(lambda (process event)
          (helm-process-deferred-sentinel-hook
            process event (helm-default-directory))))))))

(provide 'init-helm)
