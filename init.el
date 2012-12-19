;; To use: 
;; 1. Checkout git repo into ~/
;; 2. In .emacs file, include: 
;;    (add-to-list 'load-path "~/Dot-Emacs/")
;;    (load "init")

(add-to-list 'load-path "~/Dot-Emacs/")
(add-to-list 'load-path "~/Dot-Emacs/color-theme/")
(add-to-list 'load-path "~/Dot-Emacs/color-theme-solarized/")
(add-to-list 'load-path "~/Dot-Emacs/evil/")

(defun ruby-runner ()
  "Runs runner"
  (interactive)
  (shell-command "ruby runner.rb 18"))

(global-set-key (kbd "C-x :") 'ruby-runner); Or whatever key you want...


;; enable ido
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; increment number
(defun increment-number-at-point ()
      (interactive)
      (skip-chars-backward "0123456789")
      (or (looking-at "[0123456789]+")
          (error "No number at point"))
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))
(global-set-key (kbd "C-a") 'increment-number-at-point)

(setq-default indent-tabs-mode nil)
(line-number-mode 1)

;; enable evil
(require 'evil)
(evil-mode 1)
(show-paren-mode t)

(require 'actionscript-mode)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-q") 'slime-edit-definition)
(global-set-key (kbd "C-M-h") 'slime-pop-find-definition-stack)
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "C-S-o") 'next-buffer)
(global-set-key (kbd "C-S-u") 'previous-buffer)
(global-set-key (kbd "C-c b") 'switch-to-buffer)

(global-auto-revert-mode t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))

;; colors
(require 'color-theme)
(require 'color-theme-solarized)

;;(load "cool-blue")
(color-theme-solarized-light)

(setq visible-bell t)
(setq default-tab-width 4)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

; using gnome's f11 for that now
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

(global-linum-mode t)

(require 'golden-ratio)
(golden-ratio-enable)

