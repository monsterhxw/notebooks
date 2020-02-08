# 记录日常 Mac Commands

## Mac OS 终端批量删除文件

### 搜索删除文件

```bash
cd /xxx/xxx

find ./ -name "*.html" -exec rm -rf {} \;
```

**find [目录名] -name "文件名" -exec rm -rf {} \; 注意 {}和\;之间有空格**

- -name : 表示指定哪些文件
- -exec : 表示后面执行命令
- {} : 表示查询到的文件名
- rm : 删除命令
- -rf : 删除命令 rm 的参数，r 表示递归删除， f 表示不需要确认，两个参数可根据需要去留。

## 查看 Mac OS 系统的硬件信息

```shell
echo "CPU 型号:"

sysctl -n machdep.cpu.brand_string

echo "CPU 核心数量:"

sysctl -n machdep.cpu.core_count

echo "CPU 线程数:"

sysctl -n machdep.cpu.thread_count

echo "其它信息:"

system_profiler SPDisplaysDataType SPMemoryDataType SPStorageDataType | grep 'Graphics/Displays:\|Chipset Model:\|VRAM (Total):\|Resolution:\|Memory Slots:\|Size:\|Speed:\|Storage:\|Media Name:\|Medium Type:'
```

## Mac 快捷键
- **`Control` +  `A` : `光标移动到段首` ，A = Ahead Of**
- **`Control` +  `E` : `光标移动到段尾` ，E = End Of**
- **`Control` +  `P` : `光标移动到上一行` ， P = Previous**
- **`Control` +  `N` : `光标移动到下一行`，N = Next**
- **`Control` +  `F` : `光标向前移动一个字符` ，F = Forward**
- **`Control` +  `B` : `光标向后移动一个字符` ，B = Backward**
- **`Control` + `D` : `删除光标右边的字符`，相当于 Fn + Delete**
- **`Control` + `H` : `删除插入点左边的字符`，相当与 Delete**
- **`Control` + `K` : `删除插入点与行或段落末尾处之间的文本`**
- **`Control` + `T` : `将插入点后面的字符与插入点前面的字符交换`**
- **`Control` + `O`：`在插入点后新插入一行`，相当于 return**

