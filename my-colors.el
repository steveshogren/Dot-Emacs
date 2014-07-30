
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
;; (require 'color-theme)
;; (require 'color-theme-tomorrow)
;; (require 'color-theme-solarized)

;; (mapcar #'disable-theme custom-enabled-themes)   

;; color-theme-comida 
;; color-theme-hober  // dark red/white
;; color-theme-pierson // very light white blue
;; color-theme-pok-wob
;; color-theme-id-dark
;; color-theme-xemacs // light white blue
;; color-theme-jsc-light2 // light no contrast
;; color-theme-tomorrow // light higher contrast

;; color-theme-tomorrow // light higher contrast
(if (functionp 'set-face-attribute) 
    (set-face-attribute 'default nil
                        :font "Inconsolata-12"
                        ))
;;(color-theme-solarized-dark)
;; (color-theme-tomorrow-night-bright)

;; (color-theme-comidia) ;; dark orange/blue
;; (color-theme-pok-wob) ;; dark yellow/white
(setq visible-bell t)
(setq default-tab-width 4)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(setq org-log-done t)


(font-lock-add-keywords 'clojure-mode
  '(("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)))
