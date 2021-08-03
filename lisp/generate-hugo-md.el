
(defun generate-readme-to-hugo()
  "Generate README to hugo."
  (let ((exists-fn (expand-file-name "README.org" "~"))
        (dest-fn (expand-file-name "notes/content-org/dump-brain-with-emacs.org" "~")))
    (copy-file exists-fn dest-fn)
    (with-temp-buffer
      (find-file dest-fn)
      (org-mode)
      (org-hugo-export-as-md)))
  (message "done!"))
