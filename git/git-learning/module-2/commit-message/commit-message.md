# 修改 commit message

## 修改最新的 commit message

### 使用 `git commit --amend`

```shell
git commit --amend

update move README.md to README

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Mon Apr 6 15:26:43 2020 +0800
#
# On branch master
# Changes to be committed:
#       renamed:    README.md -> README
#
```

## 修改老旧的 commit message

### 使用 `git rebase -i`

```shell
# 修改需要变基的 commit 的命令 pick 变为 reword
git rebase -i <需要变基的 commit 的父 commit hash>

pick 9ece282 add refering projects
pick bfdc314 update move README.md to README

# Rebase e72658a..bfdc314 onto e72658a (2 commands)
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

# 修改 pick 9ece282 add refering projects 为 reword 9ece282 add refering projects
# wq 保存之后
add refering projects

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Mon Apr 6 07:02:49 2020 +0800
#
# interactive rebase in progress; onto e72658a
# Last command done (1 command done):
#    reword 9ece282 add refering projects
# Next command to do (1 remaining command):
#    pick bfdc314 update move README.md to README
# You are currently editing a commit while rebasing branch 'master' on 'e72658a'.
#
# Changes to be committed:
#       modified:   index.html
#       modified:   styles/styles.css
#

# 修改 add refering projects 为 add a refering project.
# wq 保存之后
add refering projects
[detached HEAD 9179643] add a refering project.
 Date: Mon Apr 6 07:02:49 2020 +0800
 2 files changed, 3 insertions(+)
 Successfully rebased and updated refs/heads/master.
```

### 需要注意的是

> `rebase` 只能在自己的分支上进行变基操作
