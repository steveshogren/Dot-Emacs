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


(global-set-key (kbd "C-c r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-c C-r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x C-r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x r") 'slime-eval-last-expression) 
(global-set-key (kbd "C-x t") 'fill-paragraph) 
(global-set-key (kbd "C-x C-t") 'fill-paragraph) 


(global-set-key (kbd "<f3>") 'comment-or-uncomment-region)
;; (global-set-key (kbd "C-k") 'save-buffer)
;; (define-prefix-command 'ctrlk-prefix-map)
;; (global-set-key (kbd "C-k") 'ctrlk-prefix-map)

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


