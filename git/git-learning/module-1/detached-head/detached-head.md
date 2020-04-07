# 分离头指针情况下的注意事项

## 当 git checkout committer_hash 的时候会出现 detached HEAD 提示信息

```shell
git checkout e72658a
Note: checking out 'e72658a'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

    git checkout -b <new-branch-name>

HEAD is now at e72658a add script.js
```

> 分离头指针指中任何变更 commit 都不会基于任何的 branch，所以当在切换分支的时候，这些变更的信息就会被丢失。

```shell
vim styles/styles.css

git status
HEAD detached at e72658a
Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

    modified:   styles/styles.css

no changes added to commit (use "git add" and/or "git commit -a")

git add styles/

git commit -m 'modify style.ccs info'
[detached HEAD ec6d6e0] modify style.ccs info
    1 file changed, 1 insertion(+)

git status
HEAD detached from e72658a
nothing to commit, working tree clean

git checkout master
Warning: you are leaving 1 commit behind, not connected to
any of your branches:

    ec6d6e0 modify style.ccs info

If you want to keep it by creating a new branch, this may be a good time
to do so with:

    git branch <new-branch-name> ec6d6e0

Switched to branch 'master'
```

### 如何解决

把这些变更 commit 绑定一个 branch

```shell
git branch <new-branch-name> ec6d6e0
```
