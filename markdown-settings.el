(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'auto-fill-mode)
