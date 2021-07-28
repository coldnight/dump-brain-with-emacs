
# Table of Contents

1.  [前言](#orga72140f)
2.  [黑话翻译](#orgcd35f14)
3.  [安装、启动、退出](#org4e19ef8)
    1.  [Linux](#org602aa39)
    2.  [macOS](#orgad866d3)
    3.  [Windows](#orga2e7256)
    4.  [退出 Emacs](#org925b2a6)
4.  [插件包管理](#org2d544e0)
5.  [基本增强](#org92b2403)
    1.  [外观](#orga23dee6)
    2.  [ivy + counsel + swiper](#org1260e05)
    3.  [which-key](#orge6d81ad)
6.  [操作习惯的改变](#org583ed19)
    1.  [是否需要左侧目录树？](#orgc595acd)
    2.  [是否需要 Tabbar？](#org4776f65)
    3.  [习惯 `M-x` 和 `C-h ?`](#org5ed5119)
7.  [准备笔记记录](#orgf059628)
8.  [开始笔记记录](#orgb41c133)
9.  [导出 Hugo 站点](#orgb21e894)
10. [发布 GitHub Pages](#orga2c6646)

其他入门教程：

-   [一年成为Emacs高手 (像神一样使用编辑器)](https://github.com/redguardtoo/mastering-emacs-in-one-year-guide)。
-   [An Emacs Tutorial for Vim User](https://github.com/w0mTea/An.Emacs.Tutorial.for.Vim.User)


<a id="orga72140f"></a>

# 前言

不同于其他 Emacs 教程，本文着重于从零开始通过 Emacs 做笔记管理，这样做的好处如下：

-   不着眼于替换你现在的编辑器或者 IDE 避免降低工作效率；
-   org-mode 是一种非常具有表达力的文档标记格式，并且配合 org-babel 可以执行代码块保存实验结果（类似 Jupyter Notebook）；
-   [org-roam](https://github.com/org-roam/org-roam) 基于 org-mode 实现来 Roam Research<sup><a id="fnr.1" class="footref" href="#fn.1">1</a></sup><sup>, </sup><sup><a id="fnr.2" class="footref" href="#fn.2">2</a></sup> 的方式进行先进的笔记管理；
-   基于 GitHub 可以实现免费的托管和；
-   配合 [ox-hugo](https://github.com/kaushalmodi/ox-hugo/) 生成 [hugo](https://gohugo.io) 站点并结合 GitHub Pages 免费发布到网上。

也许通过这个你可以爱上 Emacs 并开始将它作为主要编辑器最终助力你提升工作效率。


<a id="orgcd35f14"></a>

# 黑话翻译

下文可能会出现一些大家不太理解的地方，这里提前进行翻译，大家遇到不懂的可以随时翻回来查看:

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
<td class="org-left"><code>C-c C-x</code></td>
<td class="org-left">这是一段快捷键，你需要先按住 <code>Ctrl</code> 不松开然后按 <code>c</code> ，松开之后继续按住 <code>Ctrl</code> 不松开然后按 <code>x</code></td>
</tr>


<tr>
<td class="org-left"><code>C-c</code></td>
<td class="org-left"><code>Ctrl</code> + <code>c</code></td>
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


<a id="org4e19ef8"></a>

# 安装、启动、退出

现在最新稳定版是 27.2，主线版本是 Emacs 28 并且已经合并 Native Comp，我日常使用的就是编译了 Native Comp 的主线版本。
为了贴合我们的主题我们这里选择最新的稳定版本 27.2 进行，建议大家也安装最新稳定版 27.2。


<a id="org602aa39"></a>

## Linux

-   yum（CentOS/RHEL/Fedora）
-   apt（Debian/Ubuntu）
-   pacman（Archlinux）


<a id="orgad866d3"></a>

## macOS

macOS 默认安装了 Emacs，但是版本比较低，建议大家从社区安装最新版。我之前比较常用的是 emacs-mac 这个版本，可以通过 [Homebrew](https://brew.sh/) 安装：

    $ brew tap railwaycat/emacsmacport
    $ brew install emacs-mac

然后在终端里通过以下命令打开 Emacs：

    $ open -a /usr/local/opt/emacs-mac/Emacs.app/


<a id="orga2e7256"></a>

## Windows

可以通过 Powershell 和 [Chocolatey](https://chocolatey.org/)<sup><a id="fnr.3" class="footref" href="#fn.3">3</a></sup> 安装：

    PS> choco install emacs-full

安装后可以在 Powershell 中启动 Emacs：

    PS> emacs


<a id="org925b2a6"></a>

## 退出 Emacs

快捷键按 `C-x C-c` （就是按住 `Ctrl` 不松开继续按 `x` ，然后再按住 `Ctrl` 不松开继续按 `c` ，聪明的你肯定发现只要按住 `Ctrl` 不松开依次按 `x` 和 `c` 键就可以了）。


<a id="org2d544e0"></a>

# 插件包管理


<a id="org92b2403"></a>

# 基本增强

默认安装的 Emacs 可以说是又丑又不好用，所以为了使用更加顺畅或者更贴合现代编辑器，我们需要修改一些配置并做一些插件的扩展。


<a id="orga23dee6"></a>

## 外观

-   doom-theme
-   doom-modeline
-   all-the-icons
-   dashboard


<a id="org1260e05"></a>

## ivy + counsel + swiper


<a id="orge6d81ad"></a>

## which-key


<a id="org583ed19"></a>

# 操作习惯的改变


<a id="orgc595acd"></a>

## 是否需要左侧目录树？


<a id="org4776f65"></a>

## 是否需要 Tabbar？


<a id="org5ed5119"></a>

## 习惯 `M-x` 和 `C-h ?`


<a id="orgf059628"></a>

# 准备笔记记录


<a id="orgb41c133"></a>

# 开始笔记记录


<a id="orgb21e894"></a>

# 导出 Hugo 站点


<a id="orga2c6646"></a>

# 发布 GitHub Pages


# Footnotes

<sup><a id="fn.1" href="#fnr.1">1</a></sup> [https://www.nateliason.com/blog/roam](https://www.nateliason.com/blog/roam)

<sup><a id="fn.2" href="#fnr.2">2</a></sup> [How To Take Smart Notes: 10 Principles to Revolutionize Your Note-Taking and Writing](https://fortelabs.co/blog/how-to-take-smart-notes/)

<sup><a id="fn.3" href="#fnr.3">3</a></sup> [在 Windows 上安装 GNU Emacs](https://zhuanlan.zhihu.com/p/111673670)
