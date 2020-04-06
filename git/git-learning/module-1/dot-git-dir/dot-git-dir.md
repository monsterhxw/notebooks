# .git 目录探秘

## 目录文件列表

```shell
.git
├── COMMIT_EDITMSG
├── HEAD
├── branches
├── config
├── description
├── gitk.cache
├── hooks
├── index
├── info
├── logs
├── objects
└── refs
```

## 重要文件夹和文件

- HEAD 文件
- config 文件
- objects 文件夹

  ```shell
  objects
  ├── 1f
  │   └── 5c289c9580f35c57b15d55ed7c97049c991d42
  ...
  ...
  ├── info
  └── pack
  ```

- refs 文件夹

  ```shell
  refs
  ├── heads
  │   └── master
  └── tags
  ```

## 额外命令 a ，git cat-file 查看 git 的文件信息

```shell
# -t [文件名]，查看文件的类型
git cat-file -t ace1ed38a92b
commit

# -p [文件名]，查看文件的内容
git cat-file -p ace1ed38a92b
```

## Git 的数据类型

### 1. commit

### 2. tree

### 3. blob
