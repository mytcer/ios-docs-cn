# UIMotionEffect

**简介**

它是一个抽象的父类，用于定义基于运动的视差效果。子类负责定义运动被检测到时应用于视图的行为。通过覆盖`keyPathsAndRelativeValuesForViewerOffset:`方法来实现这些，该方法返回一个或多个关键路径来表示将要修改的视图属性。



**注意**

* 该类不能直接实例化。
* 如果你要子类化`UIMotionEffect`，就必须符合`NSCopying`和`NSCoding`协议，必须实现`keyPathsAndRelativeValuesForViewerOffset:`方法。

<br>

***

<br>

### 参考资源

* [UIMotionEffect和Home页背景视差效果](http://www.cocoachina.com/ios/20150121/10967.html)