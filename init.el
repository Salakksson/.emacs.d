(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-safe-themes t)
(require 'theme) ;; most pressing issue which should be dealt with first

(require 'remove-bullshit)
(require 'package-manager)
(require 'qol)
(require 'tabs)
(require 'term)

(require 'cc-mode)

(defun my-c-style ()
    (c-set-style "bsd")
    (setq c-basic-offset 8)
    (c-set-offset 'arglist-close 0)
    (c-set-offset 'case-label 0)
    (setq indent-tabs-mode t)
    (setq tab-width 8)
)

(add-hook 'c-mode-common-hook 'my-c-style)

(setq lsp-lens-enable nil)
(setq lsp-headerline-breadcrumb-enable nil)

;; Shell settings
(add-hook 'sh-mode-hook
	(lambda ()
		(setq tab-width 8)
		(setq indent-tabs-mode t)
		(setq sh-basic-offset 8)
	)
)

(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-c d") 'dired-jump)
(global-set-key (kbd "C-c e") 'eval-buffer)
(global-set-key (kbd "C-c t")
                (lambda ()
                  (interactive)
                  (vterm)
                  (rename-buffer (generate-new-buffer-name "*vterm*"))))
(add-hook 'before-save-hook 'whitespace-cleanup)

(defun my/confirm-exit ()
	(interactive)
	(when (y-or-n-p "Really quit Emacs? ")
	  (save-buffers-kill-terminal)
	)
)

(global-set-key (kbd "C-x C-c") 'my/confirm-exit)


(defun reload-init-file ()
	(interactive)
	(setq load-path (copy-sequence initial-load-path))
	(setq exec-path (copy-sequence initial-exec-path))
	(load-file user-init-file)
)

(global-set-key (kbd "C-c r") #'reload-init-file)

(defun conf-dir ()
  "open .config in dired"
  (interactive)
  (dired "~/dots/.config/")
)

(defun proj-dir ()
  "open projects in dired"
  (interactive)
  (dired "/h/code/")
)

(defun git-dir ()
  "open git dir in dired"
  (interactive)
  (dired "/h/git/")
)

(defun home-dir ()
  "open /h in dired"
  (interactive)
  (dired "/h/")
)

(defun init-el ()
  "open init.el"
  (interactive)
  (find-file "~/.config/emacs/init.el")
)

(defun todo ()
  "open todo"
  (interactive)
  (find-file "/h/todo.org")
)

(defun pamde ()
  "open pamde file"
  (interactive)
  (find-file "/usr/local/share/pamde/main.conf")
)

(defun reload-conf ()
  "reload config"
  (interactive)
  (load "~/.config/emacs/init.el")
)

(defun bigrat ()
  "bigrat"
  (interactive)
  (find-file "/h/bigrat.jpg")
)

(defun sudo-this-file ()
  "sudo"
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (let ((new-filename (concat "/sudo::" filename)))
          (set-visited-file-name new-filename t)
          (revert-buffer t t t))
      (message "This buffer is not visiting a file"))))

