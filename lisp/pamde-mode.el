(defvar pamde-mode-syntax-table
  (let ((st (make-syntax-table)))
    ;; # and // comments
    (modify-syntax-entry ?# "<" st)
    (modify-syntax-entry ?/ ". 124" st)
    (modify-syntax-entry ?\n ">" st)
    ;; strings
    (modify-syntax-entry ?\" "\"" st)
    ;; treat {} and [] as parens for depth
    (modify-syntax-entry ?{ "(}" st)
    (modify-syntax-entry ?} "){" st)
    (modify-syntax-entry ?[ "(]" st)
    (modify-syntax-entry ?] ")[" st)
    st))

(defvar pamde-font-lock-keywords
  `(
    (,(regexp-opt '("def" "if") 'symbols) . font-lock-keyword-face)
    (,(regexp-opt '("true" "false") 'symbols) . font-lock-constant-face)
    ("\\b[0-9]+\\b" . font-lock-constant-face)
    ("\"\\([^\"\\]\\|\\\\.\\)*\"" . font-lock-string-face)
    ("^[ \t]*\\([A-Za-z_][A-Za-z0-9_-]*\\)" 1 font-lock-function-name-face)
    ("{[ \t\n]*\\([A-Za-z_][A-Za-z0-9_-]*\\)" 1 font-lock-function-name-face)
   ))

(defun pamde--line-ends-with-semicolon-p ()
  "Check if current line ends with ; before comments/whitespace."
  (save-excursion
    (end-of-line)
    (let ((eol (point)))
      (beginning-of-line)
      (let* ((line (buffer-substring-no-properties (point) eol))
             (stripped (replace-regexp-in-string
                        "\\(//\\|#\\).*\\'" "" line)))
        (string-match-p ";[ \t]*\\'" stripped)))))

(defun pamde--missing-semicolon-matcher (limit)
  "Font-lock matcher for missing semicolons after def/if and closing }."
  (let (found)
    (while (and (not found)
                (re-search-forward "^[ \t]*\\(def\\|if\\)\\b\\|^[ \t]*}" limit t))
      (let* ((bol (line-beginning-position))
             (eol (line-end-position)))
        (save-excursion
          (goto-char (match-beginning 0))
          (cond
           ;; closing } without trailing ;
           ((looking-at "^[ \t]*}")
            (setq found (not (pamde--line-ends-with-semicolon-p)))
            (when found
              (let ((s (match-beginning 0))
                    (e (match-end 0)))
                (set-match-data (list s e)))))
           ;; def/if lines lacking ;
           (t
            (let* ((line (buffer-substring-no-properties bol eol))
                   (has-open (string-match-p "{" line))
                   (has-close-semicolon (pamde--line-ends-with-semicolon-p)))
              (setq found (and (not has-open) (not has-close-semicolon)))
              (when found
                (let* ((start (match-beginning 1))
                       (end   (match-end 1)))
                  (set-match-data (list start end))))))))))
    found))

(defun pamde--calculate-indent ()
  "Compute desired indentation based on paren depth."
  (save-excursion
    (back-to-indentation)
    (let* ((state (syntax-ppss))
           (depth (car state))
           (closing (looking-at-p "[]}]")))
      (* (or tab-width 8)
         (max 0 (if closing (1- depth) depth))))))

(defun pamde-indent-line ()
  "Indent current line to structural depth."
  (interactive)
  (let* ((col (pamde--calculate-indent))
         (pos (point))
         (bol (line-beginning-position)))
    (indent-line-to col)
    (when (< (current-column) col)
      (move-to-column col t))))

;;;###autoload
(define-derived-mode pamde-mode prog-mode "Pamde"
  "Major mode for the Pamde language."
  :syntax-table pamde-mode-syntax-table
  (setq font-lock-defaults '(pamde-font-lock-keywords))
  (setq-local indent-line-function #'pamde-indent-line)
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 8)
  (setq-local comment-start "# ")
  (setq-local comment-start-skip "\\(//+\\|#\\)+[ \t]*")
  (font-lock-add-keywords
   nil
   '((pamde--missing-semicolon-matcher 0 font-lock-warning-face prepend))
   'append))

;;;###autoload

(add-to-list 'auto-mode-alist '("\\.pmd\\'" . pamde-mode))

(provide 'pamde-mode)
