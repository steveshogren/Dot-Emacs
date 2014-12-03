
(add-hook 'scheme-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook 'auto-complete-mode)

(define-key scheme-mode-map (kbd "C-M-x")   'lisp-eval-defun)
(define-key scheme-mode-map (kbd "C-x C-e") 'lisp-eval-last-sexp)
(define-key scheme-mode-map (kbd "C-c C-e") 'lisp-eval-last-sexp)
