;; General: hope modes dont molest these settings
(setq-default tab-width 8)
(setq-default indent-tabs-mode t)

;; C mode
(require 'cc-mode)

(defun my-c-style ()
    (c-set-style "bsd")
    (setq c-basic-offset 8)
    (c-set-offset 'arglist-close 0)
    (c-set-offset 'case-label 0)
    (setq indent-tabs-mode t)
    (setq tab-width 8)
)

(add-hook 'c-mode-common-hook 'my-c-style)

;; Python mode
(defun my-python-mode ()
  (setq python-indent-offset 8)
  (setq indent-tabs-mode t)
  (setq tab-width 8)
)

(add-hook 'python-mode-hook 'my-python-mode)

;; Shell mode
(defun my-shell-mode ()
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq sh-basic-offset 8)
)

(add-hook 'sh-mode-hook 'my-shell-mode)

(defun my-web-mode ()
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (yas-activate-extra-mode 'html-mode)
)

(add-hook 'web-mode-hook 'my-web-mode)

(with-eval-after-load 'yasnippet
   (define-key yas-minor-mode-map (kbd "TAB") nil)
   (define-key yas-minor-mode-map (kbd "<tab>") nil)
   (define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)
)

;; LSP
(setq lsp-lens-enable nil)
(setq lsp-headerline-breadcrumb-enable nil)

(provide 'modes)
