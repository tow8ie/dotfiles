; This layers makes Emacs remember the size of the frame (i.e. the operating
; system’s window).
;
; It is copied from
; https://github.com/aaronjensen/spacemacs.d/tree/d6949a5314ae2041163c941c5460215942747bd8/layers/frame-geometry
; and uses an idea from
; https://gist.github.com/synic/0357fdc2dcc777d89d1e

(defvar frame-geometry-file
  (expand-file-name (concat spacemacs-cache-directory "frame-geometry"))
  "Save frame geometry to this file.")

(spacemacs|do-after-display-system-init
 (progn
   (add-hook 'after-init-hook 'frame-geometry//load)
   (add-hook 'kill-emacs-hook 'frame-geometry//save)))

