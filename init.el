(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
;;(add-hook 'window-setup-hook 'toggle-frame-maximized t)
(toggle-scroll-bar -1)
;;(add-to-list 'default-frame-alist '(undecorated . t))
(cua-mode 1)
(load-theme 'wombat)
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

(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-S-s"))
(global-unset-key (kbd "C-c"))
(global-unset-key (kbd "C-<next>"))

(global-unset-key (kbd "C-f"))
(global-unset-key (kbd "C-S-f"))
(global-unset-key (kbd "C-d"))
(global-set-key (kbd "M-<up>") 'move-line-up-and-preserve-column)
(global-set-key (kbd "M-<down>") 'move-line-down-and-preserve-column)
(global-set-key (kbd "<f24><left>") 'windmove-left)
(global-set-key (kbd "<f24><right>") 'windmove-right)
(global-set-key (kbd "<f24><up>") 'windmove-up)
(global-set-key (kbd "<f24><down>") 'windmove-down)
(global-set-key (kbd "<f24>C-<right>") (lambda() (interactive) (split-window-right) (windmove-right)))
(global-set-key (kbd "<f24>C-<next>") 'delete-window)


(global-set-key (kbd "C-c") 'kill-ring-save)
(global-set-key (kbd "C-x") 'kill-region)
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-y") 'undo-redo)
(global-set-key (kbd "C-d") 'find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-q") 'kill-buffer)
 
(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
(global-set-key (kbd "C-S-f") 'isearch-backward)
(define-key isearch-mode-map (kbd "C-S-f") 'isearch-repeat-backward)

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

;; Global keybinding for transparency toggle
;;(global-set-key (kbd "C-c T") 'toggle-frame-transparency)

(set-frame-parameter nil 'alpha 90)
