
(defun generate-readme-to-hugo()
  "Generate README to hugo."
  (let ((exists-fn (expand-file-name "README.org" "~"))
        (dest-fn (expand-file-name "notes/content-org/dump-brain-with-emacs.org" "~"))
        (source-images (expand-file-name "images" "~"))
        (dest-images (expand-file-name "notes/content-org/images" "~")))
    (copy-file exists-fn dest-fn)
    (copy-directory source-images dest-images t t)
    (with-temp-buffer
      (find-file dest-fn)
      (org-mode)
      (org-hugo-export-to-md)))
  (message "done!"))
