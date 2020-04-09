# 如何将工作区的文件恢复成和暂存区的一样

## 使用 `git checkout -- <file>...` 命令

### 会将指定的工作区的文件恢复成和暂存区的一样

```shell
git status
On branch master
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   index.html
	modified:   styles/style.css

no changes added to commit (use "git add" and/or "git commit -a")

git add index.html

git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   styles/style.css

git diff --cached
diff --git a/index.html b/index.html
index f3bec48..3cd48c5 100644
--- a/index.html
+++ b/index.html
@@ -2,4 +2,6 @@ logoL

 refering project

+bare repository
+
 compare staging and HEAD.

vim index.html

git diff
diff --git a/index.html b/index.html
index 3cd48c5..6500116 100644
--- a/index.html
+++ b/index.html
@@ -2,6 +2,6 @@ logoL

 refering project

-bare repository
+裸仓库

 compare staging and HEAD.
diff --git a/styles/style.css b/styles/style.css
index e8c7365..4712434 100644
--- a/styles/style.css
+++ b/styles/style.css
@@ -1 +1,3 @@
 style.css
+
+color : black

git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   index.html
	modified:   styles/style.css

git checkout -- index.html

git diff
diff --git a/styles/style.css b/styles/style.css
index e8c7365..4712434 100644
--- a/styles/style.css
+++ b/styles/style.css
@@ -1 +1,3 @@
 style.css
+
+color : black

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
