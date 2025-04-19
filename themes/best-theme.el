(deftheme best "Best emacs theme ever")

(let
	(
	 (class '((class color) (min-colors 89)))

	 ;; Primary
	 (fg "#c0caf5")
	 (bg "#1a1b26")

	 ;; Normal
	 (black "#15161E")
	 (red "#f7768e")
	 (green "#9ece6a")
	 (yellow "#e0af68")
	 (blue "#7aa2f7")
	 (magenta "#bb9af7")
	 (cyan "#7dcfff")
	 (white "#a9b1d6")

	 ;; Bright
	 (br-black "#414868")
	 (br-red "#f7768e")
	 (br-green "#9ece6a")
	 (br-yellow "#e0af68")
	 (br-blue "#7aa2f7")
	 (br-magenta "#bb9af7")
	 (br-cyan "#7dcfff")
	 (br-white "#c0caf5")

	 ;; Indexed
	 (color-16 "#ff9e64")
	 (color-17 "#db4b4b")
	)
	(custom-theme-set-faces
	 'best
	 
	 ;; Basic
	 `(default ((,class (:foreground ,fg :background ,bg))))
	 `(cursor ((,class (:background ,fg))))
	 `(region ((,class (:background ,br-black))))
	 `(highlight ((,class (:background ,br-black))))
	 `(minibuffer-prompt ((,class (:foreground ,blue :bold t))))
	 `(vertical-border ((,class (:foreground ,black))))

	 ;; Font-lock
	 `(font-lock-builtin-face ((,class (:foreground ,magenta))))
	 `(font-lock-comment-face ((,class (:foreground ,br-black))))
	 `(font-lock-constant-face ((,class (:foreground ,cyan))))
	 `(font-lock-function-name-face ((,class (:foreground ,blue))))
	 `(font-lock-keyword-face ((,class (:foreground ,red))))
	 `(font-lock-string-face ((,class (:foreground ,green))))
	 `(font-lock-type-face ((,class (:foreground ,yellow))))
	 `(font-lock-variable-name-face ((,class (:foreground ,white))))
	 `(font-lock-warning-face ((,class (:foreground ,color-17 :bold t))))

	 `(mode-line ((t ,(list :background "#2a2b37"
				:foreground "#eeeeee"))))
	 `(mode-line-inactive ((t ,(list :background "#1f202e"
					 :foreground "#eeeeee"))))
	 ;; Tab Bar Mode
	 `(tab-bar ((,class (:background ,bg :foreground ,fg))))
	 `(tab-bar-tab ((,class (:background "#2a2b37" :foreground ,fg :bold t))))
	 `(tab-bar-tab-inactive ((,class (:background "#1f202e" :foreground ,br-white))))
	 `(tab-bar-tab-selected ((,class (:background ,br-blue :foreground ,fg))))
	 `(tab-bar-tab-inactive-selected ((,class (:background ,br-black :foreground ,fg))))
	 
	)
)

(provide 'best)
