# 记录日常 Linux Commands

### 更改某个文件或目录的属主和属组。

```bash
$ chown -R web:web /data/demo
```

### 建立软连接

```bash
$ ln -s source target
```

###  更换 Nginx 的 SSL 证书

- **Local**

    ```bash
    $ tar -czf ssl.tar.gz *
    
    $ scp ./ssl.tar.gz root@xxx.xxx.xxx.xxx:/usr/share/nginx/ca/xxx.com
    ```

- **Server**

    ```bash
    $ cd /usr/share/nginx/ca/xxx.com
    
    $ tar -xzvf ssl.tar.gz && rm -fr ./ssl.tar.gz
    
    $ chmod -R +x /usr/share/nginx/ca/xxx.com
    
    $ nginx -t 
    
    $ systemctl reload nginx
    ```

### nohup 后台启动 jar

- **Local**

    ```bash
    $ scp ./demo-0.0.1-SNAPSHOT.jar root@xxx.xxx.xxx.xxx:/data/uums/ /data/demo
    ```

- **Server**

    ```bash
    $ ps -ef |grep  java
    
    $ kill -9 pid
    
    $ nohup java -jar demo-0.0.1-SNAPSHOT.jar &
    
    $ nohup java -jar demo-0.0.1-SNAPSHOT.jar -Xms512m -Xmx512m -XX:CompressedClassSpaceSize=128m -XX:MetaspaceSize=200m -XX:MaxMetaspaceSize=200m &
    ```

### 配置微信文件到 Nginx 步骤

```bash
$ scp /本地文件路径/本地文件名 root@xxx.xxx.xxx.xxx:/data/域名

$ cd /etc/nginx/conf.d/域名

$ vi 域名.conf

# 在 Nginx 的配置文件添加命令
#  location /微信文件.txt {
#    alias /data/xxx.com/微信文件.txt;
#  }

$ nginx -t 

$ systemctl reload nginx
```

### 对 /data下的文件夹进行排序，显示当前目录下面的子目录的目录大小

```shell
$ du -d1 -h /data | sort -h
```
### 查看文件，去除注释和去除空格

```shell
$ cat xxx.conf | grep -v "#" | grep -v "^$"
```

