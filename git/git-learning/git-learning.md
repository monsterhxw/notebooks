# Git 学习总结

## 仓库的本质(repository)

### 本质: ⼀个所有的历史都可追溯的⽂件夹

- 历史的最⼩单位是仓库在某个时刻的状态（快照）

- 通常⽤ SHA-1 表示

### 那些东西可以标识仓库的某个状态

- **commit 对象的 SHA-1 (无需写全)**

- **分支（branch）**

- **HEAD**

- **标签（tag）**

## 提交的本质(commit)

### 本质: 仓库从一个状态转移到另外的一个状态时发生的变化

### 持续的⼯作和提交，在仓库中建⽴了⼀棵树

### commit 对象是不可变的

#### 那么 `git commit --amend` 是什么

如果提交消息中包含不明确、不正确或敏感的信息，您可以在本地修改它，然后将含有新消息的新提交推送到仓库。 您还可以更改提交消息以添加遗漏的信息。

> 可以使用 `git commit --amend` 命令更改最近的提交消息

但是需要注意的是：

> 在 Git 中，提交消息的文本是提交的一部分。 更改提交消息将更改提交 ID - 即用于命名提交的 SHA1 校验和。 实际上，您是创建一个新提交以替换旧提交。

## 分支的本质(branch)

### 本质: 一个可以移动的指针，指向某个提交对象

- 新建一个分支，就是新建一个指针

- git checkout -b new-branch-name {仓库的某个状态}

### 特殊的指针 HEAD(头指针)

HEAD 是一个指针，指向某一个分支，通常你可以把 HEAD 当做`当前所在分支`看待。

> HEAD 通常会指向当前所在分支。不过 HEAD 也不一定总是会指向某个分支，当 HEAD 没有指向某个分支的时候便会造成 `detached HEAD` 的状态，指向的是 commit。

#### HEAD 的 `~` 和 `^` 的使用

- `~` 表示获取第一个祖先提交，`~<n>`，相当于连续的 `n 个 ^`

  > 如 `~2` 相当于 `^^`。

- `^` 表示获取第一个父提交，当一个提交有多个父提交时，可以通过在 `^` 后面加多一个数字，表示是第几个父提交。

  > 如 `HEAD^^^` 相当于 `HEAD^1^1^1`，并不等价于 `HEAD^3`。

  `^` 的作用

  ```shell
  * f44239d D
  *   7a3fb3d C
  |\
  | * 07b920c B
  |/
  * 71bd2cf A
  ```

  很多情况下一个提交并不是只有一个父提交。 就如上图表示那样，`7a3fb3d (C)` 就有两个父提交：

  - `07b920c (B)`

  - `71bd2cf (A)`

  这时候，我们是不能通过 `~` 去找到 `07b920c (B)` 这个提交的。 如果一个提交有多个父提交，那么 `~` 只会找第一个父提交。
  那么我们应该怎么找到 `07b920c (B)` 呢？ 答案是：`HEAD~^2`

#### 额外

> `checkout` 只会移动 `HEAD 指针`, `reset` 会改变 `HEAD 指针` 的引用值

#### 引用 kernel.org 中非常形象的一段话

> Here is an illustration, by Jon Loeliger. Both commit nodes B and C are parents of commit node A. Parent commits are ordered left-to-right.
> 这是 Jon Loeliger 的插图。提交节点 B 和 C 都是提交节点 A 的父节点。父提交的顺序是从左到右。

```shell
G   H   I   J
 \ /     \ /
  D   E   F
   \  |  / \
    \ | /   |
     \|/    |
      B     C
       \   /
        \ /
         A
A =      = A^0
B = A^   = A^1     = A~1
C = A^2  = A^2
D = A^^  = A^1^1   = A~2
E = B^2  = A^^2
F = B^3  = A^^3
G = A^^^ = A^1^1^1 = A~3
H = D^2  = B^^2    = A^^^2  = A~2^2
I = F^   = B^3^    = A^^3^
J = F^2  = B^3^2   = A^^3^2
```

## 参考资料

- <https://xiedaimala.com>

- <https://scarletsky.github.io/2016/12/29/tilde-and-caret-in-git/>
