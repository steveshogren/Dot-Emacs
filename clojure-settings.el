(require 'clojure-mode)
(require 'cider)

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
  (condition-case ex
      (cider-connect "127.0.0.1" "7888")
    ('error (if (y-or-n-p "No local repl, jack in? y/n") (cider-jack-in)))))
(defun cider-local-admin ()
  (interactive)
  (condition-case ex
      (cider-connect "127.0.0.1" "7889")
    ('error (if (y-or-n-p "No local repl, jack in? y/n") (cider-jack-in)))))

(global-set-key (kbd "<f7>") 'cider-local)
(global-set-key (kbd "<f5>") 'cider-local-admin)

(defun cider-remoter ()
  (interactive)
  ;; (run-lisp "lein repl :connect http://127.0.0.1:8080/repl")
  (run-lisp "lein repl :connect http://nimbus-admin.stage1.mybluemix.net:80/repl"))


(defun clojure-window-default () 
  (interactive)
  (delete-other-windows)
  (let ((repls (-filter (lambda (x) (string-match "*cider-repl*" x))
                        (-map (lambda (x) (buffer-name x)) (buffer-list))))
        (current (get-buffer (current-buffer))))
    (when (= 1 (length repls))
      (split-window-right)
      (switch-to-buffer-other-window (get-buffer (car repls)))
      (split-window-below)
      (when (get-buffer "*cider-error*")
        (evil-window-down 1)
        (switch-to-buffer (get-buffer "*cider-error*")))
      (switch-to-buffer-other-window current 1))))

(define-key clojure-mode-map (kbd "C-<f7>") 'clojure-window-default)

;; (define-key evil-insert-state-map (kbd "RET") 'evil-ret-and-indent)
;; (global-set-key (kbd "RET") 'evil-ret)

;; Only reformat on insert-state-exit for cider mode
(add-hook 'cider-mode-hook 
          (lambda () 
            (add-hook 'evil-insert-state-exit-hook 'format-file nil 'make-it-local)))

;; bind RET to ret-and-indent ONLY in cider mode!
(evil-define-key 'insert cider-mode-map (kbd "RET") 'evil-ret-and-indent)

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
