(define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level)
;; (define-key helm-find-files-map (kbd "RET") 'helm-execute-persistent-action)

(setq helm-ff-auto-update-initial-value 't)
(setq helm-ff-transformer-show-only-basename nil)

(defun helm-buffers-and-recent ()
  (interactive)
  (helm :sources '(helm-source-buffers-list
                   helm-source-recentf)
        :buffer "*helm-find-buffers*"
        :default-directory "/home/web/development/cloudant-listener"))


(defun helm-co ()
  (interactive)
  (helm :sources '(;; helm-source-findutils
                   helm-source-buffers-list
                   helm-source-ls-git
                   helm-source-recentf)
        :buffer "*helm-find-project-files*"
        :default-directory "/home/web/development/cloudant-listener"))

(global-set-key (kbd "C-S-t") 'helm-ls-git-ls)
(global-set-key (kbd "C-x C-b") 'helm-buffers-and-recent)
(global-set-key (kbd "C-x b") 'helm-buffers-and-recent)
(global-set-key (kbd "C-c b") 'helm-buffers-and-recent)
(global-set-key (kbd "C-c C-b") 'helm-buffers-and-recent)

;; (global-set-key (kbd "C-S-f") 'helm-git-grep)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)

(add-to-list 'grep-find-ignored-directories "node_modules")
(add-to-list 'grep-find-ignored-directories ".git")

(defun helm-do-grep-recursive (&optional non-recursive)
  "Like `helm-do-grep', but greps recursively by default."
  (interactive "P")
  (let* ((current-prefix-arg (not non-recursive))
         (helm-current-prefix-arg non-recursive))
    (call-interactively 'helm-do-grep)))
(global-set-key (kbd "C-S-f") 'helm-do-grep-recursive)

(defun helm-project-search (exts)
  (interactive "sSearch extensions separated by spaces (default: clj json js html css): ")
  (helm-do-grep-1 (list (helm-git-grep-get-top-dir))
                  1
                  nil
                  (or (-map (lambda (x) (concat "*." x))
                            (split-string exts))
                      '("*.clj" "*.json" "*.js" "*.html" "*.css"))))
(global-set-key (kbd "C-S-M-f") 'helm-project-search)
