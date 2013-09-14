;; Package Management
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Remove those ugly system scroll bars. Also enforces me to use keyboard.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
;; Remove the toolbar (clickable icons at top of window)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; Delete files by moving them to the system’s trash
(setq delete-by-moving-to-trash t)

;; Resize the Frame at startup
;; (add-to-list 'default-frame-alist '(height . 60))
;; (add-to-list 'default-frame-alist '(width . 180))

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

;; These configuration makes window switching more efficient.
;; First I had a config that used the keybindings as described in:
;; http://nex-3.com/posts/45-efficient-window-switching-in-emacs
;; But then I read about the more mnemonic keybindings using M-N, M-P, etc. here, which are used now:
;; http://emacs-fu.blogspot.com/2008/12/easy-switching-between-visible-buffers.html

(global-set-key (kbd "M-B") 'windmove-left)
(global-set-key (kbd "M-F") 'windmove-right)
(global-set-key (kbd "M-P") 'windmove-up)
(global-set-key (kbd "M-N") 'windmove-down)

;; Make buffer switching more modal, as explained in:
;; http://stackoverflow.com/questions/1231188/emacs-list-buffers-behavior
(global-set-key "\C-x\C-b" 'buffer-menu)

;; Solarized Color Theme
(setq solarized-termcolors 256)
(load-theme 'solarized-dark t)

;; Enable colored buffer listing in buffer menu as described in:
;; http://www.emacswiki.org/emacs/BufferMenuHighlighting
(setq buffer-menu-buffer-font-lock-keywords
      '(("^....[*]Man .*Man.*"   . font-lock-variable-name-face) ;Man page
        (".*Dired.*"             . font-lock-comment-face)       ; Dired
        ("^....[*]shell.*"       . font-lock-preprocessor-face)  ; shell buff
        (".*[*]scratch[*].*"     . font-lock-function-name-face) ; scratch buffer
        ("^....[*].*"            . font-lock-string-face)        ; "*" named buffers
        ("^..[*].*"              . font-lock-constant-face)      ; Modified
        ("^.[%].*"               . font-lock-keyword-face)))     ; Read only

(defun buffer-menu-custom-font-lock  ()
  (let ((font-lock-unfontify-region-function
	 (lambda (start end)
	   (remove-text-properties start end '(font-lock-face nil)))))
    (font-lock-unfontify-buffer)
    (set (make-local-variable 'font-lock-defaults)
	 '(buffer-menu-buffer-font-lock-keywords t))
    (font-lock-fontify-buffer)))

(add-hook 'buffer-menu-mode-hook 'buffer-menu-custom-font-lock)

;; These lines are necessary for using org-mode.
;; It seems that they're necessary.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
; Org buffers only
(add-hook 'org-mode-hook 'turn-on-font-lock)

;; This lets you browse the kill ring.
;; The browsing is enabled when M-y is pressed without a preceeding C-y.
;; Found at: http://emacs-fu.blogspot.com/2010/04/navigating-kill-ring.html
(when (require 'browse-kill-ring nil 'noerror)
  (browse-kill-ring-default-keybindings))

