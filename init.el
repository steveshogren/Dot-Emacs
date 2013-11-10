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
(add-to-list 'load-path "~/Dot-Emacs/geiser/elisp/")
(require 'geiser)
;;(load-file "~/Dot-Emacs/geiser/elisp/geiser.el")


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


(require 'rainbow-delimiters)
(add-hook 'scheme-mode 'rainbow-delimiters-mode)

(load "fsharp.el")
(load "enable-paredit.el")

(when (not (package-installed-p 'nrepl))
   (package-install 'nrepl))
 
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

(defun make-conditional-key-translation (key-from key-to translate-keys-p)
  (define-key key-translation-map key-from
    (lambda (prompt)
      (if (funcall translate-keys-p key-from) key-to key-from))))

(defun my-translate-keys-p (key-from)
   (or (evil-motion-state-p) (evil-normal-state-p) (evil-visual-state-p)))

;; (make-conditional-key-translation (kbd "g") (kbd "C-x") 'my-translate-keys-p)

(define-key evil-normal-state-map "e" nil)
(define-key evil-normal-state-map "eu" 'universal-argument)
(define-key key-translation-map (kbd "ee") (kbd "C-x C-e"))

;; C-h k (show keybinding def)

