(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/"))
)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents)
)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
)

(eval-when-compile (require 'use-package))

(use-package magit
  :ensure t
  :commands (magit-status magit-log-all)
  :defer t
)

(use-package multiple-cursors
  :ensure t
  :bind (
         ("C-S-c C-S-c" . mc/edit-lines)
         ("C->"         . mc/mark-next-like-this)
         ("C-<"         . mc/mark-previous-like-this)
         ("C-c C-<"     . mc/mark-all-like-this)
  )
)

(with-eval-after-load 'multiple-cursors
    (add-hook 'multiple-cursors-mode-hook
	    (lambda ()
	      (define-key mc/keymap (kbd "<return>") nil)
	    )
    )
)

(use-package vterm
  :ensure t
  :commands (vterm vterm-other-window)
  :defer t
)

;; smarter M-x
(use-package smex
  :ensure t
  :commands smex
  :init
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
)

(use-package ido-completing-read+
  :ensure t
  :init
  (ido-mode t)
  (ido-everywhere 1)
  (ido-ubiquitous-mode 1)
)

;; lsp add ons
(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
)

(use-package flycheck
  :ensure t
  :hook (eglot-managed-mode . flycheck-mode)
)

(provide 'package-manager)
