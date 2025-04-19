(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'package)
(require 'remove-bullshit)
(require 'theme)
(require 'qol)
(require 'tabs)

;; C settings
(require 'cc-mode)
(setq c-basic-offset 8)
(add-to-list 'c-default-style '(c-mode . "k&r"))
(c-set-offset 'arglist-close 0)
(c-set-offset 'case-label '+)
(setq-default indent-tabs-mode t)
(setq-default tab-width 8)

(setq whitespace-style (list 'tabs 'spaces 'space-before-tab 'space-after-tab 'space-mark 'tab-mark))

(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c d") 'dired-jump)
