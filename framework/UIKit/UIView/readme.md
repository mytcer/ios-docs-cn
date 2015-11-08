# UIView

**简介**

视图


**注意**

* 如果多次调用`setNeedsDisplay`方法，系统只会执行一次`drawRect`方法。
* 视图被添加到父视图上后，并不会马上显示在屏幕上，而是会在执行完`viewWillAppear`方法后、`viewDidAppear`方法前执行绘制.

<br>

***

<br>

### 参考资源

* [对drawRect和setNeedsDisplay的理解](http://blog.csdn.net/jkwmscq/article/details/47020699)
