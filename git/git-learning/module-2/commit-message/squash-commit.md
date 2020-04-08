# 多个 commit 整理成 1 个 commit

## 连续的多个 commit 整理成 1 个 commit

### 使用 `git rebase -i <需变基中最早的 commit 的父 commit> 命令`

#### 修改之前的版本历史

```shell
* commit 6d74d5225a4d3ee5524e55179317d9cbc87d733e (HEAD -> master)
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:52:51 2020 +0800
|
|     move filename readme to readme.md
|
* commit c934c44cef231453769e6e38dbaf780851ac245e
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:51:32 2020 +0800
|
|     add refering projects
|
* commit f9c0ea59ab0caac8c8f537335902ab63efed3e24
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:50:05 2020 +0800
|
|     add js
|
* commit 53842bad03861399ccf638835caddffe0a128551
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:49:25 2020 +0800
|
|     add style.css
|
* commit b022b8b7783d764b8271a55bc2c82229873b24c1
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:47:33 2020 +0800
|
|     add index + logo
|
* commit f812eac14f2b320f7fbaefd9d15cf7b79d4ff1a7
  Author: monsterhxw <770342643@qq.com>
  Date:   Wed Apr 8 21:46:35 2020 +0800

```

#### 根据上面代码块，我们现在的需求是将连续的 `b022b8b`, `53842ba`, `f9c0ea5`, `c934c44` commits 整理成 1 个 commit

#### 修改 53842ba，f9c0ea5 为 squash

```shell
git rebase -i f812eac14f
pick b022b8b add index + logo
squash 53842ba add style.css
squash f9c0ea5 add js
squash c934c44 add refering projects
pick 6d74d52 move filename readme to readme.md

# Rebase f812eac..6d74d52 onto f812eac (5 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
#       However, if you remove everything, the rebase will be aborted.
#
#
# Note that empty commits are commented out
```

#### wq 之后

```shell
# This is a combination of 4 commits.
# This is the 1st commit message:

add index + logo

# This is the commit message #1:

add style.css

# This is the commit message #2:

add js

# This is the commit message #3:

add refering projects

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Wed Apr 8 21:47:33 2020 +0800
#
# interactive rebase in progress; onto f812eac
# Last commands done (4 commands done):
#    squash f9c0ea5 add js
#    squash c934c44 add refering projects
# Next command to do (1 remaining command):
#    pick 6d74d52 move filename readme to readme.md
# You are currently rebasing branch 'master' on 'f812eac'.
#
# Changes to be committed:
#       new file:   index.html
#       new file:   js/js.js
#       new file:   styles/style.css
#
```

## wq 之后

```shell
[detached HEAD 36303d8] create a comlpete web page
 Date: Wed Apr 8 21:47:33 2020 +0800
 3 files changed, 5 insertions(+)
 create mode 100644 index.html
 create mode 100644 js/js.js
 create mode 100644 styles/style.css
Successfully rebased and updated refs/heads/master.
```

#### 修改之后的版本历史

```shell
* commit 6e46b7d440165f0f7fb044eaa3e84a19c0d08d20 (HEAD -> master)
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:52:51 2020 +0800
|
|     move filename readme to readme.md
|
* commit 36303d85ff3c89717017c5a8d4ab2a2c6ba80b0d
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:47:33 2020 +0800
|
|     create a comlpete web page
|
|     add index + logo
|
|     add style.css
|
|     add js
|
|     add refering projects
|
* commit f812eac14f2b320f7fbaefd9d15cf7b79d4ff1a7
  Author: monsterhxw <770342643@qq.com>
  Date:   Wed Apr 8 21:46:35 2020 +0800

      add readme
```

## 间隔的多个 commit 整理成 1 个 commit

### 使用 `git rebase -i <需变基中最早的 commit 的父 commit> 命令`，进入 rebase 交互界面，然后将需要间隔开的 commit 挑选放在一起

#### 修改之前的版本历史

```shell
* commit 6e46b7d440165f0f7fb044eaa3e84a19c0d08d20 (HEAD -> master)
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:52:51 2020 +0800
|
|     move filename readme to readme.md
|
* commit 36303d85ff3c89717017c5a8d4ab2a2c6ba80b0d
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:47:33 2020 +0800
|
|     create a comlpete web page
|
|     add index + logo
|
|     add style.css
|
|     add js
|
|     add refering projects
|
* commit f812eac14f2b320f7fbaefd9d15cf7b79d4ff1a7
  Author: monsterhxw <770342643@qq.com>
  Date:   Wed Apr 8 21:46:35 2020 +0800

      add readme
```

#### 根据上面代码块，我们现在的需求是将间隔的 `f812eac`, `6e46b7d`, commits 整理成 1 个 commit

#### 因为 `f812eac` 是最早的祖先，它已经没有了祖先，所以这里需要使用一个小技巧，就是在 `rebase` 的`交互界面`上`手动在第一行添加 pick f812eac`的操作

#### 然后将间隔的 `f812eac`, `6e46b7d` commit 放在一起

```shell
pick f812eac
squash 36303d8 create a comlpete web page
pick 6e46b7d move filename readme to readme.md
```

#### 详情修改如下

```shell
git rebase -i f812eac
## 在第一行添加 pick f812eac
## 将间隔的 `f812eac`, `6e46b7d` commit 放在一起
pick f812eac
squash 6e46b7d move filename readme to readme.md
pick 36303d8 create a comlpete web page

# Rebase f812eac..6e46b7d onto f812eac (2 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
#       However, if you remove everything, the rebase will be aborted.
#
#
# Note that empty commits are commented out
```

#### wq 之后，因为 f812eac commit 是最早的祖先分支，所以会出现下面的错误

```shell
git rebase -i f812eac
The previous cherry-pick is now empty, possibly due to conflict resolution.
If you wish to commit it anyway, use:

    git commit --allow-empty

Otherwise, please use 'git reset'
interactive rebase in progress; onto f812eac
Last command done (1 command done):
   pick f812eac
Next commands to do (2 remaining commands):
   squash 6e46b7d move filename readme to readme.md
   pick 36303d8 create a comlpete web page
You are currently rebasing branch 'master' on 'f812eac'.

nothing to commit, working tree clean
Could not apply f812eac...
```

#### 这时候我们使用 `git status` 查看一下

```shell
git status
interactive rebase in progress; onto f812eac
Last command done (1 command done):
   pick f812eac
Next commands to do (2 remaining commands):
   squash 6e46b7d move filename readme to readme.md
   pick 36303d8 create a comlpete web page
  (use "git rebase --edit-todo" to view and edit)
You are currently rebasing branch 'master' on 'f812eac'.
  (all conflicts fixed: run "git rebase --continue")

nothing to commit, working tree clean
```

#### 这时候我们执行一下信息提示的 `git rebase --continue` 命令，然后进入一个交互界面

```shell
git rebase --continue
# This is a combination of 2 commits.
# This is the 1st commit message:

add readme

# This is the commit message #1:

move filename readme to readme.md

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Wed Apr 8 21:46:35 2020 +0800
#
# interactive rebase in progress; onto f812eac
# Last commands done (2 commands done):
#    pick f812eac
#    squash 6e46b7d move filename readme to readme.md
# Next command to do (1 remaining command):
#    pick 36303d8 create a comlpete web page
# You are currently rebasing branch 'master' on 'f812eac'.
#
#
# Initial commit
#
# Changes to be committed:
#       new file:   readme.md
#
```

#### 我们修改 commit message

```shell
# This is a combination of 2 commits.
add readme.md
# This is the 1st commit message:

add readme

# This is the commit message #1:

move filename readme to readme.md
...
```

#### 进行 wq 之后，我们就成功将间隔的多个 commit 整理成为一个 commit 了

```shell
git rebase --continue
[detached HEAD 9d31e9f] add readme.md
 Date: Wed Apr 8 21:46:35 2020 +0800
 1 file changed, 1 insertion(+)
 create mode 100644 readme.md
Successfully rebased and updated refs/heads/master.
```

#### 修改之后的版本历史

```shell
* commit 9cb6422b77a3f2e42a5d65da7df40154b8601c3e (HEAD -> master)
| Author: monsterhxw <770342643@qq.com>
| Date:   Wed Apr 8 21:47:33 2020 +0800
|
|     create a comlpete web page
|
|     add index + logo
|
|     add style.css
|
|     add js
|
|     add refering projects
|
* commit 9d31e9fe0b57a6ea86de4e5c7d9dd5969a0c49d0
  Author: monsterhxw <770342643@qq.com>
  Date:   Wed Apr 8 21:46:35 2020 +0800

      add readme.md

      add readme

      move filename readme to readme.md
```
