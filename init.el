;Initial
(set-locale-environment "en_US.UTF-8")
(when (eq system-type 'windows-nt)
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

;Theme:
(set-background-color "#302d28")
(set-face-attribute 'fringe nil :background "#302d28")
(set-face-attribute 'default nil :foreground "#b2b2b2")
(set-face-foreground 'vertical-border "#404040")
;;(set-face-attribute 'mode-line nil :background "blue")
(set-face-attribute 'mode-line nil :box nil)
(set-face-attribute 'mode-line-inactive nil :box nil)
(set-frame-parameter nil 'ns-appearance 'dark)
(set-frame-parameter nil 'ns-transparent-titlebar nil)

;;ELips coloring
;;Comments
(set-face-attribute 'font-lock-comment-face nil :foreground "#666666")
;;Strings
(set-face-attribute 'font-lock-string-face nil :foreground "#ac3e4e")
;;Keywords
(set-face-attribute 'font-lock-keyword-face nil :foreground "#cf6d30")
;;Type
(set-face-attribute 'font-lock-type-face nil :foreground "DarkOrange")
;;Function name
(set-face-attribute 'font-lock-function-name-face nil :foreground "#ffffff")
;;Highlight background
(set-face-attribute 'region nil :background "#dddddd" :foreground "black")



;Smooth Scrolling?
(setq pixel-scroll-precision-large-scroll-height 1.0)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;;

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(setq inhibit-startup-screen t)
;;(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(toggle-scroll-bar -1)
;;(add-to-list 'default-frame-alist '(undecorated . t))
(cua-mode 1)
;;(load-theme 'wombat)
;;(set-face-attribute 'default nil :font "Fira Code")
;;(if (eq system-type 'windows-nt))
(set-face-attribute 'default nil  :weight 'regular :font "Adwaita Mono" :family "Mono" :width 'normal :height 100)

;; (view-lossage)
(setq visible-bell 1)

;; esc always quits
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'keyboard-quit)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
 
(defun move-line-up-and-preserve-column ()
  "Move the current line up by one, preserving the cursor's column position."
  (interactive)
  (let ((current-column (current-column)))
    (transpose-lines 1)
    (forward-line -2) ; Move back to the original line's position after transpose
    (move-to-column current-column t))) ; Move to the preserved column, creating spaces if needed

(defun move-line-down-and-preserve-column ()
  "Move the current line up by one, preserving the cursor's column position."
  (interactive)
  (let ((current-column (current-column)))
    (forward-line 1)
	(transpose-lines 1)
	(forward-line -1)
    (move-to-column current-column t))) ; Move to the preserved column, creating spaces if needed


(setq w32-recognize-altgr nil)
;KEY BINDINGS

(global-unset-key (kbd "C-w"))
(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-S-s"))
(global-unset-key (kbd "C-c"))
(global-unset-key (kbd "C-<next>"))
(global-unset-key (kbd "C-f"))
(global-unset-key (kbd "C-S-f"))
(global-unset-key (kbd "C-d"))
(global-unset-key (kbd "C-M-<up>"))
(global-unset-key (kbd "C-M-<down>"))

(defvar ctl-w-map (make-sparse-keymap))
(global-set-key (kbd "C-w") ctl-w-map)

(global-set-key (kbd "M-<up>") 'move-line-up-and-preserve-column)
(global-set-key (kbd "M-<down>") 'move-line-down-and-preserve-column)

(define-key ctl-w-map (kbd "C-<right>") (lambda() (interactive) (split-window-right) (windmove-right)))
(define-key ctl-w-map (kbd "C-<down>") (lambda() (interactive) (split-window-below) (windmove-down)))

(define-key ctl-w-map (kbd "M-<right>") 'windmove-swap-states-right)
(define-key ctl-w-map (kbd "M-<left>") 'windmove-swap-states-left)
(define-key ctl-w-map (kbd "M-<up>") 'windmove-swap-states-up)
(define-key ctl-w-map (kbd "M-<down>") 'windmove-swap-states-down)


(define-key ctl-w-map (kbd "<left>") 'windmove-left)
(define-key ctl-w-map (kbd "<right>") 'windmove-right)
(define-key ctl-w-map (kbd "<up>") 'windmove-up)
(define-key ctl-w-map (kbd "<down>") 'windmove-down)
(define-key ctl-w-map (kbd "<next>") 'delete-window)

(global-set-key (kbd "C-c") 'kill-ring-save)
(global-set-key (kbd "C-x") 'kill-region)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-y") 'undo-redo)
(global-set-key (kbd "C-d") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-q") 'kill-buffer)

(global-set-key (kbd "C-M-<down>") 'scroll-up-line)
(global-set-key (kbd "C-M-<up>") 'scroll-down-line)
(global-set-key (kbd "C-M-<next>") 'scroll-up)
(global-set-key (kbd "C-M-<prior>") 'scroll-down)

(global-set-key (kbd "<f22>") 'buffer-menu)
;Version for Laptop keyboard
(global-set-key (kbd "<Launch7>") 'buffer-menu)
 
(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
(global-set-key (kbd "C-S-f") 'isearch-backward)
(define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)

(set-frame-parameter nil 'alpha 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))

(defun toggle-frame-transparency ()
  "Toggle frame transparency with user-specified opacity value.
Prompts user whether to enable transparency. If yes, asks for opacity value (0-100).
If no, restores full opacity. Only affects the active frame."
  (interactive)
  (if (y-or-n-p "Enable frame transparency? ")
      (let ((alpha-value (read-number "Enter transparency value (0-100, default 90): " 90)))
        (if (and (>= alpha-value 0) (<= alpha-value 100))
            (progn
              (set-frame-parameter nil 'alpha alpha-value)
              (message "Frame transparency set to %d%%" alpha-value))
          (message "Invalid transparency value. Please enter a number between 0 and 100.")))
    (progn
      (set-frame-parameter nil 'alpha 100)
      (message "Frame transparency disabled (full opacity restored)"))))

(setq default-directory "~/")
;; Global keybinding for transparency toggle
;;(global-set-key (kbd "C-c T") 'toggle-frame-transparency)


;;Delete windows based on direction
(defun delete-window-right ()
  "Delete the window to the right of the selected window."
  (interactive)
  (let ((right-window (window-in-direction 'right)))
    (if right-window
        (delete-window right-window)
      (message "No window to the right"))))
(defun delete-window-left ()
  "Delete the window to the left of the selected window."
  (interactive)
  (let ((left-window (window-in-direction 'left)))
    (if left-window
        (delete-window left-window)
      (message "No window to the left"))))
(defun delete-window-up ()
  "Delete the window to the top of the selected window."
  (interactive)
  (let ((up-window (window-in-direction 'up)))
    (if up-window
        (delete-window up-window)
      (message "No window to the top"))))
(defun delete-window-down ()
  "Delete the window to the bottom of the selected window."
  (interactive)
  (let ((bottom-window (window-in-direction 'down)))
    (if bottom-window
        (delete-window bottom-window)
      (message "No window to the bottom"))))
(global-set-key (kbd "C-w S-<right>") 'delete-window-right)
(global-set-key (kbd "C-w S-<left>") 'delete-window-left)
(global-set-key (kbd "C-w S-<up>") 'delete-window-up)
(global-set-key (kbd "C-w S-<down>") 'delete-window-down)
