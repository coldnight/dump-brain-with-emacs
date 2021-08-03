
(defun generate-readme-to-hugo()
  "Generate README to hugo."
  (with-temp-buffer
    (find-file (expand-file-name "README.org" "~"))
    )
  (message "it works!"))
