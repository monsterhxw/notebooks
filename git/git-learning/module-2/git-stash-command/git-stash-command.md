# 怎么处理开发中临时加塞了紧急任务

## 使用 `git stash` 命令

### 当我们修改了文件

```shell
git status
On branch fix/readme
Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   index.html

no changes added to commit (use "git add" and/or "git commit -a")

git diff
diff --git a/index.html b/index.html
index f3bec48..8afcaf2 100644
--- a/index.html
+++ b/index.html
@@ -3,3 +3,5 @@ logoL
    refering project

    compare staging and HEAD.
+
+stash modify
```

### 这时候来了紧急任务，我们可以先把我们修改的文件藏起来

```shell
git stash
Saved working directory and index state WIP on fix/readme: d436f9d fix/readme

git stash list
stash@{0}: WIP on fix/readme: d436f9d fix/readme

git status
On branch fix/readme
nothing to commit, working tree clean
```

> 注意！
> Untracked 状态的档案预设没办法被 Stash，需要额外使用 -u 参数。

### 完成了紧急任务，我们把之前藏起来的修改文件拿出来

### 使用 `git stash apply <stash@{指定数字}>`

```shell
git stash apply
On branch fix/readme
Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   index.html

no changes added to commit (use "git add" and/or "git commit -a")

git stash list
stash@{0}: WIP on fix/readme: d436f9d fix/readme
```

### 使用 `git stash pop <stash@{指定数字}>`

```shell
git stash pop
On branch fix/readme
Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   index.html

no changes added to commit (use "git add" and/or "git commit -a")
Dropped refs/stash@{0} (2d92fd8e60798ebc1049bd04715090a1f9b33de5)

# stash list 空了
git stash list
```

### `git stash apply` 和 `git stash pop` 的区别

> `git stash apply` 将位于 `stash 栈`的顶部的元素，弹出来，但是这个元素 `会` 继续保留在 `stash 栈`中。

> `git stash pop` 将位于 `stash 栈`的顶部的元素，弹出来，但是这个元素 `不会` 继续保留在 `stash 栈`中。
