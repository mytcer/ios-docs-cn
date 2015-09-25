# UINavigationController

**简介**

该类实现了一个导航控制器，它使用导航堆栈管理当前显示的屏幕内容。导航堆栈是一个视图控制器数组，数组中的第一个视图控制器是根视图控制器，数组中的最后一个视图控制器是当前显示的视图控制器。



**状态保持**

从iOS6开始，如果你设置了导航控制器的`restorationIdentifier`属性值，导航控制器会试着在导航堆栈上保持每个子视图控制器。它会对拥有一个有效恢复标识符串的视图控制器进行编码，在下一个启动周期，导航控制器会按照在导航堆栈中的保持顺序来恢复被保持的视图控制器。

推送到导航堆栈中的子视图控制器会使用相同的恢复标识符，导航控制器会自动存储额外的信息来确保每个子视图控制器的恢复路径是唯一的。



**注意**

* 从iOS7开始，用户可以通过轻扫屏幕左侧来弹出最顶层视图控制器。
* 当前一个视图控制器提供了返回按钮时，如果设置的返回按钮标题过长，为了适应可用空间，实际的标题会被替换为"返回"。
* 只要在使用了`UINavigationController`且`navigationBar`没有被隐藏的条件下，它的`rootController`及之后push的controller的`preferredStatusBarStyle`方法不会被调用。原因是`UINavigationController`会根据自己`navigationBar`的`barStyle`来决定 StatusBarStyle。

<br>

***

<br>

### 参考资源

* [UINavigationController详解与使用(一)添加UIBarButtonItem](http://blog.csdn.net/totogo2010/article/details/7681879)
* [UINavigationController详解与使用(二)页面切换和segmentedController](http://blog.csdn.net/totogo2010/article/details/7682433)
* [UINavigationController详解与使用(三)ToolBar](http://blog.csdn.net/totogo2010/article/details/7682641)
* [如何正确设置状态栏的风格？](http://bawn.github.io/ios/2014/07/29/UIStatusBarStyle.html)
* [关于preferredStatusBarStyle方法被重写状态栏字体颜色不变的处理？](http://m13018951428.blog.163.com/blog/static/236322019201491081910593/)