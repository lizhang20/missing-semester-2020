
>https://missing.csail.mit.edu/2020/shell-tools/

## 1. ls

- includes all files, including hidden files

`ls -la`

```bash
zl@LAPTOP-ZL ~/m/2/exercises> ls -la
total 0
drwxrwxrwx 1 zl zl 4096 Feb 10 12:40 ./
drwxrwxrwx 1 zl zl 4096 Feb 10 01:39 ../
-rw-rw-rw- 1 zl zl  152 Feb 10 12:47 solutions.md
```

- Sizes are listed in human readable format (e.g. 454M instead of 454279954)

`ls -lh`

```bash
zl@LAPTOP-ZL ~/m/2/exercises> ls -lah
total 0
drwxrwxrwx 1 zl zl 4.0K Feb 10 12:40 ./
drwxrwxrwx 1 zl zl 4.0K Feb 10 01:39 ../
-rw-rw-rw- 1 zl zl  342 Feb 10 12:48 solutions.md
```

- Files are ordered by recency

`ls -lt`: sort by modification time, newest first

```bash
zl@LAPTOP-ZL ~/m/2/exercises> ls -lat
total 4
-rw-rw-rw- 1 zl zl  723 Feb 10 12:54 solutions.md
drwxrwxrwx 1 zl zl 4096 Feb 10 12:40 ./
drwxrwxrwx 1 zl zl 4096 Feb 10 01:39 ../
```

extra: 

`ls -r`: reverse the order

`ls -tr`: sort by modification time, oldest first

- output is colorized

`ls --color=auto`

总结最后的命令是：`ls -laht --color=auto`

输出：

```bash
zl@LAPTOP-ZL ~/j/j/tutorial01> ls -laht --color=auto
total 44K
drwxrwxrwx 1 zl zl 4.0K Feb  9 01:11 ./
-rwxrwxrwx 1 zl zl 8.6K Jan 21 12:18 a.out*
-rw-rw-rw- 1 zl zl  207 Jan 21 12:18 tempCodeRunnerFile.cpp
-rw-rw-rw- 1 zl zl 2.5K Jan  4 23:38 test.c
drwxrwxrwx 1 zl zl 4.0K Jan  4 23:26 build/
-rw-rw-rw- 1 zl zl 2.3K Jan  4 23:26 leptjson.c
-rw-rw-rw- 1 zl zl  781 Jan  4 21:28 leptjson.h
drwxrwxrwx 1 zl zl 4.0K Jan  4 20:13 .vscode/
drwxrwxrwx 1 zl zl 4.0K Nov 24 21:48 ../
-rw-rw-rw- 1 zl zl  18K Nov 24 21:48 tutorial01.md
drwxrwxrwx 1 zl zl 4.0K Nov 24 21:48 images/
-rw-rw-rw- 1 zl zl  298 Nov 24 21:48 CMakeLists.txt
```

## 2. macro & polo

Write bash functions marco and polo that do the following. Whenever you execute marco the current working directory should be saved in some manner, then when you execute polo, no matter what directory you are in, polo should cd you back to the directory where you executed marco. For ease of debugging you can write the code in a file marco.sh and (re)load the definitions to your shell by executing source marco.sh.

see in `marco.sh`, `polo.sh`

```bash
$ source marco.sh 
$ source polo.sh
$ 
$ marco
I am in directory /home/zl/missing_semester/2_shell_tools/exercises

$ polo
Before I am in directory /home/zl
Now I am in directory /home/zl/missing_semester/2_shell_tools/exercises
```

## 3. one script run another script depends one its return value

`failure-check.sh` run `failure.sh`

logs in `run.log` and `error.log`

## 4. 递归的查找文件夹中的所有 html 文件并将它们打包

pipe 操作符可以将 STDOUT 和 STDIN 连接起来。

对于 tar 命令来说，它只能接受参数作为输入。为了使用 STDIN 作为输入，可以使用 xargs 来连接相应的命令，例如：

若使用管道来连接，提示 missing operand

```bash
zl@LAPTOP-ZL ~/m/2/test> ls project1 | rm
rm: missing operand
Try 'rm --help' for more information.
```

使用 xargs

```bash
zl@LAPTOP-ZL ~/m/2/t/project1> ls | xargs rm
zl@LAPTOP-ZL ~/m/2/t/project1> ls
# empty here
```

解决本题：

1. 首先创建环境

```bash
zl@LAPTOP-ZL ~/m/2/e/ex4_html> ls -R
.:
folder1/  folder2/  folder3/  folder4/  folder5/  folder6/  folder7/

./folder1:
1.html foo1 foo2 foo3

./folder2:
2.html

./folder3:
3.html

./folder4:
4.html

./folder5:
5.html

./folder6:
6.html

./folder7:
7.html
```

2. 搜索所有的 html 文件

```bash
zl@LAPTOP-ZL ~/m/2/exercises> find ex4_html/ -name "*.html"
ex4_html/folder1/1.html
ex4_html/folder2/2.html
ex4_html/folder3/3.html
ex4_html/folder4/4.html
ex4_html/folder5/5.html
ex4_html/folder6/6.html
ex4_html/folder7/7.html
```

3. 搜索 tar 指令

压缩指令：

`tar -czf {{target.tar.gz}} {{file1 file2 file3}}`

解压指令：

`tar -xzf {{target.tar.gz}} -C {{directory}}`

4. 将搜索指令和压缩指令使用 xargs 结合起来

- On Linux

  其中 xargs 指令的 -d 标志位表示使用 "\n" 作为文件的 split 标志。

  ```bash
  zl@LAPTOP-ZL ~/m/2/exercises> 
  find ex4_html/ -name "*.html" | xargs -d "\n" tar -czf html.tar.gz
  ```

- On MacOS
  
  ```bash
  find ex4_html/ -name "*.html" -print0 | xargs -0 tar -czf html.tar.gz
  ```
  
将生成的压缩包解压到 `extract/` 文件夹进行检查：

```bash
zl@LAPTOP-ZL ~/m/2/exercises> tar -xzf html.tar.gz -C extract
zl@LAPTOP-ZL ~/m/2/exercises> ls -R extract/
extract/:
ex4_html/

extract/ex4_html:
folder1/  folder2/  folder3/  folder4/  folder5/  folder6/  folder7/

extract/ex4_html/folder1:
1.html

extract/ex4_html/folder2:
2.html

extract/ex4_html/folder3:
3.html

extract/ex4_html/folder4:
4.html

extract/ex4_html/folder5:
5.html

extract/ex4_html/folder6:
6.html

extract/ex4_html/folder7:
7.html
```

## 5. (Advanced) Write a command or script to recursively find the most recently modified file in a directory. More generally, can you list all files by recency?

1. find all the files

`find . -type f`

2. list all the file in order to the modificated time 

`find . -type f | xargs ls -lt`

```bash
zl@LAPTOP-ZL ~/m/2/exercises> find . -type f | xargs -d "\n" ls -lt
-rw-rw-rw- 1 zl zl  4798 Feb 10 15:52 ./solutions.md
-rw-rw-rw- 1 zl zl   203 Feb 10 15:35 ./html.tar.gz
-rw-rw-rw- 1 zl zl     0 Feb 10 15:34 ./ex4_html/folder1/foo3
-rw-rw-rw- 1 zl zl     0 Feb 10 15:34 ./ex4_html/folder1/foo1
-rw-rw-rw- 1 zl zl     0 Feb 10 15:34 ./ex4_html/folder1/foo2
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./ex4_html/folder7/7.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./extract/ex4_html/folder7/7.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./ex4_html/folder6/6.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./extract/ex4_html/folder6/6.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./ex4_html/folder5/5.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./extract/ex4_html/folder5/5.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./ex4_html/folder4/4.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./extract/ex4_html/folder4/4.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./ex4_html/folder3/3.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./extract/ex4_html/folder3/3.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./ex4_html/folder2/2.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./extract/ex4_html/folder2/2.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./ex4_html/folder1/1.html
-rw-rw-rw- 1 zl zl     0 Feb 10 15:11 ./extract/ex4_html/folder1/1.html
-rwxrw-rw- 1 zl zl   205 Feb 10 14:51 ./failure-check.sh
-rw-rw-rw- 1 zl zl   102 Feb 10 14:49 ./error.log
-rw-rw-rw- 1 zl zl 16757 Feb 10 14:49 ./run.log
-rwxrw-rw- 1 zl zl   201 Feb 10 13:35 ./failure.sh
-rw-rw-rw- 1 zl zl   126 Feb 10 13:26 ./polo.sh
-rw-rw-rw- 1 zl zl    75 Feb 10 13:23 ./marco.sh
```

3. get the first line 

`find . -type f | xargs -d "\n" ls -lt | head -n 1`

 ```bash
zl@LAPTOP-ZL ~/m/2/exercises> find . -type f | xargs ls -lt | head -n 1
-rw-rw-rw- 1 zl zl  4798 Feb 10 15:52 ./solutions.md
 ```
