# UILocalNotification

**简介**

一个`UILocalNotification`对象指定了一个通知，应用程序可以将该通知安排在指定的日期和时间进行展示，操作系统负责在预定地时间发送通知。

当你创建一个本地通知时，你必须指定一个特定日期或地理区域来触发通知的发送。基于日期的通知在指定的日期和时间触发，时间会根据时区的变化作出调整；基于地理区域的通知会在用户进入或退出指定的区域时触发。在这两种情况下，你可以指定通知是一次性的还是反复的。



**注意**

* 当系统发送通知时，应用程序不需要处于运行状态。
* 在后台运行的应用程序也可以安排本地通知来通知用户。
* iOS最多允许最近本地通知的数量是64个。
* 当应用程序已经处在最前面时，系统不会显示与之对应的通知。

<br>

***

<br>

### 参考资源

* [UILocalNotification详解](http://www.cfanz.cn/index.php?c=article&a=read&id=73959)
* [关于UILocalNotification一些更深刻的认识](http://blog.cnrainbird.com/index.php/2012/06/08/guan_yu_uilocalnotification_yi_xie_geng_shen_ke_de_ren_shi/)