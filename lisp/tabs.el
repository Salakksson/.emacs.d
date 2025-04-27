(require 'package-manager)

(tab-bar-mode 1)

(defun my/switch-tab (index)
  "switch tab"
  (interactive "nTab index: ")
  (require 'tab-bar)
  (let ((target (- index 1)))
    (while (> (1+ target) (length (tab-bar-tabs)))
      (tab-bar-new-tab)
      (switch-to-buffer "*scratch*")
    )
    (tab-bar-select-tab (1+ target))
  )
)

(dotimes (i 9)
  (let ((n (1+ i)))
    (global-set-key
     (kbd (format "M-%d" n))
     `(lambda () (interactive) (my/switch-tab ,n))
    )
  )
)

(defun my/delete-tab ()
  (interactive)
  (tab-bar-close-tab)
)

(global-set-key (kbd "M-\\") #'my/delete-tab)



(provide 'tabs)

