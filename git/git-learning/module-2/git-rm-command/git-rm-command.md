# 正确删除文件的方法

## 使用 `git rm <file name>` 命令

### 例

```shell
git rm readme.md
rm 'readme.md'

git status
On branch fix/readme
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	deleted:    readme.md
```
