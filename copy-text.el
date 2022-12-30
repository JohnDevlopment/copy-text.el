;;; copy-text.el --- Duplicate text easily

;; Copyright (C) 2022 John Russell
;; Author: John Russell <johndevlopment7@gmail.com>
;; Keywords: edit
;; Package-Version: 1.0-alpha
;; Version: 1.0-alpha
;; Package-Commit: a97f8778cec746359170cb64e0835b57e0232ea4
;;
;;; This file is NOT part of GNU Emacs

;;; Commentary:
;;
;; CopyText contains functions to duplicate lines like you see
;; in other editors.

;;; Code:

;; (require 'cl-lib)

;;;###autoload
(defun copy-text-down (n)
  "Duplicate the current line downward. With a prefix argument,
specify the number of copies to make; otherwise one copy is made."
  (interactive (list (prefix-numeric-value current-prefix-arg)))
  (cl-loop repeat n do (copy-text-line-down)))

;;;###autoload
(defun copy-text-line-down (&rest ARGS)
  "Duplicate the current line downward."
  (interactive)
  (let (beg text (orig (point-marker)))
    (beginning-of-line)
    (setq beg (point))
    (end-of-line)
    (setq text (buffer-substring beg (point)))
    (newline)
    (insert text)
    (goto-char orig)))

;; copy this line

(provide 'copy-text)

;;; copy-text.el ends here
