# UIImageView

**简介**



**注意**

* `UIImageView`是经过官方优化的图像显示控件，它的子类不会调用`drawRect:`方法，如果你的子类需要自定义`drawRect:`方法，只能从继承`UIView`类。
* `UIImageView`被默认配置为无视用户事件，如果你想在`UIImageView`的子类中处理用户事件，必须在初始化子类后显示地将`userInteractionEnabled`属性的值设置为YES。