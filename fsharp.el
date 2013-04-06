
(unless (package-installed-p 'fsharp-mode)
  (package-install 'fsharp-mode))
(require 'fsharp-mode)
(setq inferior-fsharp-program "fsharpi --readline-")
(setq fsharp-compiler "fsharpc")
