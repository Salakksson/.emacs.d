(deftheme best "Best emacs theme ever")

(let
	(
	 ;; Primary
	 (fg   "#c0caf5")
	 (bg   "#1a1b26")
	 (bg+1 "#2a2b37")
	 (bg+2 "#353644")

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
	 `(default ((t ,(list :foreground fg :background bg))))
	 `(cursor ((t ,(list :background fg))))
	 `(region ((t ,(list :background br-black))))
	 `(highlight ((t ,(list :background br-black))))
	 `(minibuffer-prompt ((t ,(list :foreground blue :bold t))))
	 `(vertical-border ((t ,(list :foreground black))))

	 ;; Font-lock
	 `(font-lock-builtin-face ((t ,(list :foreground magenta))))
	 `(font-lock-comment-face ((t ,(list :foreground br-black))))
	 `(font-lock-constant-face ((t ,(list :foreground cyan))))
	 `(font-lock-function-name-face ((t ,(list :foreground blue))))
	 `(font-lock-keyword-face ((t ,(list :foreground red))))
	 `(font-lock-string-face ((t ,(list :foreground green))))
	 `(font-lock-type-face ((t ,(list :foreground yellow))))
	 `(font-lock-variable-name-face ((t ,(list :foreground white))))
	 `(font-lock-warning-face ((t ,(list :foreground color-17 :bold t))))

	 `(mode-line ((t ,(list :background "#2a2b37"
				:foreground "#eeeeee"))))
	 `(mode-line-inactive ((t ,(list :background "#1f202e"
					 :foreground "#eeeeee"))))
	 ;; Tab Bar Mode
	 `(tab-bar ((t ,(list :background bg :foreground fg))))
	 `(tab-bar-tab ((t ,(list :background "#2a2b37" :foreground fg :bold t))))
	 `(tab-bar-tab-inactive ((t ,(list :background "#1f202e" :foreground br-white))))
	 `(tab-bar-tab-selected ((t ,(list :background br-blue :foreground fg))))
	 `(tab-bar-tab-inactive-selected ((t ,(list :background br-black :foreground fg))))

	 `(whitespace-space ((t ,(list :background bg
				       :foreground bg+1))))
	 `(whitespace-tab ((t ,(list :background bg
				     :foreground bg+2))))
	 `(whitespace-hspace ((t ,(list :background bg
					:foreground bg+2))))
	 ;; `(whitespace-line ((t ,(list :background bg+2
				      ;; :foreground red))))
	 `(whitespace-trailing ((t ,(list :background red
					  :foreground bg))))
	 `(whitespace-empty ((t ,(list :background yellow
				       :foreground red))))
	 `(whitespace-indentation ((t ,(list :background yellow
					     :foreground red))))
	 `(whitespace-space-after-tab ((t ,(list :background yellow
						 :foreground red))))
	 `(whitespace-space-before-tab ((t ,(list :background red
						  :foreground bg))))


	 )
)

(provide 'best)
