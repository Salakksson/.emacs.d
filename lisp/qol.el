(require 'package-manager)

(setq use-short-answers t)
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)

(electric-pair-mode 1)

(setq backward-delete-char-untabify-method nil)

;; (indent-guide-global-mode)

;; (setq indent-guide-recursive t)
;; (setq indent-guide-delay 0)

(delete-selection-mode 1)

(provide 'qol)
