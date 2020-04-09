# 如何将暂存区恢复成和 HEAD 的一样

## 使用 `git reset HEAD` 命令会将暂存区的`所有文件`恢复成和 HEAD 的一样

```shell
git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html
	modified:   styles/style.css


git reset HEAD
Unstaged changes after reset:
M	index.html
M	styles/style.css

git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   index.html
	modified:   styles/style.css

no changes added to commit (use "git add" and/or "git commit -a")
```

## 使用 `git reset HEAD <file>...` 命令会将暂存区的`指定文件`恢复成和 HEAD 的一样

```shell
git status
On branch master
Changes to be committed:
	(use "git reset HEAD <file>..." to unstage)

	modified:   index.html
	modified:   styles/style.css

git reset HEAD -- styles/style.css
Unstaged changes after reset:
M	styles/style.css

git status
On branch master
Changes to be committed:
	(use "git reset HEAD <file>..." to unstage)

	modified:   index.html

Changes not staged for commit:
	(use "git add <file>..." to update what will be committed)
	(use "git checkout -- <file>..." to discard changes in working directory)

	modified:   styles/style.css
```
