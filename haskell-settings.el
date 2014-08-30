
(when (not (package-installed-p 'haskell-mode))
   (package-install 'haskell-mode))


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
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook (lambda () (setq evil-auto-indent nil)))
