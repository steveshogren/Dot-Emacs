(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(global-set-key (kbd "C-SPC") 'auto-complete)
(global-set-key (kbd "C-c g") 'helm-git-grep)
(global-set-key (kbd "C-*") 'helm-git-grep-at-point)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(define-key global-map (kbd "C-M-h") 'pop-tag-mark)
(define-key global-map "\M-o" 'next-buffer)
(define-key global-map "\M-u" 'previous-buffer)


;; (global-set-key (kbd "C-x b") 'anything-mini)
;;(global-set-key (kbd "C-x C-b") 'anything-mini)
;;(global-set-key (kbd "C-x C-i") 'anything-imenu)
;;(global-set-key (kbd "C-x i") 'anything-imenu)


;; Evil bindings
(define-key evil-insert-state-map (kbd "C-w") nil)
(define-prefix-command 'window-move-map)
(define-key evil-insert-state-map (kbd "C-w") window-move-map)
(define-key evil-insert-state-map (kbd "C-w l") 'evil-window-right)
(define-key evil-insert-state-map (kbd "C-w j") 'evil-window-down)
(define-key evil-insert-state-map (kbd "C-w k") 'evil-window-up)
(define-key evil-insert-state-map (kbd "C-w h") 'evil-window-left)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(global-set-key (kbd "M-q") 'switch-to-buffer)
(global-set-key (kbd "M-r") 'paredit-reindent-defun)
(global-set-key (kbd "C-c 1") 'delete-other-windows)
(global-set-key (kbd "C-c 2") 'split-window)
(global-set-key (kbd "C-c 3") 'split-window-horizontally)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "C-S-o") 'next-buffer)
(global-set-key (kbd "C-S-u") 'previous-buffer)
(global-set-key (kbd "C-c b") 'anything-mini)
(global-set-key (kbd "C-c e") 'eval-buffer)
(global-set-key (kbd "C-r") 'undo)

(global-set-key (kbd "C-x C-u") 'winner-undo)
(global-set-key (kbd "C-x C-o") 'winner-redo)

(global-set-key (kbd "C-c r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-c C-r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x C-r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x t") 'fill-paragraph) 
(global-set-key (kbd "C-x C-t") 'fill-paragraph) 

(global-set-key (kbd "<f3>") 'comment-or-uncomment-region)

;; (global-set-key (kbd "C-z") nil)




