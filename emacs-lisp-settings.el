(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(evil-define-key 'insert emacs-lisp-mode-map (kbd "RET") 'evil-ret-and-indent)

