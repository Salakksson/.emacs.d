(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'best)

;; Transparency
(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))

;; Font
(set-face-attribute 'default nil
	:family "Victor Mono Nerd Font"
	:height 180
	:weight 'semi-bold)

;; Cursor
(setq-default cursor-type 'bar)
(blink-cursor-mode 1)

;; Line numbers
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(setq-default display-line-numbers-grow-only t)

(add-hook 'vterm-mode-hook (lambda () (display-line-numbers-mode 0)))

(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)

(provide 'theme)
