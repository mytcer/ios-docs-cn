# UIStoryboardSegue

**简介**

一个`UIStoryboardSegue`对象表示故事板中的跳转事件连线，负责执行两个视图控制器之间的视觉过渡，它包含了涉及过渡的控制器的信息。当segue被触发且视觉过渡未发生前，正在运行的storyboard会调用当前的视图控制器的`prepareForSegue:sender:`方法，从而可以传送任何将要展示的数据到下一个视图控制器。

`UIStoryboardSegue`类支持UIKit提供的标准视觉过渡，你还可以从你的故事板文件中继承定义的视图控制器之间的自定义转换。



**注意**

* 你不用直接创建segue对象，当运行的故事板必须执行一个两个视图控制器之间的segue时会创建它们。
* 当运行的故事板检测到一个自定义的segue时，它会创建类的一个新实例，与视图控制器对象对其进行配置，要求源视图控制器为segue做准备，然后执行segue。
* 如果你的segue不需要携带附加的信息或者提供除了`perform`方法以外的任何方法，考虑使用`segueWithIdentifier:source:destination:performHandler:`方法代替。

<br>

***

<br>

### 参考资源

* [UIStoryboardSegue对象简介](http://2goo.info/weblog/detail/198143)
* [Storyboard里面的几种segue区别](http://www.2cto.com/kf/201210/161737.html)
* [关于自定义转场动画](http://www.cocoachina.com/ios/20150718/12600.html)
* [iOS 8自定义动画转场上手指南](http://www.cocoachina.com/ios/20150126/11011.html)