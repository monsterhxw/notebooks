# 使用 git bisect

## 使 `git bisect` 二分查找(bisection)找到引入错误的 `commit`

### `git bisect` 作用：在版本历史中查找某处引入的 `bug`

> 它的原理很简单，就是将代码提交的历史，按照两分法不断缩小定位。所谓"两分法"，就是将代码历史一分为二，确定问题出在前半部分，还是后半部分，不断执行这个过程，直到范围缩小到某一次代码提交。

## 使用 `git bisect` 流程

### 开启 `git bisect`

> 使用命令 `git bisect start <终点 commit id> <起点 commit id>`

```shell
# 起点是第一次提交 4d83cf，终点是最近一次的 HEAD
$ git bisect start HEAD 4d83cf
```

执行上面的命令以后，代码库就会切换到这段范围正当中的那一次提交，本例是第 51 次提交。

### 标记 `当前 commit` 是好还是坏( `good/bad` )

> 使用命令 `git bisect good/bad`

**使用 `git bisect good` 命令，标识本次提交（第 51 次）没有问题。**

```shell
$ git bisect good
```

既然第 51 次提交没有问题，就意味着错误是在代码历史的后半段引入的。执行上面的命令，Git 就自动切换到后半段的中点（第 76 次提交）。

**使用 `git bisect bad` 命令，标识本次提交（第 76 次）有问题。**

```shell
$ git bisect bad
```

执行上面的命令以后，Git 就自动切换到第 51 次到第 76 次的中点（第 63 次提交）。

### 接下来，不断重复这个过程，直到成功找到出问题的那一次提交为止

> 这时，Git 会给出如下的提示
> `b47892 is the first bad commit`

既然找到那个有问题的提交，就可以检查代码，确定具体是什么错误。

### 最后使用 `git bisect reset` 退出查错，回到最近一次的代码提交

```shell
$ git bisect reset
```

> **现在就可以开始修复 bug 了**

## 额外

### 可以使用 `git bisect run <自动化脚本>` 实现自动化查找 bug

## 使用场景

- 在问题可以稳定重现的时候，迅速定位出问题的代码
- 有的时候这比直接去 debug 更快捷

## 使用步骤

### 先手动，然后尝试自动化（ `git bisect run <自动化脚本>` ）

## 参考资料

- [http://www.ruanyifeng.com/blog/2018/12/git-bisect.html](http://www.ruanyifeng.com/blog/2018/12/git-bisect.html)
- [https://xiedaimala.com](https://xiedaimala.com/)
