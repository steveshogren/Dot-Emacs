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


;; Evil bindings
(define-key evil-insert-state-map (kbd "C-w") nil)
(define-prefix-command 'window-move-map)
(define-key evil-insert-state-map (kbd "C-w") window-move-map)
(define-key evil-insert-state-map (kbd "C-w l") 'evil-window-right)
(define-key evil-insert-state-map (kbd "C-w j") 'evil-window-down)
(define-key evil-insert-state-map (kbd "C-w k") 'evil-window-up)
(define-key evil-insert-state-map (kbd "C-w h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "k") nil)
(define-key evil-motion-state-map (kbd "j") nil)
(define-key evil-motion-state-map (kbd "l") nil)
(define-key evil-motion-state-map (kbd "h") nil)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)

(global-set-key (kbd "M-q") 'switch-to-buffer)
(global-set-key (kbd "C-q") 'cider-jump)
(global-set-key (kbd "C-M-h") 'cider-jump-back)
(global-set-key (kbd "C-S-M-x") 'cider-eval-print-last-sexp)
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

(defun string/ends-with (string suffix)
      "Return t if STRING ends with SUFFIX."
      (and (string-match (rx-to-string `(: ,suffix eos) t)
                         string)
           t))

(defun ensure-haskell-repl-running ()
  (when (not (get-buffer "*haskell*"))
    (run-haskell)
    (switch-to-buffer-other-window (other-buffer (current-buffer) 1))))

(defun haskell-repl-c ()
  (interactive) ;; tells emacs that the function is a command
  (save-buffer)
  (ensure-haskell-repl-running)
  (when (get-buffer "*haskell*")
    (buffer-name)
    (let ((filepath (buffer-file-name)))
      (switch-to-buffer-other-window (get-buffer "*haskell*"))
      (when (string/ends-with filepath ".hs")
        (insert (concat ":cd  " (file-name-directory filepath)))
        (comint-send-input)
        (insert (concat ":load " (file-name-nondirectory filepath)))
        (comint-send-input))
      (insert ":r") 
      (comint-send-input)
      (switch-to-buffer-other-window (other-buffer (current-buffer) 1)))))

(defun haskell-modes-hook ()
  (define-key haskell-mode-map (kbd "C-x :") 'haskell-repl-c)
  (define-key haskell-mode-map (kbd "<f4>") 'haskell-repl-c)
  (define-key haskell-mode-map (kbd "<f5>") 'haskell-repl-c)
  )
(add-hook 'haskell-mode-hook 'haskell-modes-hook)


