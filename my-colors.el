
(require 'golden-ratio)

(require 'rainbow-delimiters)
(rainbow-delimiters-mode 1)

(setq-default indent-tabs-mode nil)
(set-face-attribute 'default nil :font "Liberation Mono-12" :weight 'bold)
(require 'color-theme)
(require 'color-theme-tomorrow)
(require 'color-theme-solarized)
;;(load "cool-blue")
;;(color-theme-solarized-dark)
(color-theme-tomorrow-night)
(setq visible-bell t)
(setq default-tab-width 4)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(setq org-log-done t)
