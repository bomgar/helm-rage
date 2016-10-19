;;; helm-rage.el --- Helm command for rage characters.

;; Copyright © 2016 Patrick Haun

;; Version: 0.0.1
;; Package-Requires: ((helm "1.9.8") (emacs "24.4") (dash "2.13.0")(s "1.11.0"))
;; Keywords: helm, rage, meme
;; URL: https://github.com/bomgar/helm-rage

;;; Commentary:
;; A helm command for raging.

;;; Code:

(require 'helm)
(require 'helm-utils)
(require 'dash)
(require 's)

(defvar helm-rage-meme-dir nil)
(setq helm-rage-meme-dir
      (when load-file-name
        (expand-file-name "meme" (file-name-directory load-file-name))))

(defun helm-rage-get-memes ()
  "Get all available memes."
  (-filter (lambda (file-name) (s-ends-with? ".meme" file-name)) (directory-files helm-rage-meme-dir)))

(defun helm-rage-meme-alist ()
  "Gets the list of all memes with their name."
  (-map (lambda (meme-file) (cons (replace-regexp-in-string "\\.meme" "" (replace-regexp-in-string "_" " " meme-file)) meme-file)) (helm-rage-get-memes)))

(defun helm-rage-source ()
  "Builds the helm rage source."

  (helm-build-sync-source "memes"
    :candidates (helm-rage-meme-alist)
    :action '(("Insert meme" . helm-rage-insert-meme))))

(defun helm-rage-insert-meme (candidate)
  "Insert the CANDIDATE in the current buffer."
  (insert-file-contents (expand-file-name candidate helm-rage-meme-dir)))

;;;###autoload
(defun helm-rage ()
  "Precofigured `helm' for looking up memes by name."
  (interactive)
  (helm :sources (helm-rage-source)
        :buffer "*helm-rage-search*"))

(provide 'helm-rage)

;;; helm-rage.el ends here
