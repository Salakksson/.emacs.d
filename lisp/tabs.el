
(tab-bar-mode 1)
(defun my/switch-tab (index)
	(interactive "nTab number: ")
	(let* ((tabs (tab-bar-tabs))
		   (target-idx (1- index))
		   (tab-count (length tabs)))
		(cond
		 ;; if tab exists at index, switch to it
		 ((< target-idx tab-count)
		  (let ((tab (nth target-idx tabs)))
			  (tab-bar-switch-to-tab (alist-get 'name tab))))
		 ;; else, create new tabs until we reach that index
		 (t
		  (while (< (length (tab-bar-tabs)) index)
			  (tab-bar-new-tab))
		  (tab-bar-switch-to-tab (alist-get 'name (nth target-idx (tab-bar-tabs))))))))


(global-set-key (kbd "M-1") (lambda () (interactive) (my/switch-tab 1)))
(global-set-key (kbd "M-2") (lambda () (interactive) (my/switch-tab 2)))
(global-set-key (kbd "M-3") (lambda () (interactive) (my/switch-tab 3)))
(global-set-key (kbd "M-4") (lambda () (interactive) (my/switch-tab 4)))
(global-set-key (kbd "M-5") (lambda () (interactive) (my/switch-tab 5)))
(global-set-key (kbd "M-6") (lambda () (interactive) (my/switch-tab 6)))
(global-set-key (kbd "M-7") (lambda () (interactive) (my/switch-tab 7)))
(global-set-key (kbd "M-8") (lambda () (interactive) (my/switch-tab 8)))
(global-set-key (kbd "M-9") (lambda () (interactive) (my/switch-tab 9)))

;; Delete tabs with M-\
(defun my/delete-tab ()
	(interactive)
	(when (y-or-n-p "Delete current tab? ")
		(tab-bar-close-tab)))

(global-set-key (kbd "M-\\") #'my/delete-tab)

(provide 'tabs)

