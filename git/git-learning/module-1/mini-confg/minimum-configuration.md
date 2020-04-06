# 最小配置

## 配置 user 信息

### 配置 [user.name](http://user.name) 和 user.email

    git config --global user.name 'your_name'
    
    git config --global user.email 'your_email'

### config 的三个作用域

> 缺省等同于 local

    # local 只对某个仓库有效
    git config --local
    
    # global 对当前用户的所有仓库有效
    git config --global
    
    # system 对系统所有登录的用户有效
    git config --system

### 显示 config 的配置，加 --list

    git config --list --local
    
    git config --list --global
    
    git config --list --system

### 清除 config 的配置，--unset

    git config --unset --local user.name
    
    git config --unset --global user.name
    
    git config --unset --system user.name

### 优先级

> **local > global > system**