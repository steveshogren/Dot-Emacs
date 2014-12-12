;;; karma-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (karma-mode karma-version) "karma" "karma.el" (21642
;;;;;;  64038 914154 373000))
;;; Generated autoloads from karma.el

(autoload 'karma-version "karma" "\
Get the Karma version as string.

If called interactively or if SHOW-VERSION is non-nil, show the
version in the echo area and the messages buffer.

The returned string includes both, the version from package.el
and the library version, if both a present and different.

If the version number could not be determined, signal an error,
if called interactively, or if SHOW-VERSION is non-nil, otherwise
just return nil.

\(fn &optional SHOW-VERSION)" t nil)

(autoload 'karma-mode "karma" "\
Toggle karma mode.

Key bindings:
\\{karma-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("karma-pkg.el") (21642 64039 24189 707000))

;;;***

(provide 'karma-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; karma-autoloads.el ends here
