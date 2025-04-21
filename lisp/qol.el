(require 'package)

;; Auto complete in the minibuffer
(require 'ido)
(require 'ido-completing-read+)
(ido-mode t)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

;; More auto complete
(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(setq use-short-answers t)
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)

;; (global-flex-autopair-mode 0)
(electric-pair-mode 1)


(provide 'qol)
