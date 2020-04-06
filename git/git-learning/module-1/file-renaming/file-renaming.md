# 文件重命名

## 不推荐方式

```shell
mv need_rename_file to_renamed_file

git add to_renamed_file

git rm need_rename_file

git commit -m 'rename file'
```

## 推荐方式，一条命令

```shell
git mv need_rename_file to_renamed_file
```
