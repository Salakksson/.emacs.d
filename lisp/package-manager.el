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

(use-package vterm
  :ensure t
  :commands (vterm vterm-other-window)
  :defer t
)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :defer t
)

(use-package flycheck
  :ensure t
  :defer t
  :hook (lsp-mode . flycheck-mode)
)

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :defer t
)

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

(use-package indent-guide
  :ensure t
  :commands indent-guide-mode
  :defer t
)

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
)

(use-package yasnippet-snippets
  :ensure t
)

(use-package csharp-mode
  :ensure t
  :mode "\\.cs\\'"
  :hook (csharp-mode . lsp)
)

(use-package lsp-mode
  :ensure t
  :defer t
  :hook ((python-mode . lsp)
         (csharp-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp))
  :config
  (setq lsp-clients-clangd-executable "clangd")
  (setq lsp-disabled-clients '(omnisharp))
  (setq lsp-csharp-server-path "csharp-ls")
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
                     (lambda () (cons lsp-clients-clangd-executable lsp-clients-clangd-args)))
    :major-modes '(c-mode c++-mode objc-mode)
    :server-id 'clangd))
  (lsp-register-client
   (make-lsp-client
    :new-connection (lsp-stdio-connection
                     (lambda () (list (expand-file-name "csharp-ls"))))
    :major-modes '(csharp-mode)
    :server-id 'csharp-ls
    :activation-fn (lsp-activate-on "csharp")
    :add-on? t
    :priority 1
   )
  )
)

(provide 'package-manager)
