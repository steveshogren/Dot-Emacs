
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(global-set-key (kbd "C-x b") 'anything-mini)
(global-set-key (kbd "C-x C-b") 'anything-mini)
(global-set-key (kbd "C-x C-i") 'anything-imenu)
(global-set-key (kbd "C-x i") 'anything-imenu)

(global-set-key (kbd "M-q") 'switch-to-buffer)
(global-set-key (kbd "C-q") 'nrepl-jump)
(global-set-key (kbd "C-M-h") 'nrepl-jump-back)
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
