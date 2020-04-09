# 消除最近几次提交

## `git reset --hard <指定回滚 commit hash>`

### 修改前版本历史

```shell
git log --all --graph
* commit 8c7877897342d74a638d7d29ce36d29b03fa157c (HEAD -> fix/readme)
| Author: monsterhxw <770342643@qq.com>
| Date:   Thu Apr 9 10:26:28 2020 +0800
|
|     fix/readme2
|
* commit d436f9d79a4747c3bab83cd987453b43e1a7b1ca
| Author: monsterhxw <770342643@qq.com>
| Date:   Thu Apr 9 10:25:51 2020 +0800
|
|     fix/readme
|
* commit 15f30414c88891a0dd59f1eeb9f0636eed6f7f2e (master)
| Author: monsterhxw <770342643@qq.com>
| Date:   Thu Apr 9 02:19:18 2020 +0800
|
|     add the first git command with config
|
* commit 9cb6422b77a3f2e42a5d65da7df40154b8601c3e
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
```

### 修改过程

```shell
git reset --hard d436f9d79a4747c3bab83cd987453b43e1a7b1ca
HEAD is now at d436f9d fix/readme
```

### 修改后版本历史

```shell
* commit d436f9d79a4747c3bab83cd987453b43e1a7b1ca (HEAD -> fix/readme)
| Author: monsterhxw <770342643@qq.com>
| Date:   Thu Apr 9 10:25:51 2020 +0800
|
|     fix/readme
|
* commit 15f30414c88891a0dd59f1eeb9f0636eed6f7f2e (master)
| Author: monsterhxw <770342643@qq.com>
| Date:   Thu Apr 9 02:19:18 2020 +0800
|
|     add the first git command with config
|
* commit 9cb6422b77a3f2e42a5d65da7df40154b8601c3e
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

### 若想同时修改远程仓库执行 `git push <remote> <branch_name> -f`

> -f 参数是强制提交，因为 reset 之后本地库落后于远程库一个版本，因此需要强制提交

## `git revert <commit>...`

### 使用 `git revert <commit>` 可以撤销指定的提交

> 要撤销一串提交可以用 `<commit1>..<commit2>` 语法，注意这是一个前开后闭区间，即不包括 commit1，但包括 commit2

## `revert` 和 `reset` 的区别

### `revert` 是放弃指定提交的修改，但是会生成一次新的提交，需要填写提交注释，以前的历史记录都在

### `reset` 是指将 `HEAD` 指针指到指定提交，历史记录中不会出现放弃的提交记录
