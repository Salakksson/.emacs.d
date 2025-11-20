(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-safe-themes t)
(require 'theme)
(require 'remove-bullshit)
(require 'package-manager)
(require 'qol)
(require 'tabs)
(require 'term)
(require 'modes)
(require 'pamde-mode)

(defun my/vterm ()
  (interactive)
  (vterm)
  (rename-buffer (generate-new-buffer-name "*vterm*"))
)

(defun my/confirm-exit ()
  (interactive)
  (when (y-or-n-p "Really quit Emacs? ")
    (save-buffers-kill-terminal)
  )
)

(defvar my/rpc-proc nil)

(defun my/start-rpc ()
  (setq my/rpc-proc
        (start-process
         "presence"
         "*presence*"
         "python"
         (concat (getenv "HOME") "/dots/scripts/emacs-rpc.py")
        )
  )
  (set-process-query-on-exit-flag my/rpc-proc nil)
)

(defun my/send-rpc-update ()
  (when (and my/rpc-proc (process-live-p my/rpc-proc))
    (let ((filename (or (buffer-file-name) (buffer-name)))
          (lineno (line-number-at-pos)))
      (process-send-string
       my/rpc-proc
       (format "%s:%s\n" filename lineno)
      )
    )
  )
)

(defun my/restart-rpc ()
  "restart rpc client"
  (interactive)
  (kill-process my/rpc-proc nil)
  (my/start-rpc)
)

(my/start-rpc)
(run-at-time 0 1 'my/send-rpc-update)

(global-set-key (kbd "C-c t") 'my/vterm)
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)
(global-set-key (kbd "C-c d") 'dired-jump)
(global-set-key (kbd "C-c e") 'eval-buffer)
(global-set-key (kbd "C-c w") 'whitespace-cleanup)
(global-set-key (kbd "C-x C-c") 'my/confirm-exit)

(add-hook 'before-save-hook 'whitespace-cleanup)

(defun conf-dir ()
  "open .config in dired"
  (interactive)
  (dired "~/dots/.config/")
)

(defun proj-dir ()  "open projects in dired"
  (interactive)
  (dired "/h/code/")
)

(defun git-dir ()  "open git dir in dired"
  (interactive)
  (dired "/h/git/")
)

(defun scripts-dir ()  "open scripts dir in dired"
  (interactive)
  (dired "~/dots/scripts/")
)

(defun git-dir ()
  "open git dir in dired"
  (interactive)
  (dired "/h/git/")
)

(defun home-dir ()
  "open /h in dired"
  (interactive)
  (dired "/h/")
)

(defun init-el ()
  "open init.el"
  (interactive)
  (find-file "~/.config/emacs/init.el")
)

(defun todo ()
  "open todo"
  (interactive)
  (find-file "/h/todo.org")
)

(defun pamde ()
  "open pamde file"
  (interactive)
  (find-file "/usr/local/share/pamde/main.conf")
)

(defun reload-conf ()
  "reload config"
  (interactive)
  (load "~/.config/emacs/init.el")
)

(defun bigrat ()
  "bigrat"
  (interactive)
  (find-file "/h/bigrat.jpg")
)

(defun sudo-this-file ()
  "sudo"
  (interactive)
  (let ((filename (buffer-file-name)))
    (if filename
        (let ((new-filename (concat "/sudo::" filename)))
          (set-visited-file-name new-filename t)
          (revert-buffer t t t)
        )
      (message "This buffer is not visiting a file")
    )
  )
)
