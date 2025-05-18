;; Auto-generated code
(setq custom-file "~/.config/emacs/emacs-custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; Temp files
(setq backup-directory-alist '(("." . "~/.cache/emacs/tmp-files/")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/tmp-files/" t)))
(setq lock-file-name-transforms `((".*" "~/.cache/emacs/tmp-files/" t)))

;; Default compile command
(setq compile-command "cd .. && ./build.sh")

;; Default shit
(fringe-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(provide 'remove-bullshit)
