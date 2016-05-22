# iOS沙盒机制

### 什么是沙盒

沙盒的本质是一个文件夹，文件夹的名字是系统随机分配的（以Mac上模拟器的沙盒为例：`/Users/用户名/Library/Developer/CoreSimulator/Devices/9239277B-DF57-45F0-8BB2-DBC7F7DC458F/data/Containers/Data/Application/A8ACEF36-333E-43C2-AE81-86A52222A528`，`A8ACEF36-333E-43C2-AE81-86A52222A528`就是系统随机分配的文件夹名），其目录结构如下：

**Documents**

说明：苹果建议将程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录。

**Library/Caches**

说明：存储缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除。

**Library/Preferences**

说明：存储应用程序的偏好设置文件

**tmp**

说明：存储临时文件

注意：iPhone在重启时，会丢弃所有的tmp文件。


<br>
***
<br>


### 什么是沙盒机制

iOS中的沙盒机制是一种安全体系，它对应用程序执行各种操作作了权限限制：

* 每个应用程序都有自己的沙盒

* 每个应用程序只能在自己的沙盒内读取文件，不能访问其他地方的内容。

* 应用程序向外请求或接收数据都需要经过权限认证，假如不符合条件的话，不会被放行。


<br>
***
<br>


### 获取沙盒目录路径的方法

**例子**

```
NSString *librayPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
```

**各目录对应的路径参数名**

* NSHomeDirectory -- 沙盒主路径

* NSDocumentDirectory -- Documents文件夹

* NSLibraryDirectory -- Library文件夹

* NSCachesDirectory -- Library/Caches文件夹

* NSTemporaryDirectory -- tmp文件夹