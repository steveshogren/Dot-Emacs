(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-buffer-menu nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme")
(setq-default indent-tabs-mode nil)
(setq viper-mode t)
(line-number-mode 1)
(require 'vimpulse)
(require 'actionscript-mode)

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key (kbd "M-k") 'move-text-up)
(global-set-key (kbd "M-j") 'move-text-down)

(global-auto-revert-mode t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))

(require 'color-theme)
(defun color-theme-cool-blue ()
  "cool blue by sshogren"
  (interactive)
  (color-theme-install
   '(color-theme-cool-blue
     ((foreground-color . "#FFFFFF")
      (background-color . "#14212e") 
      (background-mode . dark))
     (bold ((t (:bold t))))
     (bold-italic ((t (:italic t :bold t))))
     (default ((t (:background "#14212e" :foreground "#ffffff"))))
     (cursor ((t (:background "#ffff00" :foreground "#ffffff"))))
     (region ((t (:background "#004b61"))))
     (mode-line ((t (:background "#000000" :foreground "#0498da"))))
     (mode-line-inactive ((t (:background "#000000" :foreground "#0498da"))))
     (fringe ((t (:background "#000000"))))
     (minibuffer-prompt ((t (:foreground "#ffcc33"))))
     (font-lock-builtin-face ((t (:foreground "#ffff00"))))
     (font-lock-comment-face ((t (:foreground "#7eb0c9"))))
     (font-lock-constant-face ((t (:foreground "#009bff"))))
     (font-lock-function-name-face ((t (:foreground "#ffffff"))))
     (font-lock-keyword-face ((t (:foreground "#009bff"))))
     (font-lock-string-face ((t (:foreground "#c2b56e"))))
     (font-lock-type-face ((t (:foreground "#ffcc33"))))
     (font-lock-variable-name-face ((t (:foreground "#00b9ff"))))
     (font-lock-warning-face ((t (:foreground "#ff0000" :weight bold))))
     (isearch ((t (:background "#ffcc33" :foreground "#000000"))))
     (hl-line ((t (:background "#112233"))))
     (mode-line ((t (:foreground "#ffffff" :background "#333333"))))
     (region ((t (:foreground nil :background "#555555"))))
     (show-paren-match-face ((t (:bold t :foreground "#ffffff" 
                                       :background "#050505")))))))

(setq visible-bell t)
(setq default-tab-width 4)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

(set-cursor-color "#ffcc33")
