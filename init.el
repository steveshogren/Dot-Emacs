;; To use: 
;; 1. Checkout git repo into ~/
;; 2. In .emacs file, include: 
;;    (add-to-list 'load-path "~/Dot-Emacs/")
;;    (load "init")

(add-to-list 'load-path "~/Dot-Emacs/")
(add-to-list 'load-path "~/Dot-Emacs/color-theme/")
(add-to-list 'load-path "~/Dot-Emacs/color-theme-solarized/")
(add-to-list 'load-path "~/Dot-Emacs/evil/")
(add-to-list 'load-path "~/Dot-Emacs/tomorrow-theme/")
(add-to-list 'custom-theme-load-path "~/Dot-Emacs/themes")

(require 'golden-ratio)
(desktop-save-mode 1)

(defun ruby-runner ()
  "Runs runner"
  (interactive)
  (shell-command "ruby runner.rb 67"))
(global-set-key (kbd "C-x :") 'ruby-runner); Or whatever key you want...


;; Marmalade Package Manager
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(unless (package-installed-p 'fsharp-mode)
  (package-install 'fsharp-mode))
(require 'fsharp-mode)
(setq inferior-fsharp-program "fsharpi --readline-")
(setq fsharp-compiler "fsharpc")
(require 'paredit)
(require 'rainbow-delimiters)
(defun turn-on-paredit ()
  (rainbow-delimiters-mode 1)
  (define-key paredit-mode-map "\M-q" 'switch-to-buffer)
  (define-key paredit-mode-map "\M-r" 'paredit-reindent-defun)
  (paredit-mode 1))
(turn-on-paredit)

(set-face-attribute 'default nil :font "Liberation Mono-12" :weight 'bold)
;;(set-face-bold-p 'bold 1)
(color-theme-tomorrow-night)

(when (not (package-installed-p 'nrepl))
   (package-install 'nrepl))
(when (not (package-installed-p 'git-gutter))
   (package-install 'git-gutter))
(global-git-gutter-mode t)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-diff)
(global-set-key (kbd "C-x C-k") 'git-gutter:previous-diff)
(global-set-key (kbd "C-x C-j") 'git-gutter:next-diff)
 

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


(global-auto-revert-mode t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))

;; colors
(require 'color-theme)
(require 'color-theme-tomorrow)
(require 'color-theme-solarized)
;;(load "cool-blue")
;;(color-theme-solarized-dark)

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
(require 'anything-match-plugin)
(require 'anything-config)
(global-set-key (kbd "C-x b") 'anything-mini)
(global-set-key (kbd "C-x C-b") 'anything-mini)
(global-set-key (kbd "C-x C-i") 'anything-imenu)
(global-set-key (kbd "C-x i") 'anything-imenu)

(global-set-key (kbd "M-q") 'switch-to-buffer)
(global-set-key (kbd "C-q") 'nrepl-jump)
(global-set-key (kbd "C-M-h") 'nrepl-jump-back)
(global-set-key (kbd "M-r") 'paredit-reindent-defun)
(global-set-key (kbd "C-c 1") 'delete-other-windows)
(global-set-key (kbd "C-c 2") 'split-window)
(global-set-key (kbd "C-c 3") 'split-window-horizontally)

(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "C-S-o") 'next-buffer)
(global-set-key (kbd "C-S-u") 'previous-buffer)
(global-set-key (kbd "C-c b") 'anything-mini)
(global-set-key (kbd "C-c e") 'eval-buffer)
(global-set-key (kbd "C-r") 'undo)

(global-linum-mode 0)

;; enable evil
(require 'evil)
(evil-mode 1)
(show-paren-mode t)

;; C-h k (show keybinding def)
