;;;; Fix loading of environment variables

;;; This makes sure that all of the stuff you have on your PATH actually gets
;;; respected in the GUI Emacs, no matter how you start it.
;;; See: http://clojure-doc.org/articles/tutorials/emacs.html
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;;;; Package Management

(defun cask-install-path ()
  (let ((brew-cask-install-path (shell-command-to-string "brew --prefix cask")))
    (replace-regexp-in-string "\n$" "" brew-cask-install-path)))

(require 'cask (concat (cask-install-path) "/cask.el"))
(cask-initialize)
(require 'pallet)

;;;; Package configuration

;;; Solarized Color Theme
(load-theme 'solarized-dark t)

;;;; General editor configuration

(setq mac-option-modifier 'none
      mac-command-modifier 'meta
      mac-right-command-modifier 'super)

;; Resize the Frame at startup
;; (add-to-list 'default-frame-alist '(height . 60))
;; (add-to-list 'default-frame-alist '(width . 180))

;; Remove those ugly system scroll bars. Also enforces me to use keyboard.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; Remove the toolbar (clickable icons at top of window)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Delete files by moving them to the system’s trash
(setq delete-by-moving-to-trash t)

;; This is to customize the cursor and the current line highlighting as described in:
;; http://www.gnu.org/software/emacs/manual/html_node/emacs/Cursor-Display.html#index-highlight-current-line-583
(blink-cursor-mode)
;; (setq cursor-in-non-selected-windows nil) ;; Doesn’t work, don’t know why
(global-hl-line-mode)

;; Since Emacs 23 using shift while moving the point sets the region (mimicking the normal
;; behavior of other editors). This switches it off, for it conflicts with my window switching keybindings.
(setq shift-select-mode nil)

;; This should turn of the autosaving feature that produces these #file.txt# files
(setq auto-save-default nil)
;; And this should turn of the backup feature that produces these file.txt~ files
(setq make-backup-files nil)

;;;; Custom key bindings

;; Window movement
;; http://emacs-fu.blogspot.com/2008/12/easy-switching-between-visible-buffers.html
(global-set-key (kbd "M-B") 'windmove-left)
(global-set-key (kbd "M-F") 'windmove-right)
(global-set-key (kbd "M-P") 'windmove-up)
(global-set-key (kbd "M-N") 'windmove-down)

;; Make buffer switching more modal, as explained in:
;; http://stackoverflow.com/questions/1231188/emacs-list-buffers-behavior
(global-set-key "\C-x\C-b" 'buffer-menu)

(defun kill-region-or-word ()
  "Call `kill-region' or `backward-kill-word' depending on whether or not a region is selected."
  (interactive)
  (if (and transient-mark-mode mark-active)
    (kill-region (point) (mark))
    (backward-kill-word 1)))

;; Set Ctrl-w to backward-kill-word as described in Steve Yegge’s post
;; “Effective Emacs”: https://sites.google.com/site/steveyegge2/effective-emacs
;; But bound it to a variant as described in the following post that preserves
;; the original function of this keybinding if a region is selected:
;; http://ruslanspivak.com/2010/09/22/c-w-to-delete-word-backward-in-conkeror/
(global-set-key (kbd "C-w") 'kill-region-or-word)

;;;; Interesting customizations (not activated at the moment)

;; http://emacs-fu.blogspot.com/2010/04/navigating-kill-ring.html
;; http://www.emacswiki.org/emacs/BufferMenuHighlighting

