# Mark Word

> Mark Word : HotSpot 虚拟机对象的对象头（Header）其中的用于存储对象自身的运行时数据。

### 下表为 `32` 位 JVM 下的 Mark Word 存放的不同锁状态下对象存储内容。

|                       存储内存(30 bit)                       | 锁状态标志位(2 bit) |  锁状态  |
| :----------------------------------------------------------: | :-----------------: | :------: |
| 对象哈希码(`hashcode`,`25 bit`)、对象分代年龄(`age`,`4 bit`)、是否为偏见锁(`biased_lock`,`1 bit`) |         01          |  未锁定  |
| 偏向线程 ID(`thread_id`,`23 bit`)、偏向时间戳(`epoch`,`2 bit`)、对象分代年龄(`age`,`4 bit`)、是否为偏见锁(`biased_lock`,`1 bit`) |         01          |  偏向锁  |
|       指向锁记录的指针(`ptr_to_lock_record`,`30 bit`)        |         00          | 轻量级锁 |
|  指向重量级锁的指针(`ptr_to_heavyweight_monitor`,`30 bit`)   |         10          | 重量级锁 |
|                      空，不需要记录信息                      |         11          | GC 标记  |

