(require 'clojure-mode)
(defun turn-on-paredit ()
  (rainbow-delimiters-mode 1)
  (git-gutter-mode 1)
  (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
