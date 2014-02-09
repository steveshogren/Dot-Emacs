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
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


(require 'rainbow-delimiters)
(add-hook 'scheme-mode 'rainbow-delimiters-mode)

(load "fsharp.el")
(load "enable-paredit.el")

(when (not (package-installed-p 'nrepl))
   (package-install 'nrepl))
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

(load "git-gutter.el")
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

;; C-h k (show keybinding def)
;; C-M-x - eval form at point (in elisp, nrepl, and geiser)

