(setq-default tab-width 8)
(setq-default indent-tabs-mode t)

;; C/C++
(defun my/c-mode ()
    (c-set-style "bsd")
    (setq c-basic-offset 8)
    (c-set-offset 'arglist-close 0)
    (c-set-offset 'case-label 0)
    (setq indent-tabs-mode t)
    (setq tab-width 8)
)

(use-package cc-mode
  :ensure nil
  :mode ("\\.c\\'" . my/c-mode)
  :hook ((c-mode c++-mode) . my/c-mode)
)

;; C#
(defun my/csharp-mode ()
  (setq c-basic-offset 8)
  (setq indent-tabs-mode t)
  (setq tab-width 8)
)

(use-package csharp-mode
  :ensure t
  :mode "\\.cs\\'"
  :hook (csharp-mode . eglot-ensure)
)

;; Python
(defun my/python-mode ()
  (setq python-indent-offset 8)
  (setq indent-tabs-mode t)
  (setq tab-width 8)
)

;; Shell
(defun my/shell-mode ()
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq sh-basic-offset 8)
)

(defun my/lisp-mode ()
  (setq indent-tabs-mode f)
)

(add-hook 'c-mode-common-hook 'my/c-mode)
(add-hook 'csharp-mode-common-hook 'my/csharp-mode)
(add-hook 'python-mode-hook 'my/python-mode)
(add-hook 'sh-mode-hook 'my/shell-mode)
(add-hook 'markdown-mode-hook #'visual-line-mode)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '((csharp-mode) . ("csharp-ls")))
  (add-to-list 'eglot-ignored-server-capabilities
               :documentOnTypeFormattingProvider)
)

(defun my/lsp-mode ()
  (eglot-inlay-hints-mode 0)
)

(add-hook 'eglot-managed-mode-hook 'my/lsp-mode)

(provide 'modes)
