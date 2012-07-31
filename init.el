;; To use: 
;; 1. Checkout git repo into ~/
;; 2. In .emacs file, include: 
;;    (add-to-list 'load-path "~/Dot-Emacs/")
;;    (load "init")

(add-to-list 'load-path "~/Dot-Emacs/")
(add-to-list 'load-path "~/Dot-Emacs/color-theme/")
(add-to-list 'load-path "~/Dot-Emacs/color-theme-solarized/")

(require 'ido)

(setq-default indent-tabs-mode nil)
(setq viper-mode t)
(line-number-mode 1)
(require 'vimpulse)
(require 'actionscript-mode)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-q") 'slime-edit-definition)
(global-set-key (kbd "C-M-h") 'slime-pop-find-definition-stack)
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "C-S-o") 'next-buffer)
(global-set-key (kbd "C-S-u") 'previous-buffer)

(global-auto-revert-mode t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))

;; colors
(require 'color-theme)
(require 'color-theme-solarized)

;;(load "cool-blue")
(color-theme-solarized-dark)

(setq visible-bell t)
(setq default-tab-width 4)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; using gnome for that now
;(load "toggle-fullscreen")

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(require 'clojure-mode)
(require 'paredit)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)
;;(require 'swank-clojure-autoload)


(linum-mode t)
