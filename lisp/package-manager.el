;; Add melpa to package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; List of packages
(setq my/packages
      '(ligature smex restart-emacs multiple-cursors magit ido-completing-read+
        ))

;; Fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

;; Install the missing packages
(dolist (package my/packages)
  (unless (package-installed-p package)
    (package-install package)))

(defun my/is-package-a-dependency (test-package)
  "Returns if a package is a dependency of another package or not"
  (catch 'is-dep
    (dolist (package my/packages)
      (let ((deps (package--dependencies package)))
        (if (member test-package deps)
            (throw 'is-dep t))))))

;; Uninstall removed packages
(dolist (package package-activated-list)
  (if (and (package-installed-p package) (not (member package my/packages)) (not (my/is-package-a-dependency package)))
      (let ((package-desc (package-get-descriptor package)))
        (package-delete package-desc))))

(provide 'package-manager)
