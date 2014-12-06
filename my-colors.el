
(unless (package-installed-p 'color-theme-sanityinc-tomorrow)
  (package-install 'color-theme-sanityinc-tomorrow))

(require 'golden-ratio)
;; this is needed to add the evil commands to
;; tell golden ratio to resize
(setq golden-ratio-extra-commands
      (append golden-ratio-extra-commands
              '(evil-window-left
                evil-window-right
                evil-window-up
                evil-window-down
                quit-window
                magit-quit-window
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
(require 'color-theme)
(require 'color-theme-tomorrow)

;; (mapcar #'disable-theme custom-enabled-themes)   

;; color-theme-comida 
;; color-theme-hober  // dark red/white
;; color-theme-pierson // very light white blue
;; color-theme-pok-wob
;; color-theme-id-dark
;; color-theme-xemacs // light white blue
;; color-theme-jsc-light2 // light no contrast
;; color-theme-tomorrow // light higher contrast
;; (color-theme-comidia) ;; dark orange/blue
;; (color-theme-pok-wob) ;; dark yellow/white


;; color-theme-tomorrow // light higher contrast

(defun font-exists (font-name)
  (find-font (font-spec :name font-name)))

(defun set-font-if-exists (font-name)
  (if (and window-system
           (functionp 'set-face-attribute)
           (font-exists font-name)) 
      (set-face-attribute 'default nil
                          :font font-name)))

(if (file-exists-p "steves.el")
    (set-font-if-exists "Inconsolata-11")
  (set-font-if-exists "SourceCodePro-12"))

(color-theme-sanityinc-tomorrow-bright)

(setq visible-bell t)
(setq default-tab-width 4)
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(setq org-log-done t)


(font-lock-add-keywords 'clojure-mode
                        '(("\\<\\(and\\|or\\|not\\)\\>" . font-lock-keyword-face)))

(defun my-buffer-face-mode-variable (color)
  "Set font to a variable width (proportional) fonts in current buffer"
  (interactive)
  (setq buffer-face-mode-face (list :background color))
  (buffer-face-mode 1))

(defun my-set-theme-on-mode ()
  "set background color depending on file suffix"
  (interactive)
  (let ((file-name (buffer-file-name)))
    (cond
     ((string-match "halcyon" file-name) (my-buffer-face-mode-variable "#00001A"))
     ;; ((string-match "dwarf" file-name) (my-buffer-face-mode-variable "#001A1A"))
     ;; ((string-match "nimbus" file-name) (my-buffer-face-mode-variable "black"))
     ;; ((string-match ".emacs" file-name) (my-buffer-face-mode-variable "#00001A"))
     ;; ((string-match "overseer" file-name) (my-buffer-face-mode-variable "black"))
     (t ""))))



(defun disable-all-buffer-face-mode ()
  (interactive)
  (let ((current (get-buffer (current-buffer))))
    (-map (lambda (x) (progn (switch-to-buffer x)
                             (buffer-face-mode 0))) (buffer-list))
    (switch-to-buffer current 1)))

(add-hook 'helm-after-action-hook 'my-set-theme-on-mode)
(add-hook 'find-file-hook 'my-set-theme-on-mode)
(add-hook 'kill-emacs-hook 'disable-all-buffer-face-mode)

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


