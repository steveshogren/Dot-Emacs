;; makes emacs reload buffers without asking
(global-auto-revert-mode t)

(desktop-save-mode 1)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)
