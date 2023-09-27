Lecture Homepage: https://missing.csail.mit.edu/

<!-- TOC -->

- [MIT: missing-semesters](#mit-missing-semesters)
    - [1. the shell](#1-the-shell)
        - [cd ~ cd -](#cd--cd--)
        - [ls -l](#ls--l)
        - [rmdir](#rmdir)
        - [ctrl + l](#ctrl--l)
        - [cat](#cat)
        - [> >> redirection](#--redirection)
        - [| pipe character](#-pipe-character)
        - [open file before "sudo echo"](#open-file-before-sudo-echo)
        - [tee](#tee)
    - [2. shell tools and scripting](#2-shell-tools-and-scripting)
        - [赋值和输出](#赋值和输出)
        - [shell 脚本函数变量 source 加载 函数名执行](#shell-脚本函数变量-source-加载-函数名执行)
        - [bash 特定的变量](#bash-特定的变量)
        - [将指令的输出作为变量的值](#将指令的输出作为变量的值)
        - [{} 括号拓展](#-括号拓展)
        - [? * 字符匹配](#--字符匹配)
        - [diff 指令](#diff-指令)
        - [使用环境变量 (PATH environment variable) 来解析脚本](#使用环境变量-path-environment-variable-来解析脚本)
        - [find 指令 (or fd)](#find-指令-or-fd)
        - [grep (or ripgrep, rg)](#grep-or-ripgrep-rg)
        - [history, ctrl + R](#history-ctrl--r)
        - [fzf (conmand-line fuzzy finder)](#fzf-conmand-line-fuzzy-finder)
    - [3. vim](#3-vim)
        - [5 modes](#5-modes)
            - [command-line mode](#command-line-mode)
        - [movement in normal mode](#movement-in-normal-mode)
        - [selection in normal mode](#selection-in-normal-mode)
        - [visual mode commands](#visual-mode-commands)
        - [edit commands](#edit-commands)
        - [count with minipulation](#count-with-minipulation)
        - [modifiers](#modifiers)
        - [vim extensions](#vim-extensions)
    - [4. Data Wrangling](#4-data-wrangling)
        - [ssh run command](#ssh-run-command)
        - [regex](#regex)
        - [sed: stream editor](#sed-stream-editor)
        - [awk](#awk)
        - [non-greedy regex using `perl -pe`](#non-greedy-regex-using-perl--pe)
        - [wc: print newline, word, byte counts for each file](#wc-print-newline-word-byte-counts-for-each-file)
    - [5. Command-line Environment](#5-command-line-environment)
        - [[suspend, terminate, list, bringback, kill] jobs](#suspend-terminate-list-bringback-kill-jobs)
        - [tmux](#tmux)
            - [in normal shell](#in-normal-shell)
            - [in tmux session](#in-tmux-session)
            - [tmux panes](#tmux-panes)
        - [aliases](#aliases)
        - [dotfiles](#dotfiles)
            - [local configuration files](#local-configuration-files)
        - [ssh](#ssh)
            - [ssh+tee, scp, rsync](#sshtee-scp-rsync)
            - [ssh port forwarding](#ssh-port-forwarding)
            - [ssh config files](#ssh-config-files)
            - [ssh login without passwd](#ssh-login-without-passwd)
    - [6. Version Control(Git)](#6-version-controlgit)
        - [Git data model](#git-data-model)
        - [Model history](#model-history)
        - [Data Model as pseudocode](#data-model-as-pseudocode)
        - [Objects are content-addressed by hash](#objects-are-content-addressed-by-hash)
        - [References to hash](#references-to-hash)
        - [Git repository](#git-repository)
        - [Git command](#git-command)
            - [Basics](#basics)
            - [Branch and merge](#branch-and-merge)
            - [Remotes](#remotes)
            - [Undo](#undo)
            - [Advanced commands](#advanced-commands)
        - [Git merge example](#git-merge-example)
        - [A note about git commit message](#a-note-about-git-commit-message)
        - [Remove sensitive data from a git repo](#remove-sensitive-data-from-a-git-repo)
    - [7. Debugging profiling](#7-debugging-profiling)
        - [logger, journalctl, lnav](#logger-journalctl-lnav)
        - [Debuggers](#debuggers)
        - [Static analysis](#static-analysis)
        - [time](#time)
        - [CPU](#cpu)
        - [Memory](#memory)
        - [Visualization](#visualization)
        - [Resource Monitoring](#resource-monitoring)
    - [8. Metaprogramming](#8-metaprogramming)
        - [Building systems](#building-systems)
        - [Continuous integration (CI)](#continuous-integration-ci)
        - [Different kinds of testing](#different-kinds-of-testing)
    - [9. Security and Cryptography](#9-security-and-cryptography)
        - [Hash functions](#hash-functions)
            - [Applications of hash function](#applications-of-hash-function)
        - [Key derivation functions (KDFs)](#key-derivation-functions-kdfs)
            - [Applications of KDFs](#applications-of-kdfs)
        - [Symmetric cryptography](#symmetric-cryptography)
            - [Applications of symmetric cryptography](#applications-of-symmetric-cryptography)
        - [Asymmetric cryptography](#asymmetric-cryptography)
            - [Applications of asymmetric cryptography](#applications-of-asymmetric-cryptography)
            - [Key distribution](#key-distribution)
    - [10. Potpourri](#10-potpourri)
        - [Keyboard remapping](#keyboard-remapping)
        - [Daemons](#daemons)
        - [FUSE](#fuse)
        - [Backups](#backups)
        - [APIs](#apis)
        - [Command-line flags/patterns](#command-line-flagspatterns)
        - [VPNs](#vpns)
        - [Hammerspoon (desktop autpmation on macOS)](#hammerspoon-desktop-autpmation-on-macos)
        - [Notebook programming](#notebook-programming)
    - [11. Q&A](#11-qa)
        - [Difference between `source script.sh` and `./script.sh`](#difference-between-source-scriptsh-and-scriptsh)
        - [Filesystem hierarchy standard](#filesystem-hierarchy-standard)
        - [System package manager vs language package manager](#system-package-manager-vs-language-package-manager)
        - [More vim tips](#more-vim-tips)

<!-- /TOC -->

## MIT: missing-semesters

### 1. the shell

#### cd ~ cd -

`cd ~` 命令返回 `/home`

`cd -` 命令可以在当前目录和上一个目录之前来回切换

```bash
zl@LAPTOP-ZL ~> pwd
/home/zl

zl@LAPTOP-ZL ~> cd -
zl@LAPTOP-ZL ~/c/l/datalab-handout> pwd
/home/zl/csapp/lab/datalab-handout

zl@LAPTOP-ZL ~/c/l/datalab-handout> cd -
zl@LAPTOP-ZL ~> pwd
/home/zl
```

#### ls -l

```
zl@LAPTOP-ZL ~/rust_learn> ls -l
total 2412
drwxrwxrwx 1 zl   zl      4096 Sep  9 22:43 branches/
drwxrwxrwx 1 zl   zl      4096 Sep 18 14:44 defining_enum/
drwxrwxrwx 1 zl   zl      4096 Sep  9 22:01 functions/
drwxrwxrwx 1 zl   zl      4096 Sep  6 12:50 guessing_game/
drwxrwxrwx 1 zl   zl      4096 Sep  6 12:13 hello_cargo/
drwxrwxrwx 1 zl   zl      4096 Sep  9 23:06 loops/
-rwxrwxrwx 1 zl   zl   2469128 Sep  6 11:54 main*
-rw-r--r-- 1 root root      45 Sep  6 11:54 main.rs
drwxrwxrwx 1 zl   zl      4096 Sep 18 15:51 match_control_flow/
drwxrwxrwx 1 zl   zl      4096 Sep 11 20:07 ownership/
drwxrwxrwx 1 zl   zl      4096 Sep 17 23:55 rectangles/
drwxrwxrwx 1 zl   zl      4096 Sep 12 13:31 references_and_borrowing/
drwxrwxrwx 1 zl   zl      4096 Sep 17 23:20 structure/
drwxrwxrwx 1 zl   zl      4096 Sep 12 14:42 the_slice_type/
drwxrwxrwx 1 zl   zl      4096 Sep  9 09:05 variables/
```

1. 首字母 d 表示是一个 directory
2. 前三个字母组，表示 owner of the file 的权限
3. 中间三个字母组，表示 group of the file 的权限
4. 最后三个字母组，表示 anyone else 的权限

- 后边的第一个 zl 表示 owner，第二个 zl 表示 group。

- 三个字母的意思：read, write, execute。

#### rmdir

只当文件夹为空的时候才能删除文件夹

#### ctrl + l 

or command `clear`

clean the terminal

#### cat 

cat 支持的形式 `cat filename`, `cat < filename`：

```bash
zl@LAPTOP-ZL ~/rust_learn> cat main.rs
fn main() {
    println!("hello, world!");
}
zl@LAPTOP-ZL ~/rust_learn> cat < main.rs
fn main() {
    println!("hello, world!");
}
```

#### > >> redirection

- 单个 > 命令会 overwrite 文件
- 双 >> 命令会在文件后 append

```bash
zl@LAPTOP-ZL ~/rust_learn> cat < main.rs > test.rs
zl@LAPTOP-ZL ~/rust_learn> cat test.rs
fn main() {
    println!("hello, world!");
}
zl@LAPTOP-ZL ~/rust_learn> cat < main.rs >> test.rs
zl@LAPTOP-ZL ~/rust_learn> cat test.rs
fn main() {
    println!("hello, world!");
}
fn main() {
    println!("hello, world!");
}
```

#### | pipe character

将左侧的程序的输出当作右侧程序的输入。

`tail -n` 表示输出最后几行：

```bash
zl@LAPTOP-ZL ~/rust_learn> ls -l | tail -n2
drwxrwxrwx 1 zl   zl      4096 Sep 12 14:42 the_slice_type
drwxrwxrwx 1 zl   zl      4096 Sep  9 09:05 variables
```

`tail -n +<N+1>` 表示输出从第N行开始的内容: 例如 `tail -n +2` 表示输出从第2行开始的内容。

>ref: https://stackoverflow.com/questions/604864/print-a-file-skipping-the-first-x-lines-in-bash

pipe 配合 grep 使用：

```bash
zl@LAPTOP-ZL ~/> curl --head --silent baidu.com
HTTP/1.1 200 OK
Date: Sat, 08 Feb 2020 05:20:44 GMT
Server: Apache
Last-Modified: Tue, 12 Jan 2010 13:48:00 GMT
ETag: "51-47cf7e6ee8400"
Accept-Ranges: bytes
Content-Length: 81
Cache-Control: max-age=86400
Expires: Sun, 09 Feb 2020 05:20:44 GMT
Connection: Keep-Alive
Content-Type: text/html

zl@LAPTOP-ZL ~/> curl --head --silent baidu.com | grep Server
Server: Apache

zl@LAPTOP-ZL ~> pstree -ap | grep fish
  |       `-fish,3051
  |           |-grep,9658 --color=auto fish
  |                   |   |   `-fish,3839
```

#### open file before "sudo echo"

```bash
$ cd /sys/class/backlight/thinkpad_screen
$ sudo echo 3 > brightness
An error occurred while redirecting file 'brightness'
open: Permission denied
```

上述的 permission denied 是由于：

> the shell (which is authenticated just as your user) tries to open the brightness file for writing, before setting that as sudo echo’s output
>
>https://askubuntu.com/questions/103643/cannot-echo-hello-x-txt-even-with-sudo

shell 会在执行 sudo echo 之前就进行打开文件进行写入。

解决方法为：

```bash
$ echo 3 | sudo tee brightness
```

#### tee

tee 命令会将输入写入文件并打印到标准输出。

Copy standard input to each FILE, and also to standard output.

```bash
zl@LAPTOP-ZL ~/rust_learn> echo "Hello world" | tee test.rs
Hello world
zl@LAPTOP-ZL ~/rust_learn> cat test.rs
Hello world
```

### 2. shell tools and scripting

#### 赋值和输出

```bash
zl@LAPTOP-ZL:~$ foo=bar
zl@LAPTOP-ZL:~$ echo $foo
bar
zl@LAPTOP-ZL:~$ echo "$foo"
bar
zl@LAPTOP-ZL:~$ echo '$foo'
$foo
```

'' (single quotes)内的内容为字面值，"" (double quotes)内的内容会用变量替代

#### shell 脚本函数变量 source 加载 函数名执行

source 命令会执行对应的文件内的指令。`source mcd.sh` 将 `mcd.sh` 文件内的内容添加到 shell 中，即将函数 `mcd` 添加到了 shell 中。

使用 `mcd test` 执行即执行了 创建文件夹并切换到新创建文件夹的操作。

其中 `$1` 表示第一个参数。

```bash
# mcd.sh
mcd () {
    mkdir -p "$1"
    cd "$1"
}

$ source mcd.sh
$ mcd test
```

#### bash 特定的变量

- `$1 ~ $9` 第一个和之后的变量

- `$_` 上一个命令的最后一个变量，可使用 `Esc + .` 命令显示：

```bash
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ mkdir test_last_param

zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ cd $_
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools/test_last_param$ pwd
/home/zl/missing_semester/2_shell_tools/test_last_param
```

- `!!` 完整的上一条指令

```bash
$ mkdir /usr/test
Permission denied

$ sudo !!
sudo mkdir /usr/test
```

- `$?` 前一条指令的返回代码，使用 `echo $?` 来输出

```bash
# 在 mcd.sh 文件中搜索 foobar，返回值为 1 表示没找到
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ grep foobar mcd.sh
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ echo $?
1

# 返回值为 0 表示执行成功
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ echo "Hello"
Hello
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ echo $?
0

zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ true
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ echo $?
0

zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ false
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ echo $?
1
```

- <code>$$</code> 当前脚本的 process id

- `$#` 参数的数量

- `$0` 当前脚本的名称

- `$@` 所有的参数

包含上述所有 bash 变量的程序 `example.sh`：

```bash
#!/bin/bash

echo "Starting program at $(date)"

echo "Running program $0 with $# args with pid $$"

for file in $@; do
    grep foobar $file > /dev/null 2> /dev/null

    if [[ $? -ne 0 ]]; then
        echo "File $file does not have any foobar, adding one"
        echo "# foobar" >> $file
    fi
done
```

执行结果为：

```bash
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ ./example.sh mcd.sh test2.sh
Starting program at Sun Feb  9 23:51:13 CST 2020
Running program ./example.sh with 2 args with pid 11920
File test2.sh does not have any foobar, adding one
```

#### 将指令的输出作为变量的值

例如 `foo=$(pwd)`

`echo "we are in $(pwd)"` shows `we are in /home/zl/missing_semester/2_shell_tools`

#### {} 括号拓展

```bash
# create two folders: foo/ bar/
$ mkdir {foo,bar}

# This creates files foo/a, foo/b, ... foo/j, bar/a, bar/b, ... bar/j
$ touch {foo,bar}/{a..j}
```

#### ? * 字符匹配

- `?` 表示只匹配一个任意字符

- `*` 表示匹配多个字符

```bash
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ ls
bar         foo   foo10  mcd.sh    project11..13  project16  project3  project5  test2.sh
example.sh  foo1  foo2   project1  project15      project2   project4  test      test_last_param
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ ls project?
project1:

project2:

project3:

project4:

project5:
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ ls project*
project1:

project11..13:

project15:

project16:

project2:

project3:

project4:

project5:
```

#### diff 指令 

- 展示两个文件不同

```bash
$ diff file1 file2
```

- 展示两个指令执行结果的不同

>`<(...)` is called process substitution. It converts the output of a command into a file-like object that diff can read from.
>
>While process substitution is not POSIX, it is supported by bash, ksh, and zsh.
>
>https://unix.stackexchange.com/questions/155806/how-do-i-diff-the-outputs-of-two-commands

```bash
$ diff <(ls foo/) <(ls bar/)
12c12
< x
---
> y
```

#### 使用环境变量 (PATH environment variable) 来解析脚本

可以在脚本的首行写入 `#!/usr/bin/env python` 从而在环境变量中去搜索 python 解释器的位置。

和 `#!/usr/bin/python` 相比，前一种写法保证了可以在多种机器上运行。

#### find 指令 (or fd)

```bash
$ find . -name src -type d
```

上述指令中，`.` 表示在当前文件夹搜索，名称为 `src`，类型为 `d` 文件夹

```bash
find . -name '*.tmp' -exec rm {} \;
```

上述指令对搜索结果执行 rm 操作。

#### grep (or ripgrep, rg)

1. 文件中搜索

```bash
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ grep foobar mcd.sh
# foobar
```

2. 文件夹中递归的搜索，需要 flag `-R`，`.` 表示当前文件夹

```bash
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ grep -R foobar .
./example.sh:    grep foobar $file > /dev/null 2> /dev/null
./example.sh:        echo "File $file does not have any foobar, adding one"
./example.sh:        echo "# foobar" >> $file
./mcd.sh:# foobar
./test2.sh:# foobar
```

rg 默认递归地搜索文件夹

3. 搜索某个特定的单词 `-w` flag

```bash
rg recursion .
# result:
# ./lib/StanfordCPPLib/spl.cpp
# 708: * - moved recursion functions to recursion.h/cpp
# 2364: * File: recursion.cpp
# 2366: * This file implements the recursion.h interface.
# 2370:#include "recursion.h"
# 2388:                || entries[i].function.find("recursionIndent(") != std::string::npos
# 2403:std::string recursionIndent(const std::string& indenter) {
```

如果带上 `-w` 那么 recursionInent 两个选项将会被排除在外

```bash
rg -w recursion .
# result:
# ./lib/StanfordCPPLib/util/recursion.h
# 2: * File: recursion.h
# 4: * This file includes a few utility functions related to recursion.
# 6: * to the level of recursion you are currently nested in.
```

4. 搜索时忽略大小写，flag `-i` (insensitive)

#### history, ctrl + R 

history 指令可以列出 shell 中输入的历史指令，配合 gerp 搜索效果最佳。

`history n` 展示最后的 n 条结果。

```bash
zl@LAPTOP-ZL:~/missing_semester/2_shell_tools$ history 20 | grep tldr
 2134  tldr rg
 2136  tldr rg
 2137  tldr history
 2140  tldr convert
 2141  tldr fzf
 2145  tldr history
 2151  history 20 | grep tldr
```

`ctrl + R` 指令可以从指令历史中搜索对应的指令

#### fzf (conmand-line fuzzy finder)

安装：https://github.com/junegunn/fzf#using-linux-package-managers

使用：

```bash
$ cat example.sh | fzf
```

可以进行模糊搜索。

安装的时候可以选择绑定到 `ctrl + R` 指令，从而在历史搜索时启用 fzf

### 3. vim

#### 5 modes

- normal (`Esc` or `ctrl+[`): moving around a file

- insert (`i`): inserting text 

- replace (`R`): replacing text

- visual (plain `v`, line `V`, block `ctrl+v`, last block `gv`): selecting blocks of text()

- command-line (`:`): running command

##### command-line mode

- `:q` quit window

- `:w` write

- `:wq` write and quit

- `:e {name of file}` open file for editing

- `:ls` show open buffers

- `:help {topic}` open help, such as `:help :w`, `:help w`

- `:sp` seperate another window

#### movement in normal mode

- Basic movements：`hjkl` left down up right

- Words: `w` next words, `b` begin of word, `e` end of word

- Lines: `0` beginning of line, `$` end of line, `^` first non-blank character

- Screens: `H` top of screen, `M` middle of screen, `L` bottom of screen

- Scroll: `ctrl + d` page down, `ctrl + u` page up

- File: `gg` beginning of file, `G` end of file

- Find: `f{c}` forward find c, `t{c}` forward to c, `F{c}` backward find c, `T{c}` backward to c

    > difference between `f` and `t`:
    > - `f` places the cursor on the found character
    >
    > - `t` palces the cursor on the preceding character it found
    >
    > ref: https://stackoverflow.com/questions/12495442/what-do-the-f-and-t-commands-do-in-vim

- Search: `/{regex}`, `n`/`N` for navigating matches. 搜索结束之后输入 `enter` 转入到第一个结果位置，之后输入 `n` 跳转到下一个结果位置, `shift + n` jump to previous match.

- Misc: `%` find the coresponding item (找到相应的项，例如两个括号之间进行跳转)

#### selection in normal mode

- Visual: `v`

- Visual line: `V`

- Visual block: `ctrl + v`

- Last visual block: `gv`

#### visual mode commands

- `O`: 修改 visual mode 开始端的位置

- `u / U`: flips cases of selected block (or use `~`)

#### edit commands

- `i` insert at now cursor

- `a` append at end

- `o / O` insert line down (below), up (above)

- `d{motion}` delete {motion}. such as `dd` delete this line, `d$` delete to end of line, `d0` delete to begin of line, `dw` delete word, `dG` delete to end of file, `dl` delete right character

- `c{motion}` change {motion}. `cw` change word etc, `cl` equals to `s`, `cc` equals to `S`

- `x` delete charcter (equals to `dl`)

- `s` delete character and start insert (substitute) (equals to `xi`, and short for `cl`)

- `u` undo, `ctrl + r` redo

- `y` copy. such as `yy` copy this line, `yw` copy the word, `y4l` copy right 4 characters

- `p` paste

- `~` flips the case of a character (大小写转换)

- `.` repeat previous editing command

#### count with minipulation

- `3w` move 3 words forward

- `5j` move 5 lines down

- `7dw / d7w` delete 7 words

- `7yw / y7w` copy 7 words

#### modifiers

- `i` means inner or inside

- `a` means around

配合 `c` change, `d` delete 指令使用：

- `ci(` change contents inside the current pair of **parentheses** (当前括号内)

- `ci[` change contents inside the current pair of **square brackets** (当前中括号)

- `da'` delete a single-quoted string, include surrounding single quotes

#### vim extensions

since Vim8.0 不再需要额外的插件管理器，使用内置的即可。

将插件放在目录 `~/.vim/pack/vendor/start/` 下（可以使用 git clone 命令）。统一管理 dotfiles 之后安装插件方法见 `piaoliangkb/dotfiles` 仓库介绍的装方法 (install as git submodules).

[Awesome Vim](https://vimawesome.com/)

https://missing.csail.mit.edu/2020/editors/#extending-vim

**example install `ctrlp`:**

- Install and configure a plugin: `ctrlp.vim`.

- Create the plugins directory with `mkdir -p ~/.vim/pack/vendor/start`

- Download the plugin: `cd ~/.vim/pack/vendor/start`; `git clone https://github.com/ctrlpvim/ctrlp.vim`

- Read the documentation for the plugin. Try using CtrlP to locate a file by navigating to a project directory, opening Vim, and using the Vim command-line to start `:CtrlP`.
 
- Customize CtrlP by adding configuration to your ~/.vimrc to open CtrlP by pressing `Ctrl-P`.

**example install `lightline`:**

- Install plugin `lightline.vim`

- `git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/vendor/start/lightline`

### 4. Data Wrangling

Data Wrangling: take data from one format into a different format.

#### ssh run command

可以使用 ssh 指令在远程机器上执行指令并将输出发送到当前终端：

```bash
ssh hk 'journalctl | grep sshd | grep "Disconnected from"' | less
```

- `less` 指令将对应内容形成一个可以上下滚动的 page

#### regex

- regex debugger: https://regex101.com/r/qqbZqh/2

- short interactice regex tutorial: https://regexone.com/

#### sed: stream editor

- command s: substitution (替换一次匹配的内容) `sed 's/REGEX/SUBSTITUTION/'`

- command s, g: 替换多次匹配的内容 `sed 's/REGEX/SUBSTITUTION/g'` 

有时需要在 `sed` 指令后加上 `-E` 参数，从而可以使用正常的正则表达式。

例如：

```bash
# 原数据格式
zl@LAPTOP-ZL ~/m/4_data_wrangling> cat ssh.log | head -n3
Nov 16 12:17:25 iZj6ca6sz3ematapgqi96fZ sshd[28144]: Disconnected from authenticating user root 119.137.54.94 port 18598 [preauth]
Nov 16 12:55:18 iZj6ca6sz3ematapgqi96fZ sshd[28778]: Disconnected from user root 59.64.129.219 port 62927
Nov 16 15:18:58 iZj6ca6sz3ematapgqi96fZ sshd[29155]: Disconnected from authenticating user root 140.249.35.66 port 37042 [preauth]

# 使用 sed 指令处理之后的数据格式：使用空字符替换正则表达式部分
zl@LAPTOP-ZL ~/m/4_data_wrangling>
cat ssh.log | sed 's/.*Disconnected from //' | head -n3
authenticating user root 119.137.54.94 port 18598 [preauth]
user root 59.64.129.219 port 62927
authenticating user root 140.249.35.66 port 37042 [preauth]
```

换用一个正则表达式 `.*Disconnected from (invalid |authenticating )?user (.*) [^ ]+ port [0-9]+( \[preauth\])?$`，提取出 group2 里的 username，

- 随后使用 `sort` 指令进行排序，使用 `uniq -c` 指令进行相邻去重和每项数量的计算，

- 使用 `sort` 命令对每项数量计算数据再进行排序，使用 `tail -n10` 命令输出统计次数最高的 10 项 (或者 `sort -r`, `head -n10`)：

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling>
cat ssh.log | sed -E 's/.*Disconnected from (authenticating |invalid )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?/\2/' | sort | uniq -c | sort | tail -n10
      1 xbot
      1 yk
      2 daemon
      2 marko
      2 nobody
      2 usuario
      4 test
      8 bin
     10 admin
    156 root
```

#### awk

**awk is a programming language good at processing text streams.**

对于上述使用 sed 和后续处理指令得到的数据，如下所示：

```bash
      1 xbot
      1 yk
      2 daemon
      2 marko
      2 nobody
      2 usuario
      4 test
      8 bin
     10 admin
    156 root
```

- `$1` 代表第一列数据，`$2` 代表第二列数据，可以使用 `print` 指令打印列数据：

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling>
cat ssh.log | sed -E 's/.*Disconnected from (authenticating |invalid )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?/\2/' | sort | uniq -c | sort -nk1,1 | tail -n10 | awk '{print $1}'
1
1
2
2
2
2
4
8
10
156
```

配合 `paste -sd+` 指令可以生成一个对应的加法公式 (`-s` combine lines, `-d+` use + as delimiter)：

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling>
cat ssh.log | sed -E 's/.*Disconnected from (authenticating |invalid )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?/\2/' | sort | uniq -c | sort -nk1,1 | tail -n10 | awk '{print $1}' | paste -sd+
1+1+2+2+2+2+4+8+10+156
```

配合 `bc` 命令可以计算公式的值：

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling>
cat ssh.log | sed -E 's/.*Disconnected from (authenticating |invalid )?user (.*) [0-9.]+ port [0-9]+( \[preauth\])?/\2/' | sort | uniq -c | sort -nk1,1 | tail -n10 | awk '{print $1}' | paste -sd+ | bc
188
```

- awk 判断条件：首列为 1，第二列符合正则表达式 `^f[^ ]$` 表示以 f 开头的不含空字符的字符串：

```bash
awk '$1 == 1 && $2 ~ /^f[^ ]*$/ { print $2 }'
```

- awk 循环：

```bash
BEGIN { rows = 0 }
$1 == 1 && $2 ~ /^c[^ ]*e$/ { rows += $1 }
END { print rows }
```

#### non-greedy regex using `perl -pe`

正则表达式是 greddy 的，上述的正则表达式 `'.*Disconnected from '` 会匹配最后一个 Disconnected from 之前尽可能多的字符.

例如：

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling>
echo 'something Disconnected from A Disconnected from B. OK finish string' | sed 's/.*Disconnected from //'
B. OK finish string
```

可以在 `*` 或者 `+` 符号之后加上一个 `?` 让正则表达式变的不 greddy。但是 `sed` 指令不支持这种 regex，可以换用 `perl -pe` 指令：

```bash
zl@LAPTOP-ZL ~/m/4_data_wrangling>
echo 'something Disconnected from A Disconnected from B. OK finish string' | perl -pe 's/.*?Disconnected from //'
A Disconnected from B. OK finish string
```

#### wc: print newline, word, byte counts for each file

使用 wc 统计 md 文件的行数：

```bash
zl@LAPTOP-ZL ~/missing_semester> find . -type f -name '*md' | xargs wc -l
  260 ./2_shell_tools/exercises/solutions.md
  461 ./3_vim/editors.md
    7 ./4_data_wrangling/solutions.md
  728 ./README.md
 1456 total
```

### 5. Command-line Environment

Job control, Terminal multiplexers, Dotfiles, Work with remote machine

#### [suspend, terminate, list, bringback, kill] jobs

**Signals**: https://en.wikipedia.org/wiki/Signal_(IPC)

- suspend jobs: `ctrl + z`

```bash
zl@LAPTOP-ZL ~/m/5_command-line_env> sleep 300
# enter ctrl + z
Job 1, 'sleep 300' has stopped
```

- terminate jobs: `ctrl + c`

- list current jobs: `jobs`

```bash
zl@LAPTOP-ZL ~/m/5_command-line_env> jobs
Job     Group   CPU     State   Command
2       2037    0%      running nohup sleep 2000 &
1       1889    0%      stopped sleep 300
```

- bring jobs to backend: `bg %[n]`, bring jobs to frontend: `fg %[n]`

```bash
zl@LAPTOP-ZL ~/m/5_command-line_env> jobs
Job     Group   CPU     State   Command
1       2142    0%      stopped sleep 300
2       2037    0%      running nohup sleep 2000 &

zl@LAPTOP-ZL ~/m/5_command-line_env> bg %1
Send job 1 'sleep 300' to background

zl@LAPTOP-ZL ~/m/5_command-line_env> jobs
Job     Group   CPU     State   Command
1       2142    0%      running sleep 300
2       2037    0%      running nohup sleep 2000 &
```

- kill jobs: `kill -flag %[n]`

```
kill -STOP %[n]
kill -SIGHUP %[n] # hangup this process
kill -KILL %[n]
```

#### tmux

##### in normal shell

- `tmux`: start a new session

- `tmux new -s [name]`: start a new session with name

- `tmux ls`: list current sessions

- `tmux a -t [name]`: attach the last session. use `-t` flag to specify session name

- `tmux kill-session -t [name]`: kill session
 
##### in tmux session

- `ctrl+b d`: detach the current session (sometimes can use `control+d`)

- `ctrl+b c`: create a new tmux window 

- `ctrl+b p`: go to the previous window

- `ctrl+b n`: go to the next window

- `ctrl+b [N]`: go to the Nth window

- `ctrl+b ,`: rename the current window

- `ctrl+b w`: list current windows

- `ctrl+b x`: kill session when attached

- `ctrl+b :setw synchronize-panes on`: broadcast to all panes

- `ctrl+b :setw synchronize-panes off`: broadcast to all panes off

- `ctrl+b :setw automatic-rename`: automatically rename current window (usually used after 'rename current window')

##### tmux panes

- `ctrl+b "`: split current pane horizontally

- `ctrl+b %`: split current pane vertically

- `ctrl+b Arrow[up, down, left, right]`: move the direction panel

- `ctrl+b z`: zoom the current pane (最大化，最小化当前 pane)

- `ctrl+b [space]`: cycle through pane arrangements

- `ctrl+b [`: scroll in pane

#### aliases

```bash
alias ll="ls -lah"
alias gs="git status"
unalias la
```

#### dotfiles

1. create a folder for all your dotfiles and set up version control.

2. add all your configuration files into that folder. 基本思想建立对应的 config 文件，符号连接 (symlink) 文件夹中的配置文件。

3. use [dotbot](https://github.com/anishathalye/dotbot) to install dotfiles quickly.

before install, you need to configure `install.conf.yaml` to specify the ways you want to install your configurations. 

4. see more details in [piaoliangkb/dotfiles](https://github.com/piaoliangkb/dotfiles)

##### local configuration files

if configuration files support it, use includes to manage configuration files.

such as `~/.gitignore`:

```
[include]
    path = ~/.gitconfig_local
```

bash and zsh use the same alias in `~/.aliases`:

```
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
```

#### ssh

ssh with github: https://missing.csail.mit.edu/2020/command-line/#remote-machines

##### ssh+tee, scp, rsync

- `ssh + tee`:

```bash
cat localfile | ssh remote_server tee serverfile
```

- `scp` copy large amounts of files/directories:

```bash
scp path/to/localfile remote_host:path/to/remote_file
```

- `rsync` using scp and detects identical files in local and remote (检查 local 和 remote 文件是否一样), and prevent coping them.

same syntax to `scp`

##### ssh port forwarding

execute `jupyter notebook` in a remote server that listens to port `8888`

using `ssh -L 9999:localhost:8888 user@remote_host`, then navigate to  `localhost:9999` to access jupyter notebook in remote server.

- Port forwaring on StackOverflow: https://unix.stackexchange.com/questions/115897/whats-ssh-port-forwarding-and-whats-the-difference-between-ssh-local-and-remot

##### ssh config files

- local side config file `~/.ssh/config`

```
Host vm
    User foobar
    HostName 172.16.174.141
    Port 2222
    IdentityFile ~/.ssh/id_ed25519
    RemoteForward 9999 localhost:8888

# Configs can also take wildcards
Host *.mit.edu
    User foobaz
```

- server-side config file `/etc/ssh/sshd_config`

##### ssh login without passwd

```
ssh-keygen -t rsa -b 4096 -f /path/to/key

ssh-copy-id -i .ssh/id_dsa.pub foobar@remote
# or
cat .ssh/id_dsa.pub | ssh foobar@remote 'cat >> ~/.ssh/authorized_keys'
```

### 6. Version Control(Git)

#### Git data model

- bolb: a file, a bunch of bytes

- tree: a directory, maps names to bolbs or trees

- snapshot: top-level tree that is being tracked

#### Model history

In Git, a history is a **directed acyclic graph(DAG)** of snapshots.

It means that each snapshot refers to a set of parents.

#### Data Model as pseudocode

```
// a file is a bunch of bytes
type bolb = array<byte>

// a directory contains named files and directories
type tree = map<string, tree | bolb>

// a commit has parents, metadata, and the top-level tree
type commit = struct {
    parent: array<commit>
    author: string
    commit_message: string
    snapshot: tree
}
```

#### Objects are content-addressed by hash

An object is a bolb, tree, commit:

```
type object = bolb | tree | commit
```

In Git, all objects are content-addressed by `SHA-1 HASH`.

```python
objects = map<string, objects>

def store(object):
    id = sha1(object)
    objects[id] = object

def load(id):
    return objects[id]
```

#### References to hash

All snapshots can be identified by their SHA-1 hash (40 hexadecimal characters). Hard to remember.

References are human-readable names for SHA-1 hashes. Objects are immutable, references are mutable (can be updated to point to a new commit). Such as `master` points to the latest commit in the main branch.

```python
// references maps a name to object hash
references = map<string, string>

def update_reference(name, id):
    references[name] = id

def read_reference(name):
    return references[name]

def load_reference(name_or_id):
    if name_or_id is references:
        return load(references[name_or_id])
    else:
        return load(name_or_id)
```

#### Git repository

Roughly define Git repository: data `objects` and `references`

The repository was created by the command `git init --bare`:

```bash
~/m/6/remote ❯❯❯ ls
HEAD  branches/  config  description  hooks/  info/  objects/  refs/
```

#### Git command

Commands in `[]` is optional.

##### Basics

- `git init`: creates a new git repo, with data stored in `.git` directory

- `git init --bare`: `--bare` 选项只生成 `.git` 目录下的版本历史记录文件，直接放在根目录下。这个 repo 只保存历史提交的版本信息，不允许用户在上进行 git 操作。通常会把远端仓库初始化成 bare 仓库。

- `git status` 

- `git add <filename>`

- `git commit [-m <message>]`: creates a new commit with message

- `git commit -a [-m <message>]`: equals to `git add --all; git commit [-m <message>]`

- `git log`

- `git log --all --graph --decorate [--oneline]`: `--decorate` flag shows all the references(branches, tags..) that points to each commit.
 
- `git diff <filename>`: show differences to last commit, default compared last commit to `HEAD` (`git diff HEAD <filename>`)

- `git diff <revision> <filename>`: show differences between snapshots, `<revision>` can be `commit1 commit2`.

- `git diff --staged <filename>`: show diff even in staging area

- `git checkout <revision>`

##### Branch and merge

- `git branch`: shows branches

- `git branch <name>`: cerates a branch

- `git checkout -b <name>`: creates a branch and switches to it

- `git merge <revision>`: merges specific branch to current branch

- `git mergetool`: use a fancy tool to help resolve merge conflicts

- `git rebase`: https://git-scm.com/book/zh/v2/Git-%E5%88%86%E6%94%AF-%E5%8F%98%E5%9F%BA

##### Remotes

- `git remote -vv`: list remotes

- `git remote add <name> <url>`: add a remote

- `git push <remote> <local branch>:<remote branch>`: send objects to remote, and update remote reference

- `git branch --set-upstream-to=<remote>/<remote branch>`: set up correspondence between local and remote branch

- `git fetch`: retrieve objects/references from a remote (bring in changes, but donot update local branch)

    >cs196 sp20: https://www.youtube.com/watch?v=3Km0QRmin-s
    >
    >从远端仓库得到更新，但是不对当前工作有任何影响 (leaving your current work intact)。例如远端仓库有新的分支，新的分支有新的提交。可以使用 git fetch 拉取更新。

- `git pull`: same as `git fetch; git merge`

- `git clone`

##### Undo

- `git commit --amend`: edit a commit's contents/message

- `git reset HEAD <file>`: unstage a file (in stage area, after `git add`, before `git commit`)

- `git checkout -- <file>`: discard changes

- `git reset --soft HEAD^`: 撤回上一次 commit 操作，代码仍然保存在 staged area

- `git reset --hard HEAD^`：撤销 commit，撤销 git add，恢复到上一次 commit 的状态，修改的代码不保存

- `git reset --mixed HEAD^`：撤销 commit，撤销 git add，不删除工作区的代码改动，相当于 `git reset --soft HEAD^; git reset HEAD^`

    上述 `HEAD^` 等同于 `HEAD~1`. 可修改为 `HEAD~2` 表示撤回两次 commit。

- `git revert <commit-id>`：撤回到之前的一次 commit，但是是在当前 commit 的基础上添加一个新的 commit，而不是像 `git reset <commit-id>` 一样删除之前 commit 之后的所有 commit。（安全）

##### Advanced commands

- `git config`

- `git clone --shallow`: clone without entire version history

- `git add -p`: interactive staging

- `git rebase -i`: interactive rebasing

- `git blame`: show who last edited which line 

- `git stash`: temporarily remove modifications to working directory

- `git stash pop`: pop modifications

- `git bisect`: binary search history

#### Git merge example

Base on `master` branch, create two branches: `pig`, `fish`. Modified on each branch. And then checkout to `master` branch.

```bash
~/m/6/demo ❯❯❯ git log --all --graph --decorate --oneline
* a5e5d5a (pig) add pig function
| * faa7e65 (fish) add fish function
|/
* 86ff114 (HEAD -> master, origin/master) change ~
*   bfe77bf Merge branch 'dog'
|\
| * 235f4d3 (dog) add dog function
* | 884b28a (cat) add cat function
|/
* 161b00a add animal.py
* 4f8a505 another change
* 30876db add hello.txt
```

First merge `fish` branch.

```bash
~/m/6/demo ❯❯❯ git merge fish
Updating 86ff114..faa7e65
Fast-forward
 animal.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
```

This is fast-forward merge, works well. Now `HEAD` points to `fish`.

```bash
~/m/6/demo ❯❯❯ git log --all --graph --decorate --oneline
* a5e5d5a (pig) add pig function
| * faa7e65 (HEAD -> master, fish) add fish function
|/
* 86ff114 (origin/master) change ~
*   bfe77bf Merge branch 'dog'
|\
| * 235f4d3 (dog) add dog function
* | 884b28a (cat) add cat function
|/
* 161b00a add animal.py
* 4f8a505 another change
* 30876db add hello.txt
```

Next merge `pig` branch.

```bash
~/m/6/demo ❯❯❯ git merge pig
Auto-merging animal.py
CONFLICT (content): Merge conflict in animal.py
Automatic merge failed; fix conflicts and then commit the result.
```

Fix conflicts in `animal.py`. Then add what you fix in the staging area:

```
~/m/6/demo ❯❯❯ git add animal.py
```

Use `git merge --continue` and then add a message to finish the merge. Or you can use `git commit` by yourself to finish the merge.

Now print git log:

```
~/m/6/demo ❯❯❯ git log --all --graph --decorate --oneline
*   47d1381 (HEAD -> master) Merge branch 'pig'
|\
| * a5e5d5a (pig) add pig function
* | faa7e65 (origin/master, fish) add fish function
|/
* 86ff114 change ~
*   bfe77bf Merge branch 'dog'
|\
| * 235f4d3 (dog) add dog function
* | 884b28a (cat) add cat function
|/
* 161b00a add animal.py
* 4f8a505 another change
* 30876db add hello.txt
```

If you have a remote repository, use `git push` to set remote `origin/master` points to `HEAD`.

```
~/m/6/demo ❯❯❯ git push
Counting objects: 6, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (6/6), done.
Writing objects: 100% (6/6), 653 bytes | 217.00 KiB/s, done.
Total 6 (delta 2), reused 0 (delta 0)
To ../remote/
   faa7e65..47d1381  master -> master
~/m/6/demo ❯❯❯ git log --all --graph --decorate --oneline
*   47d1381 (HEAD -> master, origin/master) Merge branch 'pig'
|\
| * a5e5d5a (pig) add pig function
* | faa7e65 (fish) add fish function
|/
* 86ff114 change ~
*   bfe77bf Merge branch 'dog'
|\
| * 235f4d3 (dog) add dog function
* | 884b28a (cat) add cat function
|/
* 161b00a add animal.py
* 4f8a505 another change
* 30876db add hello.txt
```

#### A note about git commit message

https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html

#### Remove sensitive data from a git repo

https://help.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository

### 7. Debugging profiling

So many tools for debugging, logging, static analysis, code linters, code formatting, profiling, ...

https://missing.csail.mit.edu/2020/debugging-profiling/

#### logger, journalctl, lnav

- `logger` can make logs to system logs

- `lnav`: better presentation for log files than journalctl

```bash
logger "Hello, logs"

journalctl --since "1m ago" | grep Hello
```

#### Debuggers

Python codes can use `pdb` or `ipdb3`. [pdb tutorial](https://github.com/spiside/pdb-tutorial) [realpython Python Debugging With Pdb](https://realpython.com/python-debugging-pdb/)

C/C++ can use `gdb`, `lldb`.

#### Static analysis

[Awesome static analysis](https://github.com/mre/awesome-static-analysis)

- `pyflakes`, `mypy`: python static analysis tools

- `shellcheck`: for shell scripts

- `ale`, `syntastic`: vim plugins for static analysis

- `black` for Python, `gofmt` for Go, `rustfmt` for Rust: code formatters

#### time

- Python `time` module:

```python
import time, random

n = random.randint(1, 10) * 100
start = time.time()

print(f"Sleeping for {n} ms")
time.sleep(n/1000)

print(time.time() - start)
```

Output is:

```
# Output
# Sleeping for 500 ms
# 0.5713930130004883
```

- `time` command

```bash
$ time curl https://missing.csail.mit.edu &> /dev/null

real    0m6.595s
user    0m0.016s
sys     0m0.125s
```

#### CPU

- `cProfile` module to profile time **per function call**

- [`line_profiler`](https://github.com/rkern/line_profiler): shows time taken per line 

```bashk
~/m/7_debugging_profiling ❯❯❯ kernprof -l -v urls.py
Wrote profile results to urls.py.lprof
Timer unit: 1e-06 s

Total time: 2.6711 s
File: urls.py
Function: get_urls at line 7

Line #      Hits         Time  Per Hit   % Time  Line Contents
==============================================================
     7                                           @profile
     8                                           def get_urls():
     9         1    2658770.0 2658770.0     99.5      response = requests.get('https://missing.csail.mit.edu')
    10         1      10999.0  10999.0      0.4      s = BeautifulSoup(response.content, 'lxml')
    11         1          4.0      4.0      0.0      urls = []
    12        32       1185.0     37.0      0.0      for url in s.find_all('a'):       13        31        146.0      4.7      0.0          urls.append(url['href'])  
```

#### Memory

- `Valgrind`: C/C++ memory leaks

- `memory_profiler`: python memory module `python3 -m memory_profiler example.py`

#### Visualization

- [`pycallgraph`](http://pycallgraph.slowchop.com/en/master/): python module for create call graph visualizations for python applications

#### Resource Monitoring

- `htop`, `glances`, `dstat`: general monitoring

- `iotop`: I/O usage, process I/O operations

- `df`: displays metrics(度量，指标) per partitions

- `du`: displays dis usage per file for current directory

- `ncdu`: more interactive of `du`, can navigate folders

- `free`: displays total amount of free and used memory in this system, usually use `free -h`

- `lsof`: list file information about files opened by processes. `lsof -i:port`

- `nethogs`, `iftop`: interactive CLI tools for monitoring network usage

- `hyperfine`: benchmark command line programs, such as `fd` and `find` 

```bash
$ hyperfine --warmup 3 'fd -e jpg' 'find . -iname "*.jpg"'
```

### 8. Metaprogramming

This metaprogramming is not what we said "programs that operate on programs", it's about the process of **building and testing your code, managing dependencies, continuous integration systems**.

#### Building systems

- `make` canbe find in any UNIX-based computer. It consults a file called `Makefile` in the current directory.

A simple one `Makefile` looks like, note that the 2nd line in Makefile starts with a `tab`:

```makefile
paper.pdf: paper.tex plot-data.png
        pdflatex paper.tex

plot-%.png: %.dat plot.py
        ./plot.py -i $*.dat -o $@
```

This file is a rule for how to produce the left-hand side like `paper.pdf` using the right-hand side like `paper.tex plot-data.png`

The first directive also defines the default goal. Run `make` with no args, default goal is the target it will built. This means that you can run `make plot-data.png` command.

#### Continuous integration (CI)

Such as Github Pages: every push to `master` will build a site available on a particular Github domain.

#### Different kinds of testing

- Test suite: a collective term for all the tests

- Unit test: a micro-test that tests a specific feature in isolation

- Integration test: a micro-test that runs a larger part of the system to check that different feature or components work together

- Regresstion test: a test that previously caused bug. ensure the bug does not resurface (re occur)

- Mocking: mock the network, disk...

### 9. Security and Cryptography

>cryptography [krɪpˈtɒɡrəfi]

#### Hash functions

`hash(value: array<byte>) -> vector<byte, N>`

A hash function maps data of arbitrary size of bytes to a fixed size of bytes.

Git use `SHA1`, which maps arbitrary sized inputs to 160-bit outputs(40 hexadecimal numbers). An example of `SHA1`:

```bash
~ ❯❯❯ printf "hello" | shasum
aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d  -
```

>`shasum` on macos is `sha1sum` on linux

Properties of hash functions:

- Deterministic (确定性): same input, same output

- Non-invertible (不可逆): for some desired output `h`, hard to find an input `m` that `hash(m) = h`

- Collision (冲突) resistant (抵抗，有抵抗力的): hard to find 2 inputs `m_1` and `m_2` such that `hash(m_1) = hash(m_2)`

>SHA-1 is no longer considered a strong cryptographic hash function. 
>
>https://shattered.io/
>

hash function lifetimes: https://valerieaurora.org/hash.html

<img src="https://t6hr3w.dm.files.1drv.com/y4mcvRUpYPlfXddHF1_ilcGNqAifMYKX1xezQTWj7iar-T5HQDUQOzVMtokYf7bvhXUJRVlO9dYLMbzJ4H0qmw0zH-l61gFSRSFbp5KO2DAg_ZcOW9AUqQQrQnd6et4S3A1GEH5rporlyO0-d37_nyIz0NO4279YPLlY_8ozlUyD78na1QfFTAF21QEEBOfd3WB18R2dWysAPdb5cBUYwu3ZA?width=3056&height=1078&cropmode=none" />

##### Applications of hash function

- Git 

- A short summary of the contents of a file. When downloading a file, use hash to check is it from origin creator. (Linux ISOs)

- Commitment schemes(承诺方案): If you want to commit a **particular value**, but reveal the value itself later. If choose value `r`, then share `sha256(r)` with others. After all, you can reveal your valur `r` by check `sha256(r)` by others.

    > 向不信任的对方提交某个特定值，但是之后再揭露该值。可以先提交 hash function 之后的结果。之后要向对方揭露该值的时候，告诉对方实际的值和哈希函数，让对方去检验是否和之前提交的值一致。

#### Key derivation functions (KDFs)

Also produce fixed-length output as hash funtions.

Deliberately (故意的) slow, in order wo slow down offline brute-force attacks.

> 通常，KDF 速度都估计设计的比较慢，为此来降低暴力破解的速度。例如暴力破解密码。

##### Applications of KDFs

- Producing keys from passphrases for use.

- Storing login credentials. (保存登陆凭证) Generate a random salt `salt = random()` for each use, store `KDF(password + salt)`, verify login attempts by recomputing the KDF given the entered password and the stored salt.

    >给每个用户设置一个随机的 salt，当用户输入密码时，使用 KDF 和在后台存储的 salt 计算用户输入的密码是否正确。这样攻击者即使获得了密码，也没法知道密码的实际内容。

#### Symmetric cryptography

>对称加密

```
keygen() -> key 

encrypt(plaintext: array<byte>, key)  -> array<byte> (produce cyphertext)
decrypt(ciphertext: array<byte>, key) -> array<byte> (plaintext)
```

Wide use: AES. (such as AES-256-CFB)

##### Applications of symmetric cryptography

- Encrypting files for storage in an untrusted cloud service. Combine with KDFs. `key = KDF(passphrase)`, `encrypt(file, key)`. An example using `openssl` and `aes-256-cbc`:

    ```bash
    # encrypt README.md 
    🅸 [11:32] ~/D/m/9_security_cryptography (master) ❯❯❯ openssl aes-256-cbc -salt -in README.md -out README.enc.md
    enter aes-256-cbc encryption password:
    Verifying - enter aes-256-cbc encryption password:

    # generate a encrypted file README.enc.md
    🅸 [11:32] ~/D/m/9_security_cryptography (master) ❯❯❯ exa
    README.enc.md  README.md

    # decrypt README.enc.md
    🅸 [11:33] ~/D/m/9_security_cryptography (master) ❯❯❯ openssl aes-256-cbc -d -in README.enc.md -out README.dec.md
    enter aes-256-cbc decryption password:

    # generate a decrypted file README.dec.md
    🅸 [11:33] ~/D/m/9_security_cryptography (master) ❯❯❯ exa
    README.dec.md  README.enc.md  README.md
    ```

#### Asymmetric cryptography

Private key and public key.

```
keygen() -> (public key, private key)

# application 1
encrypt(plaintext: array<byte>, public key)   -> array<byte> (ciphertext)
decrypt(ciphertext: array<byte>, private key) -> array<byte> (plaintext)

# application 2
sign(message: array<byte>, private key) -> array<byte> (the signature)
verify(message: array<byte>, signature: array<byte>, public key) -> bool (whether or not the signature is valid)
```

##### Applications of asymmetric cryptography

- PGP email encryption. People posted their public keys online. Anyone can send them encrypted email.

- Private mesasging. (telegram, signal)

- Signing software. Git can have GPG-signed commits and tags. With a posted key, anyone can verify the authenticity of downloaded software.

##### Key distribution

How do you know the public key you found on the internet is my public key?

> 如何确定网上发布的公钥是正确的？

Big challenge of distributing public keys / mapping public keys to real-world identities. Solutions:

- Signal: trust on first use, supporting out-of-band public key exchange. (例如：我们课下交换我们的 public key!!)

- PGP: [web of trust](https://en.wikipedia.org/wiki/Web_of_trust). I trust people who my friend trust. Chain of trust.

    >From wikipedia:
    >
    >As time goes on, you will accumulate keys from other people that you may want to designate as trusted introducers. Everyone else will each choose their own trusted introducers. And everyone will gradually accumulate and distribute with their key a collection of certifying signatures from other people, with the expectation that anyone receiving it will trust at least one or two of the signatures. This will cause the emergence of a decentralized fault-tolerant web of confidence for all public keys.

- Keybase: social proof. You have your friends on facebook, twitter. It's hard for attacker to break into your friend facebook account at the same time their twitter account. Binding you public keys to a set of social identities, you can retrieve a public key once you trust some number of social identities corresponding to your friend.

### 10. Potpourri

https://missing.csail.mit.edu/2020/potpourri/

This course is about keyboard remapping, daemons, FUSE (Filesystem in User Space), backups, apis, command-line flags, window manager, vpns, markdown, hammerspoon (desktop-automation-on-macos), boot & live USBs, docker & vagrant & vms & cloud & openstack, notebooks, github.

#### Keyboard remapping

Some examples:

- Swapping Ctrl and the Meta (Windows or Command) key.

Or use some commands for specific functions: 

- Open a terminal or browser window.

- Inserting some specific text.

- Sleeping the computer or the displays.

- Remapping sequences of keys, e.g. pressing shift five times toggles CapsLock.

- Remapping on tap vs on hold, e.g. CapsLock is remapping to Esc if you quickly tap it, but remapped to Ctrl if you hold.

Software tools for remapping:

- macOS: karabiner-elements, skhd or BetterTouchTool

- Linux: xmodmap or Autokey 

- Windows: Builtin in Control Panel, AutoHotkey or SharpKeys  

- QMK: configure hardware device

#### Daemons

`systemd` is system daemon. You can use `systemctl [status, enable, disable, start, stop, restart]`

A systemd confige file example:

```ini
# /etc/systemd/system/myapp.service
[Unit]
Description=My Custom App
After=network.target

[Service]
User=foo
Group=foo
WorkingDirectory=/home/foo/projects/mydaemon
ExecStart=/usr/bin/local/python3.7 app.py
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

#### FUSE

FUSE is Filesystem in User Space, implemented by a user program. FUSE let users run user space code for filesystem calls and then bridges the necessary calls to the kernel interfaces.

Some examples for FUSE filesystems:

- [sshfs](https://github.com/libfuse/sshfs): Open locally remote files/folder through an SSH connection.

- [rclone](https://rclone.org/commands/rclone_mount/): Mount cloud storage services like Dropbox, Goole Drive, Amazon S3 or Google Cloud Storege and open data locally.

- GmailFS, HDFS, etc.

#### Backups

Synchronization solutions are not backups. Because when data is erased or corrupted they propagate the change. For the same reason, disk mirroring solutions like RAID are not backups.

Good backups solutions are versioning, deduplication(两分，劈分开), and security.

#### APIs

Usually you can use `curl` command to access some apis. And the response is usually formatted as JSON.

[jq](https://stedolan.github.io/jq/) is a lightweight command-line JSON processor.

[IFTTT (If This Then That)](https://ifttt.com/) lets you chain events from them in nearly arbitrary ways.

#### Command-line flags/patterns

- `--version` or `-V` to print version info.

- `--verbose` or `-v` or `-vvv` to proces more verbose (冗长的，啰嗦的) output.

```bash
~ ❯❯❯ python3 -V
Python 3.6.7
~ ❯❯❯ python3 -VV
Python 3.6.7 (default, Oct 22 2018, 11:32:17)
[GCC 8.2.0]
~ ❯❯❯ python3 -VVV
Python 3.6.7 (default, Oct 22 2018, 11:32:17)
[GCC 8.2.0]
```

- `-` in place of a filename means "standard input" or "standard putput"

- Sometimes, you want to pass something looks like a flag as a normal argument. The spacial argument `--` makes a program stop processing flags and options **in what follows**.

```bash
# remove file named "-r"
$ rm -- -r
```

#### VPNs

A VPN is just a way for you to **change your internet service provider**. When you use a VPN, all you are really doing is shifting your trust from your current ISP to the VPN hosting company.

Examples: WireGuard

#### Hammerspoon (desktop autpmation on macOS)

https://www.hammerspoon.org/

Some examples of things you can do with Hammerspoon:

- Bind hotkeys to move windows to specific locations

- Create a menu bar button that automatically lays out windows in a specific layout

- Mute your speaker when you arrive in lab (by detecting the WiFi network)

#### Notebook programming

- Jupyter

- Wolfram Mathematica: for math-oriented programming

### 11. Q&A

#### Difference between `source script.sh` and `./script.sh`

- `source script.sh` command are executed in **current bash session**, so any change will make to the current environment. Such like changing directories or defining functions will persist in the current session.

- `./script` will let your current bash session **creates a new instance** of bash that will run the commands in `script.sh`. After executing commands in this script, parent bash session will remain in the same place.

#### Filesystem hierarchy standard

See wiki https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard

- `/bin` essential command binaries

- `/sbin` essential system binaries, usually run by root(superuse bin)

- `/dev` device files

- `/etc` host-specific system-wide configuration files

- `/lib` common libraries for system programs

- `/opt` optional application software

- `/sys` information and configuration for the system

- `/tmp` or `/var/tmp` temporary files

- `/usr/` read only user data

    - `/usr/bin` non-essential command binaries

    - `/usr/sbin` non-essential system binaries

    - `/usr/local/bin` binaries for user **compiled** 

- `/var` variable files like **logs and caches**

#### System package manager vs language package manager

Such like `apt` and `pip`.

- Less popular ones or more recent ones might not be a avaliable in you system package manager.

- Installed libraries using system package manager are **system wide**, different versions for development might not suffice. Language specific manager provide isolate and virtual environment.

- On specific hardware or systems, packages might come with binaries, need to be compiled. If the former comes in from of binaries and later needs to be compiled, choose former one. 如果系统的包管理器可以直接安装二进制文件，而通过语言的包管理器需要编译，那么选择系统的包管理器比较好。

#### More vim tips

https://missing.csail.mit.edu/2020/qa/#any-more-vim-tips

- `ctrl + O` and `ctrl + I` can move backward and forward through your recently visited locations.

- `d/<pattern>` will delete to the next match of said pattern. `cgn/<pattern>` will change the next occurrence of the last searche.

- Undo tree and persistent undo.

- Leader Key

**Added myself**

- 多行批量操作：

>ref: https://github.com/hokein/Wiki/wiki/Vim-%E6%89%B9%E9%87%8F%E6%93%8D%E4%BD%9C

可以使用 `ctrl + v` 进入 visual block 模式，之后输入 `shift + i` 或者 `shift + a` 进行多行操作。

一个替换的方法是：首先对第一行进行操作，随后使用 `shift + v` 选中其他行，输入 `:` 进入命令模式，之后输入 `normal .` 即可对选中行复制第一行的操作。

- 在每一行的结尾添加内容：

使用 `ctrl + v` 进行 visual block 模式，之后输入 `$`，将选择区域扩展到每一行的结尾。之后可以使用 `shift + a` 来向每一行的结尾添加内容。

相同方式，可以进入 visual block 模式之后，使用 `^` 或者 `0` 将选择区域扩展到句头或者每一行的起始位置，使用 `shift + i` 来进行批量添加。

- vim 中打开终端：

输入 `:terminal` （可自动补全）可以在 vim 中打开终端，无需退出 vim。

- 取消搜索高亮：

在某个单次上使用 `*` 操作或者输入 `/ + word` 可以搜索单词并让对应部分高亮。可以使用 `:noh` 来取消高亮。

- How to Do 90% of What Plugins Do (With Just Vim)

Youtube link: https://www.youtube.com/watch?v=XA2WjJbmmoM
