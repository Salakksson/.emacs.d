(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")

(setq whitespace-style '(face tabs spaces trailing space-before-tab space-after-tab tab-mark space-mark))
(load-theme 'best)

(global-whitespace-mode)

;; Transparency
(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))

;; Font
(set-face-attribute 'default nil
	:family "Agave Nerd Font"
	:height 200
	:weight 'regular
)

;; This font is larger (?) so font size is smaller to make half a screen 80 chars²
;; (set-face-attribute 'default nil
;;	:family "Victor Mono Nerd Font"
;;	:height 200
;;	:weight 'regular
;; )

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
