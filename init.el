;; To use: checkout git repo into ~/.emacs.d/

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(add-to-list 'load-path "~/.emacs.d/color-theme-solarized/")
(add-to-list 'load-path "~/.emacs.d/evil/")
(add-to-list 'load-path "~/.emacs.d/tomorrow-theme/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/geiser/elisp/")
(require 'geiser)
;;(load-file "~/.emacs.d/geiser/elisp/geiser.el")


(defun gsl-runner ()
  (interactive)
  (shell-command (concat "gsl " (buffer-file-name))))
(global-set-key (kbd "C-x :") 'gsl-runner)

(defun haskell-repl-c ()
  (interactive) ;; tells emacs that the function is a command
  (evil-window-right 1)
  (insert ":r") 
  (comint-send-input) 
  (evil-window-left 1))
(global-set-key (kbd "C-x :") 'haskell-repl-c)
(global-set-key (kbd "<f4>") 'haskell-repl-c)


;; Marmalade Package Manager
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(load "fsharp.el")
(load "enable-paredit.el")

(unless (package-installed-p 'cider)
  (package-install 'cider))
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-repl-pop-to-buffer-on-connect nil)
;; (set cider-repl-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock t)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

(when (not (package-installed-p 'helm))
   (package-install 'helm))
(when (not (package-installed-p 'haskell-mode))
   (package-install 'haskell-mode))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook (lambda () (setq evil-auto-indent nil)))

(require 'helm-config)
(require 'helm-git-grep)
(global-set-key (kbd "C-c g") 'helm-git-grep)
(global-set-key (kbd "C-*") 'helm-git-grep-at-point)
;; (toggle-frame-fullscreen)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(load "increment-number.el")
(load "my-colors.el")
(load "desktopsaves.el")

(load "clojure-settings.el")

(require 'anything-match-plugin)
(require 'anything-config)

(winner-mode 1)
(load "shortcuts.el")

(global-linum-mode 0)

;; enable evil
(require 'evil)
(evil-mode 1)
(show-paren-mode t)


;; insert mode window move
(define-key evil-motion-state-map (kbd "C-w") nil)
(define-key evil-insert-state-map (kbd "C-w") nil)
(define-prefix-command 'window-move-map)
(define-key evil-insert-state-map (kbd "C-w") window-move-map)
(define-key evil-insert-state-map (kbd "C-w l") 'evil-window-right)
(define-key evil-insert-state-map (kbd "C-w h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "C-w") window-move-map)
(define-key evil-motion-state-map (kbd "C-w l") 'evil-window-right)
(define-key evil-motion-state-map (kbd "C-w h") 'evil-window-left)

;; change magit diff colors
(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
(defun disable-magit-highlight-in-buffer () 
  (face-remap-add-relative 'magit-item-highlight '()))
(add-hook 'magit-status-mode-hook 'disable-magit-highlight-in-buffer)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; C-h k (show keybinding def)
;; C-M-x - eval form at point (in elisp, nrepl, and geiser)

;; Look into:
;;  Abbrev
;;  Auto fill mode
;;  Bookmarks
;;  Byte Compliation
;;  Completion
;;  Dired
;;  Dribble file
;;  Electric
;;  Highlighting
;;  Hooks
;;  Recursive Editing 
;;  Speedbar
;;  Spelling
;;  Syntax Tables
;;  Tags

;; -- Info-major-mode --
;; info-up ^
;; info-next n
;; info-prev p
;; info-search s

;; In Clojure (dir ns ) lists the functions in the ns

;; HTML-mode
;; close html tag -  C-c / 
;; delete html tags -  C-c C-d 
