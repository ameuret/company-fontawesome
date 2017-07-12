

(require 'cl-lib)
(require 'all-the-icons)

;; (defvar company-custom-keywords
;;   '(("foobar" "") ("foobaz" "")  ("foobarbaz" "")))

(defun company-fontawesome--make-candidate (candidate)
  (let ((text (concat "fa-" (car candidate)))
        (meta (cdr candidate))) ;was cadr
    (propertize text 'meta meta)))

(defun company-fontawesome--candidates (prefix)
  (let (res)
    (dolist (item (all-the-icons-faicon-data))
      (when (string-prefix-p prefix (concat "fa-" (car item)))
        (push (company-fontawesome--make-candidate item) res)))
    res))

(defun company-fontawesome--meta (candidate)
  (format "%s -> %s"
          (substring-no-properties candidate)
          (get-text-property 0 'meta candidate)
          ))

(defun company-fontawesome--annotation (candidate)
  (format "%s" (get-text-property 0 'meta candidate)))

(defun company-fontawesome (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  (cl-case command
    (interactive (company-begin-backend 'company-fontawesome))
    (prefix (company-grab-symbol-cons "\\.\\|->" 2))
    (candidates (company-fontawesome--candidates arg))
    (annotation (company-fontawesome--annotation arg))
    (meta (company-fontawesome--meta arg))))

(defun company-fontawesome-init ()
  "Add fontawesome to the company backends."
  (interactive)
  (add-to-list 'company-backends 'company-fontawesome))

(provide 'company-fontawesome)

;; (all-the-icons-insert-icons-for 'faicon 1)

;; (message "%s" (cdr(car (nth 42 (all-the-icons-faicon-data)))))
;; (cdr(nth 42 (all-the-icons-faicon-data)))
;; (type-of (cdr(nth 0 company-custom-keywords)))
;; (type-of (cdr(nth 42 (all-the-icons-faicon-data))))

;; (dolist (i (all-the-icons-faicon-data))
;;    (message "%s: %s" (car i) (cdr i)))
