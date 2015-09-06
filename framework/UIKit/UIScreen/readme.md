# UIScreen

**简介**

`UIScreen`对象定义了与硬件显示屏相关的属性，iOS设备有个主屏，外加0个或多个附屏，这个类可以获取所有与设备相关的屏幕。



**捕获连接和断开屏幕的通知**

当用户连接或断开屏幕时，系统会发送通知给应用，利用代理可以长时间的监控通知信息。连接和断开的通知可能随时发生，也许这时你的应用在后台被挂起，在应用挂起时，通知会保存在队列中，直到你的应用在前台或后台又开始运行。



**注意**

* iOS8之前，`UIScreen`的`bounds`属性总是反映了屏幕在竖屏情况的尺寸，将屏幕旋转成为横屏或倒立情况都不会改变`bounds`属性。从iOS8开始，bounds属性参考设备方位的变化。依赖屏幕尺寸的应用可以使用`fixedCoordinateSpace`属性来修正点在坐标中的位置。

<br>

***

<br>

### 参考资源

* [Apple开发者文档中关于UIApplication/UIScreen/UIDevice的简述](http://www.jianshu.com/p/c7574c46b809)
* [详解UICoordinateSpace和UIScreen在iOS 8上的坐标问题](http://chun.tips/blog/2014/10/23/xiang-jie-uicoordinatespacehe-uiscreenzai-ios-8shang-de-zuo-biao-wen-ti/)