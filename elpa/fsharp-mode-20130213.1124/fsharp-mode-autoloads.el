;;; fsharp-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (fsharp-mode) "fsharp-mode" "fsharp-mode.el" (20797
;;;;;;  1002))
;;; Generated autoloads from fsharp-mode.el

(add-to-list 'auto-mode-alist '("\\.fs[iylx]?$" . fsharp-mode))

(autoload 'fsharp-mode "fsharp-mode" "\
Major mode for editing fsharp code.

\\{fsharp-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (ac-fsharp-gotodefn-at-point ac-fsharp-tooltip-at-point
;;;;;;  ac-fsharp-launch-completion-process ac-fsharp-quit-completion-process
;;;;;;  ac-fsharp-load-project) "fsharp-mode-completion" "fsharp-mode-completion.el"
;;;;;;  (20797 1002))
;;; Generated autoloads from fsharp-mode-completion.el

(autoload 'ac-fsharp-load-project "fsharp-mode-completion" "\
Load the specified F# file as a project

\(fn FILE)" t nil)

(autoload 'ac-fsharp-quit-completion-process "fsharp-mode-completion" "\


\(fn)" t nil)

(autoload 'ac-fsharp-launch-completion-process "fsharp-mode-completion" "\
Launch the F# completion process in the background

\(fn)" t nil)

(autoload 'ac-fsharp-tooltip-at-point "fsharp-mode-completion" "\
Fetch and display F# tooltips at point

\(fn)" t nil)

(autoload 'ac-fsharp-gotodefn-at-point "fsharp-mode-completion" "\
Find the point of declaration of the symbol at point and goto it

\(fn)" t nil)

;;;***

;;;### (autoloads (run-fsharp) "inf-fsharp-mode" "inf-fsharp-mode.el"
;;;;;;  (20797 1002))
;;; Generated autoloads from inf-fsharp-mode.el

(autoload 'run-fsharp "inf-fsharp-mode" "\
Run an inferior fsharp process.
Input and output via buffer `*inferior-fsharp*'.

\(fn &optional CMD)" t nil)

;;;***

;;;### (autoloads nil nil ("fsharp-mode-font.el" "fsharp-mode-indent.el"
;;;;;;  "fsharp-mode-pkg.el") (20797 1002 767945))

;;;***

(provide 'fsharp-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; fsharp-mode-autoloads.el ends here
