# UIScrollView

**简介**

它允许用户通过滑动手势滚动内容及通过缩放手势缩放内容。



**状态保持**

从iOS 6开始，如果你给视图的`restorationIdentifier`属性指定一个值，它会尝试保持应用程序启动期间的滚动相关信息：`zoomScale`，`contentInset`，`contentOffset`属性。在恢复过程中，滚动视图将恢复这些值，使内容看上去和之前一样。



**注意**

* 滚动视图本身没有绘制，除了显示垂直和水平滚动指示器。
* 滚动视图必须知道内容视图的大小，以便于它知道何时停止滚动。
* 默认情况下，当滚动超出内容边界时会反弹回来。

<br>

***

<br>

### 参考资源

* [UIScrollView新手教程](http://www.cocoachina.com/ios/20150702/12344.html)
* [探究UIScrollView](http://www.cocoachina.com/ios/20140512/8378.html)
* [UIScrollView实践经验](http://www.cocoachina.com/ios/20141216/10645.html)
* [使用UIScrollView结合UIImageView实现图片循环滚动](http://www.cocoachina.com/ios/20150806/12879.html)
* [滑动文本标签：一个类解决广告轮播](http://www.cocoachina.com/ios/20150813/13001.html)