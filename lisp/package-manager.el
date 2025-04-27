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
  :defer t)

(use-package ido-completing-read+
  :ensure t
  :defer t)

(use-package indent-guide
  :ensure t
  :commands indent-guide-mode
  :defer t)


(provide 'package-manager)
