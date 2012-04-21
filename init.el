(add-to-list 'load-path "~/Dot-Emacs/.emacs.d/")
(add-to-list 'load-path "~/Dot-Emacs/.emacs.d/color-theme/")
(add-to-list 'load-path "~/Dot-Emacs/.emacs.d/color-theme-solarized/")

(setq-default indent-tabs-mode nil)
(setq viper-mode t)
(line-number-mode 1)
(require 'vimpulse)
(require 'actionscript-mode)

(global-set-key (kbd "C-s") 'save-buffer)

(global-auto-revert-mode t)
(add-to-list 'auto-mode-alist '("\\.as\\'" . actionscript-mode))

;; colors
(require 'color-theme)
(require 'color-theme-solarized)

(load "cool-blue")
;;(color-theme-solarized-dark)

(setq visible-bell t)
(setq default-tab-width 4)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(load "toggle-fullscreen")
