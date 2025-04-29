(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package magit
  :ensure t
  :commands (magit-status magit-log-all)
  :defer t)

(use-package multiple-cursors
  :ensure t
  :commands (mc/edit-lines mc/mark-all-dwim)
  :defer t)

(use-package vterm
  :ensure t
  :commands (vterm vterm-other-window)
  :defer t)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :defer t)

(use-package lsp-mode
  :ensure t
  :defer t
  :hook ((python-mode . lsp)
         (c-mode . lsp)
         (cpp-mode . lsp)))

(use-package flycheck
  :ensure t
  :defer t
  :hook (lsp-mode . flycheck-mode))

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :defer t)

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
  (ido-ubiquitous-mode 1))

(use-package indent-guide
  :ensure t
  :commands indent-guide-mode
  :defer t)


(provide 'package-manager)
