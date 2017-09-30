; change font size
(require 'cl)

(defun mm/font-name-replace-size (font-name new-size)
  (let ((parts (split-string font-name "-")))
    (setcar (nthcdr 7 parts) (format "%d" new-size))
    (mapconcat 'identity parts "-")))

(defun mm/set-frame-font-size (size)
  (set-frame-font (mm/font-name-replace-size (face-font 'default) size) t t))

(defun mm/increment-default-font-height (delta)
  "Adjust the default font height by DELTA on every frame.
  Emacs will keep the pixel size of the frame approximately the
  same.  DELTA should be a multiple of 10, to match the units used
  by the :height face attribute."
  (let* ((new-height (+ (face-attribute 'default :height) delta))
        (new-point-height (/ new-height 10)))
    (mm/set-frame-font-size new-point-height)
    (set-face-attribute 'default nil :height new-height)
    (message "Default font size is now %d" new-point-height)))

(defun mm/increase-default-font-height ()
  (interactive)
  (mm/increment-default-font-height 10))

(defun mm/decrease-default-font-height ()
  (interactive)
  (mm/increment-default-font-height -10))

(bind-key (kbd "s--") 'mm/decrease-default-font-height)
(bind-key (kbd "s-=") 'mm/increase-default-font-height)

(provide 'init-fonts)
