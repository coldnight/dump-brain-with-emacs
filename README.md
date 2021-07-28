
# Table of Contents

1.  [前言](#orgc640511)
2.  [安装、启动、退出](#org575885b)
    1.  [Linux](#org39e7a73)
    2.  [macOS](#orgf491699)
    3.  [Windows](#orgf74695f)
    4.  [退出 Emacs](#org91e76f6)
3.  [黑话](#org3a22511)
    1.  [快捷键](#org98f7480)
    2.  [概念](#orge6d50c0)
    3.  [buffer](#org29e8cf3)
4.  [基本增强](#org183e767)
    1.  [创建配置文件](#org035368c)
    2.  [基本配置](#orgdf39545)
    3.  [插件包管理](#org773f4f2)
    4.  [外观](#org9097d52)
    5.  [操作](#org9d072f6)
5.  [操作习惯的改变](#orgdfd1525)
    1.  [是否需要左侧目录树？](#org9c0f542)
    2.  [是否需要 Tabbar？](#orge751631)
    3.  [习惯 `M-x` 和 `C-h ?`](#orge42befe)
    4.  [高效移动](#orgc435e98)
    5.  [复制粘贴](#orgb1bf060)
6.  [准备笔记记录](#org3e69fdc)
7.  [开始笔记记录](#org3f32fe7)
8.  [收集笔记：org-protocol](#org3f75076)
9.  [托管笔记：magit](#orgbeac2ab)
10. [导出 Hugo 站点](#org29de071)
11. [发布 GitHub Pages](#orgd7583ba)
    1.  [GitHub workflow](#org68620be)

其他入门教程：

-   [一年成为Emacs高手 (像神一样使用编辑器)](https://github.com/redguardtoo/mastering-emacs-in-one-year-guide)。
-   [An Emacs Tutorial for Vim User](https://github.com/w0mTea/An.Emacs.Tutorial.for.Vim.User)


<a id="orgc640511"></a>

# 前言

不同于其他 Emacs 教程，本文着重于从零开始通过 Emacs 做笔记管理，这样做的好处如下：

-   不着眼于替换你现在的编辑器或者 IDE 避免降低工作效率；
-   org-mode 是一种非常具有表达力的文档标记格式，并且配合 org-babel 可以执行代码块保存实验结果（类似 Jupyter Notebook）；
-   [org-roam](https://github.com/org-roam/org-roam) 基于 org-mode 实现来 Roam Research<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup><sup>, </sup><sup><a id="fnr.2" class="footref" href="#fn.2">2</a></sup> 的方式进行先进的笔记管理；
-   基于 GitHub 可以实现免费的托管和；
-   配合 [ox-hugo](https://github.com/kaushalmodi/ox-hugo/) 生成 [hugo](https://gohugo.io) 站点并结合 GitHub Pages 免费发布到网上。

也许通过这个你可以爱上 Emacs 并开始将它作为主要编辑器最终助力你提升工作效率。


<a id="org575885b"></a>

# 安装、启动、退出

现在最新稳定版是 27.2，主线版本是 Emacs 28 并且已经合并 Native Comp，我日常使用的就是编译了 Native Comp 的主线版本。
为了贴合我们的主题我们这里选择最新的稳定版本 27.2 进行，建议大家也安装最新稳定版 27.2。


<a id="org39e7a73"></a>

## Linux

-   yum（CentOS/RHEL/Fedora）
-   apt（Debian/Ubuntu）
-   pacman（Archlinux）


<a id="orgf491699"></a>

## macOS

macOS 默认安装了 Emacs，但是版本比较低，建议大家从社区安装最新版。我之前比较常用的是 emacs-mac 这个版本，可以通过 [Homebrew](https://brew.sh/) 安装：

    $ brew tap railwaycat/emacsmacport
    $ brew install emacs-mac

然后在终端里通过以下命令打开 Emacs：

    $ open -a /usr/local/opt/emacs-mac/Emacs.app/


<a id="orgf74695f"></a>

## Windows

可以通过 Powershell 和 [Chocolatey](https://chocolatey.org/)<sup><a id="fnr.3" class="footref" href="#fn.3">3</a></sup> 安装：

    PS> choco install emacs-full

安装后可以在 Powershell 中启动 Emacs：

    PS> emacs


<a id="org91e76f6"></a>

## 退出 Emacs

快捷键按 `C-x C-c` （就是按住 `Ctrl` 不松开继续按 `x` ，然后再按住 `Ctrl` 不松开继续按 `c` ，聪明的你肯定发现只要按住 `Ctrl` 不松开依次按 `x` 和 `c` 键就可以了）。


<a id="org3a22511"></a>

# 黑话

Emacs 诞生的时间比较早，有些概念也是很早就确定了，带着时代的气息，可能不是很好理解。所以为了便于大家理解，我们在此提前进行解释，大家遇到不懂的可以随时翻回来查看:


<a id="org98f7480"></a>

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


<a id="orge6d50c0"></a>

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
</tbody>
</table>


<a id="org29e8cf3"></a>

## buffer

这个可能和大多数编辑器不太一样，Emacs 突出了 buffer 的语义，从而弱化了编辑文件语义，比如在其他编辑器或者 IDE 你可能是想的切换编辑文件，
但是 Emacs 更突出了是切换到对应的 buffer（ `C-x b` ） 编辑，而后通过 `C-x C-s` 将 buffer 的内容保存到文件中（如果是生成的 buffer 则会提示选择要保存的文件名）。


<a id="org183e767"></a>

# 基本增强

默认安装的 Emacs 可以说是又丑又不好用，所以为了使用更加顺畅或者更贴合现代编辑器，我们需要修改一些配置并做一些插件的扩展。

![img](images/00-installation.png)


<a id="org035368c"></a>

## 创建配置文件

Emacs 的配置文件都写在 `$HOME/.emacs.d/init.el` 中，其中 `$HOME` 就是用户的家目录，对应到不同的系统位置会有细微的差异：

-   Linux 或者 macOS:

        mkdir ~/.emacs.d/
        touch ~/.emacs.d/init.el
-   Windows: C:/Users/<username>/AppData/Roaming/.emacs.d/init.el（这个目录很深，而且默认状态下AppData目录是隐藏的。）<sup><a id="fnr.5" class="footref" href="#fn.5">5</a></sup>


<a id="orgdf39545"></a>

## 基本配置

此时我们打开 Emacs 进行如下操作： `C-x C-f ~/.emacs.d/init.el RET` 并进行一些基本的配置：

    ;; 指定自定义配置文件，防止自定义配置污染 init.el，并加载该配置文件
    (setq custom-file (expand-file-name "~/.emacs.d/custom.el"))
    (if (file-exists-p custom-file)
        (load custom-file))

    ;;; init-commont.el -- Emacs 基本配置
    ;;;
    ;;; Commentary:
    ;;;
    ;;;    基本配置
    ;;; Code:
    ;;;

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

对比上面可以看到中间灰色的（modeline）增加显示了时间、电量，并且去掉了菜单栏滚动条等，并且在左边显示了行号。同时我觉得有必要解释下 modeline（底部灰色的横幅）各个部分的值：

-   `U:**-` 可以简单的理解为 U 表示编码系统（UTF-8）， `**` 表示 buffer 更改（未保存）<sup><a id="fnr.6" class="footref" href="#fn.6">6</a></sup>
-   `Bot(100,27)` 表示光标位置 Bot 即 Bottom 的缩写，即 Bottom(row,column) 。
-   `(Emacs-Lisp, ElDoc)` 表示当前 buffer 的主模式和次模式（主模式只能有一个，但是次模式可以有多个）。


<a id="org773f4f2"></a>

## 插件包管理

Emacs 安装插件的方式多种多样，一般可以：

-   简单粗暴：直接拷贝 elisp 文件到指定位置；
-   内置的 package.el 可以安装 [MELPA](https://melpa.org/#/getting-started) 的包。
-   [el-get](https://github.com/dimitri/el-get) 可以支持多种源，如 MELPA、EmacsWiki、GitHub 等等
-   [straight.el](https://github.com/raxod502/straight.el) 同样支持很多中源，同时还支持版本锁定、集成 `use-package` 、指向 fork、本地修改等。

目前我正在使用的就是 `use-package` + `straight.el` 的方式， `use-package` 感觉不是很适合小白，因为很多搜索到的配置在 `use-package` 下要做一些改变，所以在这里我也是很纠结要不要用 `use-package` 。
但是我相信通过简单的学习，这些应该不会成为障碍，所以这里我们就以 `use-package` + `straight.el` 作为我们的插件包管理方案。


<a id="org9097d52"></a>

## 外观

-   doom-theme
-   doom-modeline
-   all-the-icons
-   dashboard


<a id="org9d072f6"></a>

## 操作

-   ivy
-   counsel
-   swiper
-   which-key


<a id="orgdfd1525"></a>

# 操作习惯的改变


<a id="org9c0f542"></a>

## 是否需要左侧目录树？


<a id="orge751631"></a>

## 是否需要 Tabbar？


<a id="orge42befe"></a>

## 习惯 `M-x` 和 `C-h ?`


<a id="orgc435e98"></a>

## 高效移动


<a id="orgb1bf060"></a>

## 复制粘贴


<a id="org3e69fdc"></a>

# 准备笔记记录


<a id="org3f32fe7"></a>

# 开始笔记记录


<a id="org3f75076"></a>

# 收集笔记：org-protocol


<a id="orgbeac2ab"></a>

# 托管笔记：magit


<a id="org29de071"></a>

# 导出 Hugo 站点


<a id="orgd7583ba"></a>

# 发布 GitHub Pages


<a id="org68620be"></a>

## GitHub workflow


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> [https://www.nateliason.com/blog/roam](https://www.nateliason.com/blog/roam)

<sup><a id="fn.2" href="#fnr.2">2</a></sup> [How To Take Smart Notes: 10 Principles to Revolutionize Your Note-Taking and Writing](https://fortelabs.co/blog/how-to-take-smart-notes/)

<sup><a id="fn.3" href="#fnr.3">3</a></sup> [在 Windows 上安装 GNU Emacs](https://zhuanlan.zhihu.com/p/111673670)

<sup><a id="fn.4" href="#fnr.4">4</a></sup> 这是退出 Emacs 的快捷键，非常有用，相信我

<sup><a id="fn.5" href="#fnr.5">5</a></sup> <https://www.jianshu.com/p/186a3409e878>

<sup><a id="fn.6" href="#fnr.6">6</a></sup> 其实这里要复杂的多，具体的可以参见文档 [Mode Line](https://www.gnu.org/software/emacs/manual/html_node/emacs/Mode-Line.html)
