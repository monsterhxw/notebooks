# 怎么删除不需要的分支

## 本地分支的删除

### 如果想要删除某个分支，那么首先得切换到一个不会删除的分支上

```shell
git checkout not_deleting_branch
```

### 使用 `git branch` 命令的 `-d` 或者 `-D` 参数进行删除分支

```shell
# -d 参数，仅在被删除分支已经被 push 并与远程分支 merge 后才删除。
git branch -d <branch>

# -D 参数，会强制删除分支（即使尚未 push 或 merge 到远程分支）。
git branch -D <branch>
```

如

```shell
git branch -d fix_readme
error: The branch 'fix_readme' is not fully merged.
If you are sure you want to delete it, run 'git branch -D fix_readme'.

git branch -D fix_readme
Deleted branch fix_readme (was ec6d6e0).
```

## 远程分支的删除

### 删除远程分支的命令是：`git push <remote> --delete <branch>`

```shell
git push origin --delete fix_readme
```

### 还可以使用一个简短命令来删除远程分支：`git push <remote> :<branch>`

```shell
git push origin :fix_readme
```

### 删除本地远程追踪分支

```shell
git branch --delete --remotes <remote>/<branch>

# Shorter
git branch -dr <remote>/<branch>

# Delete multiple obsolete tracking branches
git fetch <remote> --prune

# Shorter
git fetch <remote> -p
```

### 如果出现一下错误，意味着有人已经删除了该分支

```shell
error: unable to push to unqualified destination: remoteBranchName The destination refspec neither matches an existing ref on the remote nor begins with refs/, and we are unable to guess a prefix based on the source ref. error: failed to push some refs to 'git@repository_name'
```

> 这时候我们可以尝试使用下面的命令来同步我们的分支列表

```shell
# -p 参数代表的是“prune”(剪去)，提取后，将删除远程上不存在的的本地分支。
git fetch -p
```
