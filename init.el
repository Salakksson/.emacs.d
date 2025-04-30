(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-safe-themes t)
(require 'theme) ;; most pressing issue which should be dealt with first

(require 'remove-bullshit)
(require 'package-manager)
(require 'qol)
(require 'tabs)
(require 'term)

;; C settings
(require 'cc-mode)
(setq c-basic-offset 8)
(add-to-list 'c-default-style '(c-mode . "k&r"))
(c-set-offset 'arglist-close 0)
(c-set-offset 'case-label '+)
(setq-default indent-tabs-mode t)
(setq-default tab-width 8)

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
(global-set-key (kbd "C-c d") 'dired-jump)
(global-set-key (kbd "C-c e") 'eval-buffer)

(defun reload-init-file ()
	(interactive)
	(setq load-path (copy-sequence initial-load-path))
	(setq exec-path (copy-sequence initial-exec-path))
	(load-file user-init-file))

(global-set-key (kbd "C-c r") #'reload-init-file)

(defun conf-dir ()
  "open .config in dired"
  (interactive)
  (dired "~/dotfiles/.config/")
)

(defun proj-dir ()
  "open projects in dired"
  (interactive)
  (dired "~/code/")
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

(defun reload-conf ()
  "reload config"
  (interactive)
  (load "~/.config/emacs/init.el")
)
