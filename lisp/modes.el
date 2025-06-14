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

;; Webmode only has 6 indent width since html is highly indented
(defun my-web-mode ()
  (setq tab-width 8)
  (setq indent-tabs-mode t)

  (setq web-mode-markup-indent-offset 8)
  (setq web-mode-code-indent-offset 8)
  (setq web-mode-css-indent-offset 8)

  (yas-activate-extra-mode 'html-mode)
)

(defun goto-webmode () (setq web-mode t))

(add-hook 'web-mode-hook 'my-web-mode)
(add-hook 'javascript-mode-hook 'goto-webmode)
(add-hook 'html-mode-hook 'goto-webmode)
(add-hook 'css-mode-hook 'goto-webmode)

(with-eval-after-load 'yasnippet
   (define-key yas-minor-mode-map (kbd "TAB") nil)
   (define-key yas-minor-mode-map (kbd "<tab>") nil)
   (define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)
)

;; LSP
(setq lsp-lens-enable nil)
(setq lsp-headerline-breadcrumb-enable nil)

(provide 'modes)
