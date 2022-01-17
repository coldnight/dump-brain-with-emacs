;; 系统共享剪切板
;; see also:
;;   https://www.emacswiki.org/emacs/CopyAndPaste
;;   https://www.reddit.com/r/emacs/comments/5n9t3f/copypaste_from_system_clipboard_on_windows/
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(cond
 ((memq window-system '(x))
  (setq x-select-enable-primary t
        x-select-enable-clipboard nil))
 ((memq window-system '(mac ns))
  (setq interprogram-cut-function 'paste-to-osx
        interprogram-paste-function 'copy-from-osx
        ;; Use Option as Meta
        mac-option-modifier 'meta))
 ((memq window-system '(win32 pc))
  (setq select-enable-primary t
        select-enable-clipboard t
        save-interprogram-paste-before-kill t)))

;; 指定自定义配置文件，防止自定义配置污染 init.el，并加载该配置文件
(setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
(if (file-exists-p custom-file)
    (load custom-file))

;; Font
;; Download Victor Mono at https://rubjo.github.io/victor-mono/
(set-face-attribute 'default nil
                    :family "Victor Mono" :height 145 :weight 'normal)

;; 中文显示
(set-language-environment "utf-8")
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default pathname-coding-system 'utf-8)
(setq
 default-process-coding-system '(utf-8 . utf-8)
 locale-coding-system 'utf-8
 file-name-coding-system 'utf-8
 default-buffer-file-coding-system 'utf-8
 slime-net-coding-system 'utf-8-unix)

(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")                           ; Iterate through CamelCase words

;; 基本设置
(setq-default
 indicate-buffer-boundaries 'left ;; 在窗口边缘上显示一个小箭头指示当前 buffer 的边界
 delete-by-moving-to-trash t                      ;; 删除文件移动到垃圾箱
 window-combination-resize t                      ;; 新窗口平均其他左右窗口
 x-stretch-cursor t                               ;; 将光标拉伸到字形宽度
 kill-whole-line t)  ;; C-k时,同时删除该行

;;; Tidy workdir
(make-directory "~/.emacs.d/data/backup/" t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/data/backup/" t)) ; Write auto-save files to a separate directory
      backup-directory-alist '(("." . "~/.emacs.d/data/backup/"))          ; Write backup files to a separate directory
      create-lockfiles nil                                                 ; Disable lockfiles as I use only one Emacs instance
      )

(setq
 fringes-outside-margins t   ;; fringe 放在外面
 echo-keystrokes 0.1         ;; 尽快显示按键序列
 system-time-locale "zh_CN"  ;; 设置系统时间显示格式
 tab-always-indent 'complete ;; Tab 键优先格式化再补全
 font-lock-global-modes '(not shell-mode text-mode) ;; 设置语法高亮.除shell-mode和text-mode之外的模式
 mouse-yank-at-point t       ;; 不在鼠标点击的地方插入剪贴板内容
 kill-ring-max 200           ;; 设置 kill ring 个数
 default-fill-column 60      ;; 把fill-column设为60.让文字更好读
 enable-recursive-minibuffers t  ;; 递归的使用minibuffer
 scroll-margin 3             ;; 在靠近屏幕边沿 3 行时就开始滚动,可很好看到上下文
 scroll-conservatively 10000 ;; 防止页面滚动时跳动
 select-enable-clipboard t   ;; 允许emacs和外部程序进行粘贴
 track-eol t                 ;; 当光标在行尾上下移动的时候,始终保持在行尾
 next-line-add-newlines nil  ;; 按C-n或down时不添加新行
 ;; emacs启动时显示的内容可以通过变量initial-scratch-message来设置
 initial-scratch-message nil
 dired-listing-switches "-vha" ;;  dired 列出文件的参数（man ls）
 show-paren-style 'parenthesis ;; 括号匹配时高亮显示另一边的括号，而不是跳到另一个括号处
 undo-limit 80000000           ;; 提升撤销限制
 auto-save-default t           ;; 打开自动保存
 truncate-string-ellipsis "…"  ;; Unicode ellispis are nicer than "...", and also save /precious/ space
 ;; 当寻找一个同名的文件,改变两个buffer的名字,前面加上目录名
 uniquify-buffer-name-style 'post-forward-angle-brackets)
(if (display-graphic-p)
    (progn
      (menu-bar-mode -1)            ;; 取消菜单栏
      (scroll-bar-mode -1)          ;; 取消滚动条（在 Emacs 26 中无效）
      (tool-bar-mode -1)))          ;; 取消工具栏
(fset 'yes-or-no-p 'y-or-n-p) ;; 按y或space表示yes,n表示no
(global-font-lock-mode t)     ;; 语法高亮
(show-paren-mode t)           ;; 打开括号匹配显示模式
(mouse-avoidance-mode 'animate) ;; 鼠标靠近光标指针时,让鼠标自动让开
(auto-compression-mode 1) ;; 打开压缩文件时自动解压缩
(global-auto-revert-mode 1)       ;; 自动重载更改的文件
(blink-cursor-mode -1)            ;; 指针不要闪
(toggle-truncate-lines t)         ;; 当一行文字太长时,不自动换行
(column-number-mode t)            ;; 在minibuffer上面的状态栏显示文件的行号,列号
(line-number-mode t)              ;;设定显示文件的参数,以版本/人性化的显示,就是ls的参数
(global-linum-mode t)             ;; 显示行号
(require 'saveplace)
(save-place-mode 1)               ;; 记住上次打开文件光标的位置
(global-subword-mode 1)           ;; 拆分连字符：oneWord 会被当作两个单词处理

;; 设置4个空格缩进
(setq-default indent-tabs-mode nil)
(setq tab-width 4) ; or any other preferred value

;; 时间显示设置
(display-time-mode 1)   ;; 启用时间显示设置,在minibuffer上面的那个杠上
(setq display-time-24hr-format t   ;; 时间使用24小时制
      display-time-day-and-date t   ;; 时间显示包括日期和具体时间
      display-time-use-mail-icon t   ;; 时间栏旁边启用邮件设置
      display-time-interval 10   ;; 时间的变化频率
      display-time-format "%A %H:%M")   ;; 显示时间的格式

(unless (string-match-p "^Power N/A" (battery))   ; 笔记本上显示电量
  (display-battery-mode 1))

;; use-package
(eval-when-compile
  (add-to-list 'load-path "~/.emacs.d/use-package")
  (require 'use-package))

;; 移除下方一行的注释应用代理，相关代码请参见 my.el
;; (my/url-proxy-on)

;; straight.el to manage package
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package doom-themes
  :ensure t
  :straight (doom-themes :host github :repo "hlissner/emacs-doom-themes"
                         :files ("*.el" "themes"))
  :init
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
  ;; may have their own settings.
  ;; (load-theme 'doom-nord t)
  (load-theme 'doom-vibrant t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package doom-modeline
  :straight t
  :after nyan-mode
  :custom
  (doom-modeline-mu4e nil)
  (doom-modeline-gnus nil)
  (doom-modeline-buffer-file-name-style 'truncate-all)
  :init
  (doom-modeline-mode 1))

(use-package nyan-mode
  :straight t
  :init
  (nyan-mode 1))

(use-package emojify
  :straight (emojify :host github :repo "iqbalansari/emacs-emojify"
                     :files ("*.el" "data"))
  :hook
  (after-init . global-emojify-mode)
  :init
  (setq emojify-emoji-styles '(unicode github)))

(use-package dashboard
  :straight (dashboard :host github :repo "emacs-dashboard/emacs-dashboard"
                       :files ("*.el" "banners"))
  :custom
  (dashboard-center-content 1)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-items '((projects . 5)
                     (recents . 5)
                     (agenda . 5)
                     (registers . 5)))
  :init
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(use-package all-the-icons :straight t)

(use-package centaur-tabs
  :straight t
  :demand
  :config
  (centaur-tabs-mode t)
  :custom
  (centaur-tabs-set-icons t)
  (centaur-tabs-style "wave")
  :bind
  ("C-c t p" . centaur-tabs-backward)
  ("C-c t n" . centaur-tabs-forward))

(use-package counsel
  :straight t
  :custom
  (counsel-find-file-at-point t)
  :init
  (counsel-mode +1)
  :bind
  ("C-x b" . counsel-switch-buffer)
  ("C-c a p" . counsel-ag)
  ("M-y" . counsel-yank-pop)
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> o" . counsel-describe-symbol)
  ("<f1> l" . counsel-find-library)
  ("<f2> i" . counsel-info-lookup-symbol)
  ("<f2> u" . counsel-unicode-char)
  ("C-c g" . counsel-git)
  ;; ("C-c j" . counsel-git-grep)
  ("C-c k" . counsel-ag)
  ("C-x l" . counsel-locate)
  ("C-S-o" . counsel-rhythmbox)
  (:map minibuffer-local-map
        (("C-r" . counsel-minibuffer-history))))

(use-package ivy
  :straight t
  :init
  (ivy-mode 1)
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  (ivy-wrap t)
  :bind
  ("\C-s" . swiper)
  ("\C-r" . swiper-backward)
  ("C-c C-r" . ivy-resume)
  ("<f6>" . ivy-resume))

(use-package ivy-posframe
  :straight t
  :custom
  (ivy-posframe-display-functions-alist
   '((swiper          . ivy-posframe-display-at-point)  ;; swiper 紧随光标弹出
     (complete-symbol . ivy-posframe-display-at-point)  ;; 符号补全紧随光标弹出
     (t . ivy-posframe-display)))                       ;; 其他所有都在中心位置弹出
  (ivy-posframe-parameters '((left-fringe . 8)
                             (right-fringe . 8)))       ;; 指示弹出窗口标边缘
  :init
  (ivy-posframe-mode 1))

(use-package ivy-rich
  :straight t
  :after (ivy)
  :init
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-rich-mode +1)
  (ivy-rich-project-root-cache-mode +1))

(use-package all-the-icons-ivy-rich
  :straight t
  :after (ivy-rich)
  :init (all-the-icons-ivy-rich-mode 1))

(use-package goto-line-preview :straight t
  :bind (("M-g g" . goto-line-preview)))

(use-package which-key
  :straight t
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  :custom
  (which-key-show-early-on-C-h t)
  :init
  (which-key-mode))

(setq my/dump-brain-root "~/notes/")

(use-package org
  :straight (:type git :host github :repo "bzg/org-mode")
  :bind
  ("C-c c" . org-capture)
  ("C-c a o" . org-agenda)
  ("C-c C-." . org-mark-ring-goto)
  :custom
  (org-startup-indented t)
  (org-hide-leading-stars t)
  (org-odd-level-only nil)
  (org-insert-heading-respect-content nil)
  (org-M-RET-may-split-line '((item) (default . t)))
  (org-special-ctrl-a/e t)
  (org-return-follows-link nil)
  (org-use-speed-commands t)
  (org-startup-align-all-tables nil)
  (org-log-into-drawer nil)
  (org-tags-column 1)
  (org-ellipsis " \u25bc" )
  (org-speed-commands-user nil)
  (org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))
  (org-completion-use-ido t)
  (org-indent-mode t)
  (org-startup-truncated nil)
  :custom-face
  (org-headline-done ((nil (:strike-through t))))
  :init
  (require 'org-id)
  (defun my/org-id-update-id-locations-current-dir()
    "Update id locations from current dir."
    (interactive)
    (org-id-update-id-locations (directory-files "." t "\.org\$" t)))
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t))))

(use-package org-journal
  :after org
  :straight t
  :bind
  ("C-c j s" . org-journal-search)
  ("C-c j f" . org-journal-open-next-entry)
  ("C-c j b" . org-journal-open-previous-entry)
  ("C-c j j" . org-journal-new-entry)
  :custom
  (org-journal-file-type 'weekly)
  (org-journal-dir (string-join (cons my/dump-brain-root '("journal")) "/"))
  :init
  (defun org-journal-file-header-func (time)
    "Custom function to create journal header."
    (concat
     (pcase org-journal-file-type
       (`daily "#+TITLE: Daily Journal\n#+STARTUP: showeverything\n#+HUGO_BASE_DIR: ../\n#+HUGO_SECTION: journal\n#+DATE: %U")
       (`weekly "#+TITLE: Weekly Journal\n#+STARTUP: folded\n#+HUGO_BASE_DIR: ../\n#+HUGO_SECTION: journal\n#+DATE: %U")
       (`monthly "#+TITLE: Monthly Journal\n#+STARTUP: folded\n#+HUGO_BASE_DIR: ../\n#+HUGO_SECTION: journal\n#+DATE: %U")
       (`yearly "#+TITLE: Yearly Journal\n#+STARTUP: folded\n#+HUGO_BASE_DIR: ../\n#+HUGO_SECTION: journal\n#+DATE: %U"))))
  (setq org-journal-file-header 'org-journal-file-header-func)
  (setq org-journal-enable-agenda-integration t))

(use-package org-roam
  :after org
  :straight t
  :config
  (org-roam-setup)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol)
  :bind
  ("C-c n l" . org-roam-buffer-toggle)
  ("C-c n f" . org-roam-node-find)
  ("C-c n g" . org-roam-graph)
  ("C-c n i" . org-roam-node-insert)
  ("C-c n c" . org-roam-capture)
  ;; Dailies
  ("C-c n j" . org-roam-dailies-capture-today)
  :custom
  (org-roam-v2-ack t)
  (org-roam-directory (string-join (cons my/dump-brain-root '("content-org")) "/"))
  (org-roam-capture-templates `(("d" "default" plain "%?"
                                 :unnarrowed t
                                 :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org"
                                                    "#+TITLE: ${title}
#+AUTHOR: Gray King
#+DATE: %U
#+HUGO_BASE_DIR: ../
#+HUGO_SECTION: notes
")))))

(use-package org-superstar
  :straight t
  :hook
  (org-mode . (lambda () (org-superstar-mode 1))))

(use-package ox-hugo
  :straight t
  :after (ox org-mode))



(use-package projectile
  :straight t
  :custom
  (projectile-enable-caching t)
  :init
  (projectile-mode +1)

  (setq projectile-globally-ignored-directories
        (append '(".git"
                  ".svn"
                  ".tox"
                  ".venv"
                  ".gradle"
                  ".meghanada"
                  ".clangd"
                  "eln-cache"
                  "out"
                  "repl"
                  "target"
                  "venv")
                projectile-globally-ignored-directories))

  (setq projectile-globally-ignored-files
        (append '(".DS_Store"
                  "*.gz"
                  "*.pyc"
                  "*.jar"
                  "*.tar.gz"
                  "*.tgz"
                  "*.zip"
                  "*.eln"
                  "*.elc"
                  )
                projectile-globally-ignored-files))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-register-project-type 'hugo '("config.toml" "archetypes" "content")
                                  :project-file "config.toml"
				  :compile "hugo"
				  :test "open http://localhost:1313/"
				  :run "hugo server -D --disableFastRender --navigateToChanged"))

(use-package magit
  :straight (magit :host github :repo "magit/magit")
  :bind
  ("C-c m s" . magit-status)
  ("C-c m p" . magit-push-current)
  ("C-c m c" . magit-branch-checkout)
  ("C-c m b" . magit-branch-and-checkout)
  ("C-c m f" . magit-fetch)
  ("C-c m m" . magit-merge)
  ("C-c m r" . magit-rebase))
