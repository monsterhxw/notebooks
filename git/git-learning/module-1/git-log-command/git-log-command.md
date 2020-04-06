# git log 命令查看版本演变历史

## 一般查看，不带参数

```shell
git log
```

## 加参数 --oneline，记录按照一行一行展示

```shell
git log --oneline
```

## 加参数 -n[需要看看最近的几个 commit]，展示最近的几个 commit

```shell
git log -n4

git log -n4 --oneline
```

## 加参数 --all，查看所有分支的版本历史记录

```shell
git log --all
```

## 加参数 --graph，带图形化看版本历史记录

```shell
git log --graph

git log --all --graph
```

## 组合参数使用

```shell
git log --oneline --all -n4 --graph
```
