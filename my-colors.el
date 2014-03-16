
(require 'golden-ratio)
;; this is needed to add the evil commands to
;; tell golden ratio to resize
(setq golden-ratio-extra-commands
      (append golden-ratio-extra-commands
              '(evil-window-left
                evil-window-right
                evil-window-up
                evil-window-down
                select-window-1
                select-window-2
                select-window-3
                select-window-4
                select-window-5)))
(golden-ratio-mode 1)

(tool-bar-mode -1)

(require 'rainbow-delimiters)
(rainbow-delimiters-mode 1)

(setq-default indent-tabs-mode nil)
(if (functionp 'set-face-attribute) 
    (set-face-attribute 'default nil
                        :font "Inconsolata-11"
                        ))
(require 'color-theme)
(require 'color-theme-tomorrow)
(require 'color-theme-solarized)
;;(load "cool-blue")
;;(color-theme-cool-blue)
;;(color-theme-solarized-dark)
(color-theme-tomorrow-night-bright)
(setq visible-bell t)
(setq default-tab-width 4)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(setq org-log-done t)


(font-lock-add-keywords 'clojure-mode
  '(("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)))
