# git diff

## 比较暂存区和 HEAD 所含文件的差异

### 使用命令 `git diff --cached`

#### 如

```shell
git diff --cached

diff --git a/index.html b/index.html
index b042b83..f3bec48 100644
--- a/index.html
+++ b/index.html
@@ -1,3 +1,5 @@
 logoL

 refering project
+
+compare staging and HEAD.
```

## 比较工作区和暂存区所含文件的差异

### 使用命令 `git diff`

#### 上面的命令会显示在当前的工作目录中尚未暂存的文件更新了哪些部分

```shell
git status
On branch master
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   index.html

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   styles/style.css

git diff
diff --git a/styles/style.css b/styles/style.css
index e8c7365..4712434 100644
--- a/styles/style.css
+++ b/styles/style.css
@@ -1 +1,3 @@
 style.css
+
+color : black
```

## 比较工作区和上次提交时之间的文件差异

### 使用命令 `git diff HEAD`

#### 上面的命令会显示在当前的工作目录与上次提交时之间的差异

> `git diff HEAD` 显示的内容都会在执行命令 `git commit -a` 时被提交

```shell
git diff
diff --git a/index.html b/index.html
index f3bec48..3cd48c5 100644
--- a/index.html
+++ b/index.html
@@ -2,4 +2,6 @@ logoL

 refering project

+bare repository
+
 compare staging and HEAD.
diff --git a/styles/style.css b/styles/style.css
index e8c7365..4712434 100644
--- a/styles/style.css
+++ b/styles/style.css
@@ -1 +1,3 @@
 style.css
+
+color : black
```

## 比较不同的提交（commit）的指定文件的差异

### 使用命令 `git diff <commit 1 hash> <commit 2 hash> -- <file name>`

### 查看版本历史

```shell
git log --all --graph --oneline
* d436f9d (HEAD -> fix/readme) fix/readme
* 15f3041 (master) add the first git command with config
* 9cb6422 create a comlpete web page
* 9d31e9f add readme.md
```

### 进行比较

```shell
git diff d436f9d 15f3041
diff --git a/readme.md b/readme.md
index 1c7eba6..8178c76 100644
--- a/readme.md
+++ b/readme.md
@@ -1,2 +1 @@
  readme
-fix/readme


git diff d436f9d 15f3041 -- readme.md
diff --git a/readme.md b/readme.md
index 1c7eba6..8178c76 100644
--- a/readme.md
+++ b/readme.md
@@ -1,2 +1 @@
  readme
-fix/readme


git diff fix/readme master -- readme.md
diff --git a/readme.md b/readme.md
index 1c7eba6..8178c76 100644
--- a/readme.md
+++ b/readme.md
@@ -1,2 +1 @@
  readme
-fix/readme
```
