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

#### ctrl + L

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

#### > >>重定向输出

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

配合 grep 使用：

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

#### sudo echo 500 > beightness

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

><(...) is called process substitution. It converts the output of a command into a file-like object that diff can read from.
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

- normal: moving around a file

- insert (`i`): inserting text 

- replace (`R`): replacing text

- visual (plain `v`, line `V`, block `ctrl+v`): selecting blocks of text()

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

- Search: `/{regex}`, `n`/`N` for navigating matches. 搜索结束之后输入 `enter` 转入到第一个结果位置，之后输入 `n` 跳转到下一个结果位置。

- Misc: `%` find the coresponding item (找到相应的项，例如两个括号之间进行跳转)

#### selection in visual mode

- Visual: `v`

- Visual line: `V`

- Visual block: `ctrl + v`

#### edit commands

- `i` insert at now cursor

- `a` append at end

- `o / O` insert line down (below), up (above)

- `d{motion}` delete {motion}. such as `dd` delete this line, `d$` delete to end of line, `d0` delete to begin of line, `dw` delete word, `dG` delete to end of file, `dl` delete right character

- `c{motion}` change {motion}. `cw` change word etc.

- `x` delete charcter (equals to `dl`)

- `s` delete character and start insert (substitute) (equals to `xi`)

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

将插件放在目录 `!/.vim/pack/vendor/start/` 下（可以使用 git clone 命令）

[Awesome Vim](https://vimawesome.com/)

https://missing.csail.mit.edu/2020/editors/

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

- command s, q: 替换多次匹配的内容 `sed 's/REGEX/SUBSTITUTION/g'` 

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

- `ctrl+b d`: dettaches the current session (sometimes can use `control+d`)

- `ctrl+b c`: create a new tmux window 

- `ctrl+b p`: go to the previous window

- `ctrl+b n`: go to the next window

- `ctrl+b [N]`: go to the Nth window

- `ctrl+b ,`: rename the current window

- `ctrl+b w`: list current windows

- `ctrl+b x`: kill session when attached

##### tmux panes

- `ctrl+b "`: split current pane horizontally

- `ctrl+b %`: split current pane certically

- `ctrl+b Arrow[up, down, left, right]`: move the the direction panel

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

ssh with github: https://missing.csail.mit.edu/2020/command-line/

ssh 

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

execute `jupyter notebook` in remote server that listens to port `8888`

using `ssh -L 9999:localhost:8888 user@remote_host`, then navigate to  `localhost:9999` to access jupyter notebook in remote server.

- Port forwaring on stackoverflow: https://unix.stackexchange.com/questions/115897/whats-ssh-port-forwarding-and-whats-the-difference-between-ssh-local-and-remot

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

- server side config file `/etc/ssh/sshd_config`

### 6. Version Control(Git)

#### Git data model

- bolb: a file, a bunch of bytes

- tree: a directory, maps names to bolbs or trees

- snapshot: top-level tree that is being tracked

#### Model history

In Git, a history is a **directed acyclic graph(DAG)** of snapshots.

It means that each snapshots refers to a set of parents.

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

```pythonk
objects = map<string, objects>

def store(object):
    id = sha1(object)
    objects[id] = object

def load(id):
    return objects[id]
```

#### References to hash

All snapshots can be identified by their SHA-1 hash (40 hexdecimal characters). Hard to remember.

References is a human-readable names for SHA-1 hashes. Objects are immutable, references are mutable (can be updated to point to a new commit). Such as `master` points to the latest commit in the main branch.

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

The repostory that created by command `git init --bare`:

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

- `git fetch`: retrive objects/references from a remote

- `git pull`: same as `git fetch; git merge`

- `git clone`

##### Undo

- `git commit --amend`: edit a commit's contents/message

- `git reset HEAD <file>`: unstage a file (in stage area, after `git add`, before `git commit`)

- `git checkout -- <file>`: discard changes

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

Fix confilicts in `animal.py`. Then add what you fix in staging area:

```
~/m/6/demo ❯❯❯ git add animal.py
```

Use `git merge --continue` and then add message to finish merge. Or you can use `git commit` by yourself to finish merge.

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

### 6. Debugging profiling

So many tools for debugging, logging, static analysis, code linters, code formatters, profiling...

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

### 7. Metaprogramming

