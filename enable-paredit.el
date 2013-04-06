
(require 'paredit)
(defun turn-on-paredit ()
  (define-key paredit-mode-map "\M-q" 'switch-to-buffer)
  (define-key paredit-mode-map "\M-r" 'paredit-reindent-defun)
  (paredit-mode 1))
(turn-on-paredit)
