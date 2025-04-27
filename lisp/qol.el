(require 'package-manager)

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

(electric-pair-mode 1)

(setq backward-delete-char-untabify-method nil)

(indent-guide-global-mode)

(setq indent-guide-recursive t)
(setq indent-guide-delay 0)

(delete-selection-mode 1)

(provide 'qol)
