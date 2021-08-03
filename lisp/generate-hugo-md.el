
(defun generate-readme-to-hugo()
  "Generate README to hugo."
  (with-temp-buffer
    (find-file (expand-file-name "README.org" "~"))
    (org-hugo-export-as-md))
  (message "done!"))
