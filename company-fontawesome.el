;;; company-fontawesome.el --- company-mode backend for fontawesome

;; Copyright (C) 2017 Arnaud Meuret

;; Author: Arnaud Meuret <arnaud@meuret.net>
;; Homepage: https://github.com/ameuret/company-fontawesome.git
;; Created: 12 Jul 2017
;; Version: 0.1.0
;; Package-Requires: ((cl-lib "0.5") (company "0.8.0") all-the-icons)
;; Keywords: fontawesome company convenience tools
;; Prefix: company-fontawesome

;;; Commentary:

;; Please sea https://github.com/ameuret/company-fontawesome.git

;;; Code:

(require 'cl-lib)
(require 'all-the-icons)

(defconst company-fontawesome-version "0.1.0")

(defun company-fontawesome--make-candidate (candidate)
  (let (
        (text (concat "fa-" (car candidate)))
        (meta (cdr candidate))
        )
    (setq text (propertize text 'meta meta)))
  )

(defun company-fontawesome--candidates (prefix)
  (let (res)
    (dolist (item (all-the-icons-faicon-data))
      (when (string-prefix-p prefix (concat "fa-" (car item)))
        (push (company-fontawesome--make-candidate item) res))
          ;;(message "Done: %S" item)
          ;;(message (get-text-property 0 'face (car item)))
          )
    res))

(defun company-fontawesome--meta (candidate)
  (format "%s -> %s"
          (substring-no-properties candidate)
          (get-text-property 0 'meta candidate)
          ))

(defun company-fontawesome--annotation (candidate)
  (setq res (format "%s" (get-text-property 0 'meta candidate)))
  (put-text-property 0 1 'font-lock-face 'font-lock-warning-face res)
  res)

(defun company-fontawesome (command &optional arg &rest ignored)
  (interactive (list 'interactive))
  ;; (message "Company cmd:%s" command)
  (cl-case command
    (interactive (company-begin-backend 'company-fontawesome))
    (prefix (company-grab-symbol-cons "\\.\\|->" 2))
    (candidates (company-fontawesome--candidates arg))
    (annotation (company-fontawesome--annotation arg))
    (meta (company-fontawesome--meta arg))
    ;; (post-completion
    ;;        (progn
    ;;          (kill-region (- (point) (length arg)) (point))
    ;;          (insert (get-text-property 0 'meta arg))))
    ))

(defun company-fontawesome-init ()
  "Add fontawesome to the company backends."
  (interactive)
  (add-to-list 'company-backends 'company-fontawesome))

(provide 'company-fontawesome)

;; (message "%s" (cdr (nth 42 (all-the-icons-faicon-data))))
;; (insert (cdr (nth 7 (all-the-icons-faicon-data))))
;; (type-of (cdr(nth 0 company-custom-keywords)))
;; (type-of (cdr(nth 42 (all-the-icons-faicon-data))))

;; (dolist (i (all-the-icons-faicon-data))
;;    (message "%s: %s" (car i) (cdr i)))

;;; company-fontawesome.el ends here
