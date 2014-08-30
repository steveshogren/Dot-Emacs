(unless (package-installed-p 'js2-mode)
  (package-install 'js2-mode))
(unless (package-installed-p 'skewer-mode)
  (package-install 'skewer-mode))
(unless (package-installed-p 'ac-js2)
  (package-install 'ac-js2))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook 'auto-complete-mode)
(defun js-set ()
  (define-key js2-mode-map (kbd "C-q") 'ac-js2-jump-to-definition)
  )
(add-hook 'js2-mode-hook 'js-set)

(font-lock-add-keywords
 'js2-mode `(("\\(function *\\)("
              (0 (progn (compose-region (match-beginning 1) (match-end 1) "ƒ")
                        nil)))))
