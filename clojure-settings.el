(require 'clojure-mode)
(defun turn-on-paredit ()
  (rainbow-delimiters-mode 1)
  (paredit-mode 1))

(add-hook 'clojure-mode-hook 'turn-on-paredit)

(add-to-list 'auto-mode-alist '("\\.cljs\\'" . clojure-mode))

(unless (package-installed-p 'cider)
  (package-install 'cider))
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-pop-to-buffer-on-connect nil)
(setq cider-auto-select-error-buffer nil)
;; (set cider-repl-result-prefix ";; => ")

(setq cider-stacktrace-default-filters '(tooling dup))

(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'auto-complete-mode)

(define-key clojure-mode-map (kbd "C-q") 'cider-jump)
(define-key clojure-mode-map (kbd "C-M-h") 'cider-jump-back)
(define-key clojure-mode-map (kbd "C-S-M-x") 'cider-eval-print-last-sexp)

;; (global-set-key (kbd "C-q") 'cider-jump)
;; (global-set-key (kbd "C-M-h") 'cider-jump-back)
;; (global-set-key (kbd "C-S-M-x") 'cider-eval-print-last-sexp)
