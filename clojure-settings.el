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
(setq nrepl-hide-special-buffers t)

;; (set cider-repl-result-prefix ";; => ")

;; USE FOR DEFAULTING TO 7888
;; (setq cider-known-endpoints '(("host-a" "10.10.10.1" "7888") ("host-b" "7888")))

(unless (package-installed-p 'ac-cider)
  (package-install 'ac-cider))

(setq cider-stacktrace-default-filters '(tooling dup))

(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'auto-complete-mode)

(define-key clojure-mode-map (kbd "C-q") 'cider-jump)
(define-key clojure-mode-map (kbd "<f12>") 'cider-jump)
(define-key clojure-mode-map (kbd "C-M-h") 'cider-jump-back)
(define-key clojure-mode-map (kbd "C--") 'cider-jump-back)
(define-key clojure-mode-map (kbd "C-S-M-x") 'cider-eval-print-last-sexp)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'cider-mode))
(add-hook 'cider-mode-hook 'auto-complete-mode)

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

