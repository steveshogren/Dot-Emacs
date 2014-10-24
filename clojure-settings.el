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
(define-key clojure-mode-map (kbd "<f8>") 'cider-eval-buffer)
(define-key clojure-mode-map (kbd "C-M-h") 'cider-jump-back)
(define-key clojure-mode-map (kbd "C--") 'cider-jump-back)
(define-key clojure-mode-map (kbd "C-S-M-x") 'cider-eval-print-last-sexp)

(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)

(setq cider-known-endpoints '(("local" "127.0.0.1" "7888")))

(defun cider-local ()
  (interactive)
  (cider-connect "127.0.0.1" "7888"))

(global-set-key (kbd "<f7>") 'cider-local)

(defun cider-remoter ()
  (interactive)
  ;; (run-lisp "lein repl :connect http://127.0.0.1:8080/repl")
  (run-lisp "lein repl :connect http://nimbus-admin.stage1.mybluemix.net:80/repl"))

(defun clojure-setup ()
  (delete-other-windows)
  (split-window-right)
  (evil-window-right)
  (split-window-below)
  )

(when (get-buffer "*cider-error*")
  (buffer-name)
  (let ((filepath (buffer-file-name)))
    (switch-to-buffer-other-window (get-buffer "*cider-error*"))
    (switch-to-buffer-other-window (other-buffer (current-buffer) 1))))

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
