
# Table of Contents

1.  [前言](#orga98e413)
2.  [安装、启动、退出](#orgdba0751)
    1.  [Linux](#org22a6da5)
    2.  [macOS](#org3de71d0)
    3.  [Windows](#org141509d)
    4.  [退出 Emacs](#orga636d47)
3.  [黑话](#org321e09c)
    1.  [快捷键](#orga7f4ec7)
    2.  [概念](#orgf986b9e)
    3.  [buffer](#org78df63a)
4.  [基本增强](#org8e07f04)
    1.  [创建配置文件](#orga0f0f92)
    2.  [共享系统剪切板](#orgf4b5cfd)
    3.  [基本配置](#orga552610)
    4.  [插件包管理](#orgbcfce15)
    5.  [外观](#org3c3e907)
    6.  [操作](#orged8fae6)
5.  [改变操作习惯](#org45bd721)
    1.  [移动](#orgb398bf5)
    2.  [选择和复制粘贴](#org68043e8)
6.  [准备记录笔记](#org0ac3420)
7.  [开始记录笔记](#org6758127)
8.  [进阶](#orgda047fa)
    1.  [导出 Hugo 站点](#org71dc7fe)
    2.  [发布 GitHub Pages](#org5d10bf9)
9.  [超阶](#org825dcf0)
    1.  [项目管理：projectile](#org86716ed)
    2.  [使用 Emacs 作为 Git 客户端：magit](#org402384d)
    3.  [收集笔记：org-protocol](#orge901611)
10. [接下来？](#org301b31f)

其他入门教程：

-   [一年成为Emacs高手 (像神一样使用编辑器)](https://github.com/redguardtoo/mastering-emacs-in-one-year-guide)。
-   [An Emacs Tutorial for Vim User](https://github.com/w0mTea/An.Emacs.Tutorial.for.Vim.User)


<a id="orga98e413"></a>

# 前言

不同于其他 Emacs 教程，本文着重于从零开始通过 Emacs 做笔记管理，这样做的好处如下：

-   不着眼于替换你现在的编辑器或者 IDE 避免降低工作效率；
-   org-mode 是一种非常具有表达力的文档标记格式，并且配合 org-babel 可以执行代码块保存实验结果（类似 Jupyter Notebook）；
-   [org-roam](https://github.com/org-roam/org-roam) 基于 org-mode 实现 Roam Research<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup><sup>, </sup><sup><a id="fnr.2" class="footref" href="#fn.2">2</a></sup> 的方式进行先进的笔记管理；
-   基于 GitHub 可以实现免费的托管和；配合 [ox-hugo](https://github.com/kaushalmodi/ox-hugo/) 生成 [hugo](https://gohugo.io) 站点并结合 GitHub Pages 免费发布到网上。

也许通过记录笔记你会爱上 Emacs 并开始慢慢掌握它，将它作为主要编辑器！


<a id="orgdba0751"></a>

# 安装、启动、退出

目前（2021-07-29）最新稳定版是 27.2，主线版本 Emacs 28 并且已经合并了 Native Comp，我日常使用的就是编译了 Native Comp 的主线版本。

我们这里选择最新的稳定版本 27.2。


<a id="org22a6da5"></a>

## Linux

-   yum（CentOS/RHEL/Fedora）
-   apt（Debian/Ubuntu）
-   pacman（Archlinux）


<a id="org3de71d0"></a>

## macOS

macOS 默认安装了 Emacs，但是版本比较低，建议大家从社区安装最新版。我之前比较常用的是 emacs-mac 这个版本，可以通过 [Homebrew](https://brew.sh/) 安装：

    $ brew tap railwaycat/emacsmacport
    $ brew install emacs-mac

然后在终端里通过以下命令打开 Emacs：

    $ open -a /usr/local/opt/emacs-mac/Emacs.app/


<a id="org141509d"></a>

## Windows

可以通过 Powershell 和 [Chocolatey](https://chocolatey.org/)<sup><a id="fnr.3" class="footref" href="#fn.3">3</a></sup> 安装：

    PS> choco install emacs-full

安装后可以在 Powershell 中启动 Emacs：

    PS> emacs


<a id="orga636d47"></a>

## 退出 Emacs

快捷键按 `C-x C-c` （就是按住 `Ctrl` 不松开继续按 `x` ，然后再按住 `Ctrl` 不松开继续按 `c` ，聪明的你肯定发现只要按住 `Ctrl` 不松开依次按 `x` 和 `c` 键就可以了）。


<a id="org321e09c"></a>

# 黑话

Emacs 诞生的时间比较早，有些概念也是很早就确定了，带着时代的气息，可能不是很好理解。所以为了便于大家理解，我们在此提前进行解释，大家遇到不懂的可以随时翻回来查看:


<a id="orga7f4ec7"></a>

## 快捷键

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">黑话</th>
<th scope="col" class="org-left">解释</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left"><code>C-c</code></td>
<td class="org-left">按住 <code>Ctrl</code> 不松开然后按 <code>c</code></td>
</tr>


<tr>
<td class="org-left"><code>C-x b</code></td>
<td class="org-left">按住 <code>Ctrl</code> 不松开按 <code>x</code>, 然后松开以上按键后再按 <code>b</code></td>
</tr>


<tr>
<td class="org-left"><code>C-x C-c</code><sup><a id="fnr.4" class="footref" href="#fn.4">4</a></sup></td>
<td class="org-left">组合快捷键，你需要先按出 <code>C-x</code> ，然后继续按出 <code>Ctrl-c</code> ，两段快捷键中间可以间隔任意时间</td>
</tr>


<tr>
<td class="org-left"><code>C-g</code></td>
<td class="org-left">假如你快捷键按到一半想要放弃，可以通过这个快捷键放弃。（当然不仅是放弃快捷键，很多操作都可以通过这个快捷键终止）</td>
</tr>


<tr>
<td class="org-left"><code>M-x</code></td>
<td class="org-left"><code>Meta</code> + <code>c</code> ，Meta 键一般意味着 Alt 或者 ESC</td>
</tr>


<tr>
<td class="org-left"><code>s-l</code></td>
<td class="org-left"><code>Super</code> + <code>l</code> , Super 键现在比较少见，可以通过 <code>C-x @-s</code> 按出 <code>s-</code> 前缀，所以这个完整的快捷键是 <code>C-x @-s l</code></td>
</tr>


<tr>
<td class="org-left"><code>M-x org-id-get-create RET</code></td>
<td class="org-left"><code>M-x</code> 会弹出命令输出框，然后输入 <code>org-id-get-create</code> 按回车（ <code>RET</code> 表示回车）</td>
</tr>
</tbody>
</table>


<a id="orgf986b9e"></a>

## 概念

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">黑话</th>
<th scope="col" class="org-left">解释</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">frame</td>
<td class="org-left">图形界面的窗口：通过 <code>C-x 5 2</code> 创建一个试试，然后 <code>C-x 5 0</code> 关闭</td>
</tr>


<tr>
<td class="org-left">window</td>
<td class="org-left">分割面板：通过 <code>C-x 2</code> 水平分割， <code>C-x 3</code> 垂直分割， <code>C-x o</code> 切换面板， <code>C-x 0</code> 关闭当前面板</td>
</tr>


<tr>
<td class="org-left">face</td>
<td class="org-left">文本显示方式，字体等</td>
</tr>


<tr>
<td class="org-left">fringe</td>
<td class="org-left">分割面板的边缘</td>
</tr>


<tr>
<td class="org-left">kill</td>
<td class="org-left">剪切， <code>C-k</code> 剪切光标后面到行尾</td>
</tr>


<tr>
<td class="org-left">kill-ring</td>
<td class="org-left">剪切板，可以保存多个，可以通过 <code>M-y</code> 选择</td>
</tr>


<tr>
<td class="org-left">mode-line</td>
<td class="org-left">窗口底部的一个显示状态的横条</td>
</tr>


<tr>
<td class="org-left">minibuffers</td>
<td class="org-left">mode-line 下面的消息回显区，同时某些命令下输入区也会在这</td>
</tr>
</tbody>
</table>


<a id="org78df63a"></a>

## buffer

这个可能和大多数编辑器不太一样，Emacs 突出了 buffer 的语义，从而弱化了编辑文件语义，比如在其他编辑器或者 IDE 你可能是想的切换编辑文件，
但是 Emacs 更突出了是切换到对应的 buffer（ `C-x b` ） 编辑，而后通过 `C-x C-s` 将 buffer 的内容保存到文件中（如果是生成的 buffer 则会提示选择要保存的文件名）。

同时 Emacs 有很多临时的 buffer 来充当日志的角色，比如默认的 `*Messages*` (`C-x b *Messages* RET`) 就是一个只读 buffer 显示一些日志信息，某些操作失败了之后也会保存一些错误消息到指定的 buffer 中，我们只要切换过去就能看到。


<a id="org8e07f04"></a>

# 基本增强

默认安装的 Emacs 可以说是又丑又不好用，所以为了使用更加顺畅或者更贴合现代编辑器，我们需要修改一些配置并做一些插件的扩展。

![img](images/00-installation.png)


<a id="orga0f0f92"></a>

## 创建配置文件

Emacs 的配置文件都写在 `$HOME/.emacs.d/init.el` 中，其中 `$HOME` 就是用户的家目录，对应到不同的系统位置会有细微的差异：

-   Linux 或者 macOS:

        mkdir ~/.emacs.d/
        touch ~/.emacs.d/init.el
-   Windows: C:/Users/<username>/AppData/Roaming/.emacs.d/init.el（这个目录很深，而且默认状态下AppData目录是隐藏的。）<sup><a id="fnr.5" class="footref" href="#fn.5">5</a></sup>


<a id="orgf4b5cfd"></a>

## 共享系统剪切板

默认 Emacs 的剪切板和系统是不共享的，也就是说下面的配置你可能没有办法粘贴到 Emacs 中，这给我们抄配置或者记笔记带来了很大的困扰，
所以我们先配置 Emacs 和系统共享剪切板。

打开上面新创建的 `init.el` 配置文件（当然，用你熟悉的那个编辑器），追加如下内容：

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
            interprogram-paste-function 'copy-from-osx))
     ((memq window-system '(win32 pc))
      (setq select-enable-primary t
            select-enable-clipboard t
            save-interprogram-paste-before-kill t)))


<a id="orga552610"></a>

## 基本配置

此时我们打开 Emacs 进行如下操作，按下 `C-x C-f ~/.emacs.d/init.el RET` 打开 Emacs 配置文件，接下来将下面的配置内容粘贴进来，建议操作：

1.  首先拷贝下面内容，然后在 `init.el` buffer 里（ `C-x b init.el RET` 可以切换过来，如果当前不是那个 buffer 的话）
2.  `M-.` 切换到文件末尾
3.  `C-y` 进行粘贴

（大家记住上面这些操作，下面所有追加配置内容都可以这样操作！）

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
    (menu-bar-mode -1)            ;; 取消菜单栏
    (scroll-bar-mode -1)          ;; 取消滚动条（在 Emacs 26 中无效）
    (tool-bar-mode -1)            ;; 取消工具栏
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

此时我们可以运行当前 buffer 让配置生效： `M-x eval-buffer RET` ，然后通过 `C-x C-s` 进行保存。
此时效果如下：

![img](images/01-basic.png)

对比上面可以看到中间灰色的就是 mode-line，其上面增加显示了时间、电量，并且去掉了菜单栏滚动条等，并且在左边显示了行号。同时我觉得有必要解释下 mode-line 各个部分的值：

-   `U:**-` 可以简单的理解为 U 表示编码系统（UTF-8）， `**` 表示 buffer 更改（未保存）<sup><a id="fnr.6" class="footref" href="#fn.6">6</a></sup>
-   `Bot(100,27)` 表示光标位置 Bot 即 Bottom 的缩写，即 Bottom(row,column) 。
-   `(Emacs-Lisp, ElDoc)` 表示当前 buffer 的主模式和次模式（主模式只能有一个，但是次模式可以有多个）。


<a id="orgbcfce15"></a>

## 插件包管理

Emacs 安装插件的方式多种多样，一般可以：

-   简单粗暴：直接拷贝 elisp 文件到指定位置；
-   内置的 package.el 可以安装 [MELPA](https://melpa.org/#/getting-started) 的包。
-   [el-get](https://github.com/dimitri/el-get) 可以支持多种源，如 MELPA、EmacsWiki、GitHub 等等
-   [straight.el](https://github.com/raxod502/straight.el) 同样支持很多种源，并集成了 el-get 的源，同时还支持版本锁定、集成 `use-package` 、指向 fork、本地修改等。

这里我们就以 `use-package` + `straight.el` 作为我们的插件包管理方案。<sup><a id="fnr.7" class="footref" href="#fn.7">7</a></sup>

为了启动整个包管理世界，我们需要先安装包管理，手动的安装：

    $ cd ~/.emacs.d/
    $ git clone git@github.com:jwiegley/use-package.git
    $ git clone git@github.com:raxod502/straight.el.git straight/repos/straight.el

然后在 `init.el` 中追加下面配置内容：

    ;; use package
    (eval-when-compile
      (add-to-list 'load-path "~/.emacs.d/use-package")
      (require 'use-package))

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

然后我们开始执行当前 buffer： `M-x eval-buffer RET` ，然后 straight.el 就会开始同步源：
![img](images/02-package.png)


<a id="org3c3e907"></a>

## 外观

经过漫长的等待之后，我们终于可以进行下一步了：美化！我们将安装配置以下插件：

-   doom-theme
-   doom-modeline
-   nyan-mode
-   all-the-icons
-   emojify
-   dashboard
-   centaur-tabs

将以下配置追加到 `init.el` 中：

    ;;; Appearance
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
      (dashboard-startup-banner "~/.emacs.d/logo.png")
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

又是一次漫长的等待！

![img](images/03-install-pretty.png)

好了，现在我们还需要安装一下 `all-the-icons` 的字体： `M-x all-the-icons-install-fonts RET` 。现在再看我们的 Emacs：

![img](images/04-pretty.png)

是不是漂亮多了（特意放大了窗体）！


<a id="orged8fae6"></a>

## 操作

在上面的配置过程中你可能已经感觉了 `M-x` 、 buffer 切换、文件打开等不太好用，其实社区已经有成熟的补全框架，可以对类似的场景进行补全，
我们将通过一下插件增强操作性：

-   ivy + counsel + swiper
-   goto-line-preview 预览要跳转的行
-   which-key 忘记下面该按哪个键的时候可以对你进行提醒

将以下内容追加到 `init.el` ：

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
      (ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
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

看下现在的操作：

![img](http://g.recordit.co/08QtGtwill.gif)


<a id="org45bd721"></a>

# 改变操作习惯

现在我们已经有了一套非常先进的编辑器，但是继续使用之前还有一些基本的操作需要我们掌握（前面已经有一些尝试），这部分没有特别好的办法，只能建议大家多练习几遍形成肌肉记忆。


<a id="orgb398bf5"></a>

## 移动

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">操作</th>
<th scope="col" class="org-left">快捷键</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">按字符移动</td>
<td class="org-left">⬇ <code>C-n</code> ⬆ <code>C-p</code> ⬅ <code>C-b</code> ➡ <code>C-f</code></td>
</tr>


<tr>
<td class="org-left">行首尾</td>
<td class="org-left">ahead： <code>C-a</code> end： <code>C-e</code></td>
</tr>


<tr>
<td class="org-left">buffer 头尾</td>
<td class="org-left"><code>M-,</code> （就是 M-&lt; 不按 shift）， <code>M-.</code> (M-&gt; 不按 shift)</td>
</tr>


<tr>
<td class="org-left">向上/向下</td>
<td class="org-left"><code>C-v</code> <code>M-v</code></td>
</tr>
</tbody>
</table>


<a id="org68043e8"></a>

## 选择和复制粘贴

`C-SPC` (SPC 即空格)开始选择，然后通过上面快捷键移动。

-   `M-w` 将选择内容放入 `king-ring` 但不删除选择区域
-   `C-w` 删除选择区域并将内容放入 `king-ring`
-   `M-y` 从 `king-ring` 中选择粘贴
-   `C-y` 将放入 `king-ring` 的最后一条进行粘贴


<a id="org0ac3420"></a>

# 准备记录笔记

我们接下来准备通过 hugo 发布站点，所以现在先让我们通过 hugo 创建一个站点：

1.  [安装 Hugo](https://gohugo.io/getting-started/installing/)
2.  创建一个 hugo 站点

        $ hugo new site ~/notes/
3.  创建相关目录

        $ mkdir -p ~/notes/content-org

我们需要用到以下插件：

-   org-mode
-   org-roam
-   org-superstar

让我们将以下配置追加到 `init.el` 中：

    (setq my/dump-brain-root "~/notes/")
    (use-package org
      :straight (:type git :host github :repo "bzg/org-mode")
      :after ein
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
       '((ein . t)
         (dot . t))))

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

然后通过 `M-x eval-buffer RET` 使其生效（现在输出这个命令是不是愉快多了？）！


<a id="org6758127"></a>

# 开始记录笔记

漫长的等待之后我们终于可以开始记录了。

好吧，真正的开始之前你可能还需要学习以下 Org-mode 的语法，这里不做深入展开建议参考以下文章，或者随时询问搜索引擎（如 Org-mode 如何插入链接等）：

-   [Org-mode的语法解读](https://www.zmonster.me/2015/07/12/org-mode-introduction.html)

那么，接下来请放松，跟着我来一步一步做（如果一遍不够就多来几遍）。

现在让我们敲下 `C-c n f` ，是不是能看到一个弹出层让我们输入 `Node:` ，现在没有任何节点，让我们输入 `Notes` 作为我们的根节点（当然你可以选择别的主题）。
接下来我们可以按下 `C-c C-c` 完成（或者 `C-c C-k` 中止）。

好了，现在我们有了第一篇笔记，假如我们不在 `Notes` 这个 Buffer 里，我们该如何找到这篇笔记呢？还是上面的 `C-c n f` （find），现在是不是能看到我们刚刚添加的 `Notes` 了？

接下来我们想添加第二篇并在 `Notes` 中引用它，我们需要先切换到 `Notes` （ `C-c n f Notes RET` ），然后直接在这篇笔记中的任意位置按下 `C-c n i` 继续我们的创作，输入标题： `技术` ，然后按下 `C-c C-c` 。

现在我们就能在 `Notes` 这个 buffer 下看到一个指向 `技术` 的链接，那么如何跳转过去呢？光标移动到上面按下 `C-c C-o` 即可！那么返回呢？
按下 `C-c C-.` ！其实 org-roam 提供了 Backlinks 机制，但是我很少使用，这里不做进一步的展开讨论。

org-roam 刚刚发布了 v2（我们现在用的也是 v2），支持基于 headline 创建节点，我们可以通过 Org-mode 语法创建一个 headline（以 `*` 开头），
然后光标移动上去执行 `M-x org-id-get-create` ，这时候（或许等一会）你再次通过 `C-c n f` 就能看到一个指向该 Headline 的节点。

只有亲自试一下你才能感受到 org-roam 的强大！

![img](http://g.recordit.co/cYKhCjkqQN.gif)


<a id="orgda047fa"></a>

# 进阶


<a id="org71dc7fe"></a>

## 导出 Hugo 站点

如果我们想要方便的查阅我们的笔记，或者想要通过这种方式写播客然后发布出去，我们可以配合
[ox-hugo](https://github.com/kaushalmodi/ox-hugo) 插件，这个插件可以将 `Org-mode` 格式的文件导出 Hugo 格式的 markdown 文件。

我们将如下配置内容追加到 `init.el` 中：

    (use-package ox-hugo
      :straight t
      :after (ox org-mode))

执行当前 buffer： `M-x eval-buffer RET` 。

完成之后，我们需要配置在笔记目录下，每次保存 Org-mode 文件时自动使用 `ox-hugo` 进行转换。

在 Emacs 中，按如下步骤操作：

1.  创建 `~/notes/.dir-locals.el`: `C-x C-f ~/notes/.dir-locals.el`
2.  追加如下内容到 `.dir-locals.el`:

        (("content-org/" . ((org-mode . ((eval org-hugo-auto-export-mode))))))
3.  按下 `C-x C-s` 保存，然后按下 `C-x C-k` 关闭当前 Buffer；
4.  重新打开 Emacs 或者 `C-x C-k` 关闭所有 `~/notes` 目录下的 Buffer；
5.  按下 `C-c n f Notes RET`  切换到 `Notes` 节点，做一些无用的改动，然后按下 `C-x C-s` 保存；
6.  这时候你会看到消息回显区显示已经写入了 Markdown 文件。

你可能需要依次打开现有的 Org-mode 文件，做一些无用的改动然后保存，以生成对应的 Markdown 文件。

最后，通过在 `~/notes` 目录下运行如下命令，即可启动本地 Hugo 站点：

    $ hugo server -D --disableFastRender --navigateToChanged

按照提示打开页面是不是什么都没显示？这是因为我们需要配置一个主题，我们这里使用 [contrast](https://github.com/niklasbuschmann/contrast-hugo)：

    $ cd ~/notes/themes/
    $ git clone https://github.com/niklasbuschmann/contrast-hugo.git contrast

然后在 `config.toml` 中指定使用该主题：

    theme = "contrast"

现在我们在运行一下我们的 Hugo 站点：

    $ hugo server -D --disableFastRender --navigateToChanged

再次打开浏览器就可以看到内容了！


<a id="org5d10bf9"></a>

## 发布 GitHub Pages

如果你想要将内容发布到网上，[GitHub Pages](https://pages.github.com/) 是一个非常好的选择，原因如下：

-   免费
-   自动化
-   内容托管防丢失

首先你需要准备一个仓库，仓库名必须是 `username.github.com` ，其中 `username` 要替换成你自己的 GitHub 用户名。
比如我的就是 [coldnight.github.com](https://github.com/coldnight/coldnight.github.com)。接下来需要将笔记通过 Git 推送到 GitHub 上：

    $ cd ~/notes
    $ git init  # 初始化项目
    $ git remote add origin https://github.com/coldnight/coldnight.github.com.git  # 一样 username 需要替换成你自己的 GitHub 用户名
    $ git add . && git commit -m 'init'
    $ git push origin master

接下来配置 [GitHub Actions](https://docs.github.com/cn/actions) 进行自动化发布，首先创建配置文件：

    $ cd ~/notes
    $ mkdir -p .github/workflows
    $ touch .github/workflows/main.yml

接下来通过 Emacs 打开 `.github/workflows/main.yml`, 按下 `C-x C-f ~/notes/.github/workflows/main.yml RET` ，填充如下内容：

    # This is a basic workflow to help you get started with Actions
    name: Build hugo site

    # Controls when the action will run.
    on:
      # Triggers the workflow on push or pull request events but only for the master branch
      push:
        branches: [ master ]
      # Allows you to run this workflow manually from the Actions tab
      workflow_dispatch:

    jobs:
      deploy:
        runs-on: ubuntu-20.04
        concurrency:
          group: ${{ github.workflow }}-${{ github.ref }}
        steps:
          - uses: actions/checkout@v2
            with:
              submodules: true  # Fetch Hugo themes (true OR recursive)
              fetch-depth: 0    # Fetch all history for .GitInfo and .Lastmod

          - name: Setup Hugo
            uses: peaceiris/actions-hugo@v2
            with:
              hugo-version: '0.85.0'
              # extended: true

          - name: Build
            run: hugo --minify

          - name: Deploy
            uses: peaceiris/actions-gh-pages@v3
            if: ${{ github.ref == 'refs/heads/master' }}
            with:
              github_token: ${{ secrets.GITHUB_TOKEN }}
              publish_dir: ./public

接下来我们还需要调整一下 hugo 的配置，按下 `C-x C-f ~/notes/config.toml RET` 增加如下配置内容：

    baseURL = "http://username.github.io/"     # 替换 username 为你自己的用户名

然后将配置文件提交，提交完成就会触发自动构建 GitHub Pages：

    $ git add .github config.toml
    $ git ci -m 'add workflow'
    $ git push origin master

一旦构建完成就一通过 <http://username.github.io> (注意替换 `username` 为你的 GitHub 账号)访问。


<a id="org825dcf0"></a>

# 超阶

这里给出一些「更高级」的主题，如果有兴趣可以自行探索。


<a id="org86716ed"></a>

## 项目管理：projectile

我们一般使用的 IDE 都是按照项目进行管理，Emacs 也有类似功能的插件 [projectile](https://github.com/bbatsov/projectile)：

-   快速的在多个项目中间切换；
-   快速的在项目中全文查找（配合 [the<sub>silver</sub><sub>searcher</sub>](https://github.com/ggreer/the_silver_searcher)）；
-   快速测试、编译和运行。

可以将如下配置内容追加到 `init.el`:

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

然后执行当前 buffer 即可： `M-x eval-buffer RET` 。

常用快捷键：

-   `C-c p p` 切换项目
-   `C-c p U` 运行项目（上面配置如果在一个笔记项目中会弹出 hugo 的运行命令）
-   `C-c a p` 项目内全局搜索


<a id="org402384d"></a>

## 使用 Emacs 作为 Git 客户端：magit

Emacs 的一个非常强大的插件 [magit](https://magit.vc/)，作为 Git 客户端非常好用，建议大家学习。

将如下配置内容追加到 `init.el`:

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

执行当前 buffer： `M-x eval-buffer RET` 。

快捷键就在上面配置文件内，如果需要更复杂的操作可以：

1.  `M-x magit-` 看补全的命令；
2.  或 `C-c m-s` 打开状态面板，然后按下 `?` 看允许的操作。


<a id="orge901611"></a>

## 收集笔记：org-protocol

相信你可能用过一些选中然后发送给笔记客户端进行记录笔记的操作，通过  Emacs 也可以做到，
基本思路就是在各个系统或应用注册一个 `org-protocol://` 的协议，然后通过这个协议结合
Emacs 的 client/server 模式，来将内容发送到 Emacs。可以参考：

-   [Org-roam Protocol](https://www.orgroam.com/manual.html#Org_002droam-Protocol)


<a id="org301b31f"></a>

# 接下来？

遇到不会的 `C-h` 是你的好帮手（which-key 会帮你弹出所有帮助主题），常用的有：

-   `C-h f` 函数（major mode 和 minor mode 也是一个函数）
-   `C-h v` 变量
-   `C-h b` 按键绑定

然后就去问搜索引擎、社区、身边的人、提 Issue 等，掌握 Emacs 无他，但手熟尔!


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> [https://www.nateliason.com/blog/roam](https://www.nateliason.com/blog/roam)

<sup><a id="fn.2" href="#fnr.2">2</a></sup> [How To Take Smart Notes: 10 Principles to Revolutionize Your Note-Taking and Writing](https://fortelabs.co/blog/how-to-take-smart-notes/)

<sup><a id="fn.3" href="#fnr.3">3</a></sup> [在 Windows 上安装 GNU Emacs](https://zhuanlan.zhihu.com/p/111673670)

<sup><a id="fn.4" href="#fnr.4">4</a></sup> 这是退出 Emacs 的快捷键，非常有用，相信我

<sup><a id="fn.5" href="#fnr.5">5</a></sup> <https://www.jianshu.com/p/186a3409e878>

<sup><a id="fn.6" href="#fnr.6">6</a></sup> 其实这里要复杂的多，具体的可以参见文档 [Mode Line](https://www.gnu.org/software/emacs/manual/html_node/emacs/Mode-Line.html)

<sup><a id="fn.7" href="#fnr.7">7</a></sup> 一些网上给的配置如果不是 `use-package` 的格式，我们可以简单的将配置放在 `use-package` 的 `:init` 下。
