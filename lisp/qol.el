(require 'package-manager)

(setq use-short-answers t)
(setq inhibit-splash-screen t)
(setq ring-bell-function 'ignore)

(electric-pair-mode 1)

(setq backward-delete-char-untabify-method nil)

(column-number-mode t)

;; (indent-guide-global-mode)
;; (setq indent-guide-recursive t)
;; (setq indent-guide-delay 0)

(with-eval-after-load 'company
    (define-key company-active-map (kbd "<return>") nil)
    (define-key company-active-map (kbd "RET") nil)
    (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
    (define-key company-active-map (kbd "TAB") #'company-complete-selection))

(delete-selection-mode 1)

(provide 'qol)
