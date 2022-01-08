(defgroup my nil
  "Configurations of myself."
  :group 'convenience)

(defcustom my-url-http-proxy-service
  "127.0.0.1:1087"
  "HTTP proxy that apply to 'url-retrieve'."
  :type '(string))

(defun my/url-current-public-ip()
  "Return current public IPv4 address with url."
  (let ((r (url-retrieve-synchronously "https://api-ipv4.ip.sb/ip" t nil 10)))
    (with-current-buffer r
      (goto-char (point-min))
      (re-search-forward "^$")
      (delete-region (point) (point-min))
      (string-trim (buffer-string)))))

(defun my/url-proxy-on()
  "Enable HTTP proxy for url."
  (interactive)
  (setq url-proxy-services
        `(("http" . ,my-url-http-proxy-service)
          ("https" . ,my-url-http-proxy-service)))
  (message "Proxy services set and public IP is: %s" (my/url-current-public-ip)))

(defun my/url-proxy-off()
  "Disable HTTP proxy for url."
  (interactive)
  (setq url-proxy-services nil)
  (message "Porxy services removed and public IP is: %s." (my/url-current-public-ip)))

(defun my/url-proxy-toggle()
  "Toggle HTTP proxy for url."
  (interactive)
  (if (eq url-proxy-services nil)
      (my/url-proxy-on)
    (my/url-proxy-off)))
