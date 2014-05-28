(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(define-key global-map "\M-o" 'next-buffer)


;; (global-set-key (kbd "C-x b") 'anything-mini)
;;(global-set-key (kbd "C-x C-b") 'anything-mini)
;;(global-set-key (kbd "C-x C-i") 'anything-imenu)
;;(global-set-key (kbd "C-x i") 'anything-imenu)
(global-set-key (kbd "C-u") 'universal-argument)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(global-set-key (kbd "M-q") 'switch-to-buffer)
(global-set-key (kbd "C-q") 'cider-jump)
(global-set-key (kbd "C-M-h") 'cider-jump-back)
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

;; insert mode window move
(define-key evil-motion-state-map (kbd "C-w") nil)
(define-key evil-insert-state-map (kbd "C-w") nil)
(define-prefix-command 'window-move-map)
(define-key evil-insert-state-map (kbd "C-w") window-move-map)
(define-key evil-insert-state-map (kbd "C-w l") 'evil-window-right)
(define-key evil-insert-state-map (kbd "C-w h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "C-w") window-move-map)
(define-key evil-motion-state-map (kbd "C-w l") 'evil-window-right)
(define-key evil-motion-state-map (kbd "C-w h") 'evil-window-left)

(global-set-key (kbd "C-c r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-c C-r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x C-r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x t") 'fill-paragraph) 
(global-set-key (kbd "C-x C-t") 'fill-paragraph) 

;;(define-key slime-mode-map "C-x C-r" 'slime-eval-last-expression)

(defun sas-shell-modes-hook ()
  (define-key comint-mode-map (kbd "C-j") 'comint-next-input)
  (define-key comint-mode-map (kbd "C-k") 'comint-previous-input)
  )
(add-hook 'comint-mode-hook 'sas-shell-modes-hook)
(defun doc-keys ()
  (define-key doc-view-mode-map "j" 'doc-view-scroll-up-or-next-page)
  (define-key doc-view-mode-map "k" 'doc-view-scroll-down-or-previous-page)
  (define-key doc-view-mode-map "n" 'doc-view-search-next-match)
  (define-key doc-view-mode-map "N" 'doc-view-search-previous-match)
  (define-key doc-view-mode-map "/" 'doc-view-search)
  (define-prefix-command 'window-move-map)
  (define-key doc-view-mode-map "\C-w" 'window-move-map)
  (define-key doc-view-mode-map "\C-w l" 'evil-window-right)
  (define-key doc-view-mode-map "\C-w h" 'evil-window-left)
  )

(add-hook 'doc-view-mode-hook 'doc-keys)
