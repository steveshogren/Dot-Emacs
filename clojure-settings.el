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

;; USE FOR DEFAULTING TO 7888
;; (setq cider-known-endpoints '(("host-a" "127.0.0.1" "7888")))

(setq cider-stacktrace-default-filters '(tooling dup))

(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(define-key clojure-mode-map (kbd "C-q") 'cider-jump)
(define-key clojure-mode-map (kbd "<f12>") 'cider-jump)
(define-key clojure-mode-map (kbd "C-M-h") 'cider-jump-back)
(define-key clojure-mode-map (kbd "C--") 'cider-jump-back)
(define-key clojure-mode-map (kbd "C-S-M-x") 'cider-eval-print-last-sexp)

(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)


(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))
