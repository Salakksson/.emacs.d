;; auto-generated code
(setq custom-file "~/.config/emacs/emacs-custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;; temp files
(setq backup-directory-alist '(("." . "~/.cache/emacs/tmp-files/")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/tmp-files/" t)))
(setq lock-file-name-transforms `((".*" "~/.cache/emacs/tmp-files/" t)))

;; default compile command
(setq compile-command "cd .. && ./build.sh")

;; default shit
(fringe-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; eglot autoformat
(setq eglot-ignored-server-capabilities
      '(:documentFormattingProvider
        :documentRangeFormattingProvider)
)

(provide 'remove-bullshit)
