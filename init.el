;; To use: checkout git repo into ~/.emacs.d/

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(add-to-list 'load-path "~/.emacs.d/color-theme-solarized/")
(add-to-list 'load-path "~/.emacs.d/evil/")
(add-to-list 'load-path "~/.emacs.d/tomorrow-theme/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/geiser/elisp/")
(require 'geiser)
(require 'evil)
(evil-mode 1)


(defun gsl-runner ()
  (interactive)
  (shell-command (concat "gsl " (buffer-file-name))))
;; (global-set-key (kbd "C-x :") 'gsl-runner)

;; Marmalade Package Manager
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)


(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(when (not (package-installed-p 'helm))
   (package-install 'helm))
(require 'helm-config)
(require 'helm-git-grep)


;;(scroll-bar-mode 0)
;;(tool-bar-mode 0)
;;(menu-bar-mode 0)
(tabbar-mode)
(defun my-tabbar-buffer-groups ()
   (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
               ((eq major-mode 'dired-mode) "emacs")
               (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

(load "fsharp.el")
(load "enable-paredit.el")
(load "increment-number.el")
(load "my-colors.el")
(load "desktopsaves.el")

(load "js-settings.el")
(load "haskell-settings.el")
(load "scheme-settings.el")
(load "clojure-settings.el")
(load "emacs-lisp-settings.el")
(load "magit-settings.el")

(require 'anything-match-plugin)
(require 'anything-config)

(winner-mode 1)
(load "shortcuts.el")

(global-linum-mode 1)

;; enable evil
(show-paren-mode t)

(setq evil-default-cursor t)
(set-cursor-color "#0000cd") 

;; C-h k (show keybinding def)
;; C-M-x - eval form at point (in elisp, nrepl, and geiser)

;; search - rgrep

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#534636" "#cb6077" "#beb55b" "#f4bc87" "#8ab3b5" "#a89bb9" "#8ab3b5" "#e9e1dd"])
 '(ansi-term-color-vector [unspecified "#534636" "#cb6077" "#beb55b" "#f4bc87" "#8ab3b5" "#a89bb9" "#8ab3b5" "#e9e1dd"])
 '(custom-safe-themes (quote ("8643546ef586d1bc6e887c0aceab520b086126f13a86631c917f293b2c660cf1" "1d9f2295049aacd2ba2cf0068b8b6985b78e1913c001135cc7d9930b037493e5" "545287ef14b1b686cd88a99cf6ab3629e55ef6b73d59a76253eec65f4ead4fee" "1cc69add80a116d4ceee9ab043bb3d372f034586da54c9677d0fff99231e5eb9" "bd6e539f641b33aeaf21ae51266bd9dfd6c1f2d550d109192e1c678b440242ad" "a0aca9963b34ddf04767e2fe85abd67009bdf975027b81bac385a7e9d549f54d" "03b649ae49a7d40c7115611f1da3e126c33c10b96dd18ee45bdd8319ed375a78" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
