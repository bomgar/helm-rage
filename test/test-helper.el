;;; test-helper.el --- ensime-emacs: ERT Test helper

;; Copyright (C) 2016 helm-rage authors

(require 'f)
(require 'dash)

;;;;;;;;;;;;;;;;;;;;
;; variables
;;;;;;;;;;;;;;;;;;;;

(defvar helm-rage-emacs-test/test-path
  (f-dirname (f-this-file))
  "Path to tests directory.")

(defvar helm-rage-emacs-test/root-path
  (f-parent helm-rage-emacs-test/test-path)
  "Path to root directory.")

(add-to-list 'load-path helm-rage-emacs-test/root-path)
(add-to-list 'load-path helm-rage-emacs-test/test-path)

(require 'el-mock)
(eval-when-compile
    (require 'cl))

(require 'helm-rage)
