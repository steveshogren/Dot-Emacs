(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.3)
 '(ac-modes nil)
 '(ac-quick-help-delay 0.5)
 '(desktop-save-mode 1)
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector ["#534636" "#cb6077" "#beb55b" "#f4bc87" "#8ab3b5" "#a89bb9" "#8ab3b5" "#e9e1dd"])
 '(ansi-term-color-vector [unspecified "#534636" "#cb6077" "#beb55b" "#f4bc87" "#8ab3b5" "#a89bb9" "#8ab3b5" "#e9e1dd"])
 '(company-idle-delay 0.0)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes (quote ("191a1493fc7c3252ae949cc42cecc454900e3d4d1feb96f480cf9d1c40c093ee" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "8643546ef586d1bc6e887c0aceab520b086126f13a86631c917f293b2c660cf1" "1d9f2295049aacd2ba2cf0068b8b6985b78e1913c001135cc7d9930b037493e5" "545287ef14b1b686cd88a99cf6ab3629e55ef6b73d59a76253eec65f4ead4fee" "1cc69add80a116d4ceee9ab043bb3d372f034586da54c9677d0fff99231e5eb9" "bd6e539f641b33aeaf21ae51266bd9dfd6c1f2d550d109192e1c678b440242ad" "a0aca9963b34ddf04767e2fe85abd67009bdf975027b81bac385a7e9d549f54d" "03b649ae49a7d40c7115611f1da3e126c33c10b96dd18ee45bdd8319ed375a78" default)))
 '(fci-rule-color "#373b41")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#cc6666") (40 . "#de935f") (60 . "#f0c674") (80 . "#b5bd68") (100 . "#8abeb7") (120 . "#81a2be") (140 . "#b294bb") (160 . "#cc6666") (180 . "#de935f") (200 . "#f0c674") (220 . "#b5bd68") (240 . "#8abeb7") (260 . "#81a2be") (280 . "#b294bb") (300 . "#cc6666") (320 . "#de935f") (340 . "#f0c674") (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-preview ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common ((t (:inherit company-preview))))
 '(company-scrollbar-bg ((t (:background "#191919"))))
 '(company-scrollbar-fg ((t (:background "#0c0c0c"))))
 '(company-tooltip ((t (:inherit default :background "#050505"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-common-selection ((((type x)) (:inherit company-tooltip-selection :weight bold)) (t (:inherit company-tooltip-selection))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
 '(helm-ff-directory ((t (:foreground "#70c0b1"))))
 '(helm-selection ((t (:box (:line-width 2 :color "forest green")))))
 '(magit-diff-add ((t (:foreground "green3"))) t)
 '(magit-diff-del ((t (:foreground "red3"))) t)
 '(magit-log-head-label-bisect-bad ((t (:foreground "#d54e53" :box 1))) t)
 '(magit-log-head-label-bisect-good ((t (:foreground "#b9ca4a" :box 1))) t)
 '(magit-log-head-label-bisect-skip ((t (:foreground "dark goldenrod" :box 1))) t)
 '(magit-log-head-label-default ((t (:foreground "#e7c547" :box nil :weight bold))) t)
 '(magit-log-head-label-patches ((t (:foreground "IndianRed4" :box 1))) t))

;; To use: checkout git repo into ~/.emacs.d/

(setq comint-scroll-show-maximum-output 1)
(setq comint-scroll-to-bottom-on-output 1)
(set-frame-parameter nil 'fullscreen 'maximized)

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(add-to-list 'load-path "~/.emacs.d/color-theme-solarized/")
(add-to-list 'load-path "~/.emacs.d/evil/")
(add-to-list 'load-path "~/.emacs.d/tomorrow-theme/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/geiser/elisp/")
(require 'geiser)
(setq evil-toggle-key "C-M-~")
(setq evil-symbol-word-search 1)


(require 'evil)
(evil-mode 1)
(require 'evil-paredit)
(setq evil-auto-indent 1)

(add-hook 'paredit-mode-hook 'evil-paredit-mode)

(setq scroll-margin 1
  ;;    scroll-step 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)
(setq auto-window-vscroll nil)
;; (setq redisplay-dont-pause t)

(setq cider-words-of-inspiration '("You realize that all your life you have been coasting along as if you were in a dream. Suddenly, facing the trials of the last few days, you have come alive."
                                    "You realize that you are catching on to the secret of success. It's just a matter of concentration."
                                    "It's all suddenly obvious to you. You just have to concentrate. All the energy and time you've wasted -- it's a sin. But without the experience you've gained, taking risks, taking responsibility for failure, how could you have understood?"
                                    "Everything you do is just a bit easier, more instinctive, more satisfying. It is as though you had suddenly developed keen senses and instincts."
                                    "You sense yourself more aware, more open to new ideas. You've learned a lot about Morrowind. It's hard to believe how ignorant you were -- but now you have so much more to learn."
                                    "You resolve to continue pushing yourself. Perhaps there's more to you than you thought."
                                    "The secret does seem to be hard work, yes, but it's also a kind of blind passion, an inspiration."
                                    "Everything you do is just a bit easier, more instinctive, more satisfying. It is as though you had suddenly developed keen senses and instincts."
                                    "You woke today with a new sense of purpose. You're no longer afraid of failure. Failure is just an opportunity to learn something new."
                                    "Being smart doesn't hurt. And a little luck now and then is nice. But the key is patience and hard work. And when it pays off, it's SWEET!"
                                    "You can't believe how easy it is. You just have to go -- a little crazy. And then, suddenly, it all makes sense, and everything you do turns to gold."
                                    "It's the most amazing thing. Yesterday it was hard, and today it is easy. Just a good night's sleep, and yesterday's mysteries are today's masteries."
                                    "Today you wake up, full of energy and ideas, and you know, somehow, that overnight everything has changed. What a difference a day makes."))



(defun format-file ()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-region (point-min) (point-max))))
(global-set-key (kbd "<f6>") 'format-file)


(defun gsl-runner ()
  (interactive)
  (shell-command (concat "gsl " (buffer-file-name))))

;; (global-set-key (kbd "C-x :") 'gsl-runner)

;; Marmalade Package Manager
(require 'package)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (when (< emacs-major-version 24) (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)


;;(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

(tabbar-mode)
(defun my-tabbar-buffer-groups ()
  (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
              ((eq major-mode 'dired-mode) "emacs")
              (t "user"))))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)

(load "enable-paredit.el")
(load "increment-number.el")
(load "my-colors.el")
(load "desktopsaves.el")

(when (not (package-installed-p 'dash))
  (package-install 'dash))
(eval-after-load "dash" '(dash-enable-font-lock))

(when (not (package-installed-p 'helm))
  (package-install 'helm))
(require 'helm-config)
(require 'helm-git-grep)
(require 'helm-ls-git)

(load "helm-settings.el")

(load "js-settings.el")
(load "haskell-settings.el")
(load "scheme-settings.el")
(load "clojure-settings.el")
(load "emacs-lisp-settings.el")
(load "magit-settings.el")
(load "waiter.el")

(add-to-list 'auto-mode-alist '("\\Rakefile\\'" . ruby-mode))

(require 'anything-match-plugin)
(require 'anything-config)

(winner-mode 1)
(load "shortcuts.el")

(global-linum-mode 1)

;; enable evil
(show-paren-mode t)

(setq evil-default-cursor t)
(set-cursor-color "#ffffff") 

(delete-other-windows)

(add-hook 'after-init-hook 'global-company-mode)

(global-git-gutter-mode 1)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)
(global-set-key (kbd "C-<f2>") 'git-gutter:popup-hunk)
(add-hook 'git-gutter:update-hooks 'magit-revert-buffer-hook)

(defun esc-cmd () 
  (interactive) 
  (format-file))

;; (bound-and-true-p cider-mode)

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
