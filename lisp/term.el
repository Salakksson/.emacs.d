(require 'package)

;; ALL PASTED FROM GPT. DONT TRUST THIS SHTI
(with-eval-after-load 'vterm
  (add-hook 'vterm-mode-hook
            (lambda ()
              (dolist (k '("M-1" "M-2" "M-3" "M-4" "M-5" "M-6" "M-7" "M-8" "M-9" "M-\\"))
                (define-key vterm-mode-map (kbd k) nil)
              )
            )
  )
)

(provide 'term)
