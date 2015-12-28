# UIView

### 简介

视图基类

<br>
***
<br>


### API

**`- initWithFrame:`**

说明：初始化方法

<br>


**`backgroundColor`**

说明：背景色，默认值为nil，即透明背景。

<br>


**`hidden`**

说明：布尔值，表示视图是否隐藏，默认值为NO。

<br>


**`alpha`**

说明：视图的alpha值

<br>


**`opaque`**

说明：布尔值，表示视图是否是不透明的，默认值为YES。

<br>


**`tintColor`**

说明：它定义了一个非默认的着色颜色值，它会影响到以该视图为根视图的整个视图层级。

注意：

* 默认情况下，一个视图的`tintColor`为nil，这意味着视图将使用父视图的`tintColor`值。

* 当我们指定了一个视图的`tintColor`后，这个色值会自动传播到以当前视图为根视图的视图层级中的所有子视图上。

* 如果系统在视图层级中没有找到一个非默认的`tintColor`值，则会使用系统定义的颜色值。

<br>


**`tintAdjustmentMode`**

说明：枚举值，它定义了tint color的调整模式。

注意：当你查询该属性值时，如果系统无法在子视图层级中找到一个非缺省值，返回`UIViewTintAdjustmentModeNormal`。

<br>


**`clipsToBounds`**

说明：布尔值，表示是否将子视图限制在视图的边界内。

<br>


**`clearsContextBeforeDrawing`**

说明：布尔值，表示在视图重画之前是否先清理视图以前的内容，默认值为YES。

注意：如果视图的`opaque`属性值设置为YES，则`backgroundColor`的属性值就不能为nil，否则可能发生错误。

<br>


<br>
***
<br>


### 注意

* 如果多次调用`setNeedsDisplay`方法，系统只会执行一次`drawRect`方法。
* 视图被添加到父视图后，并不会马上显示在屏幕上，而是会在执行完`viewWillAppear`方法后、`viewDidAppear`方法前执行绘制.
* 下列属性支持动画：
	* frame
	* bounds
	* center
	* transform
	* alpha
	* backgroundColor
	* contentStretch


<br>
***
<br>


### 参考资源

* [对drawRect和setNeedsDisplay的理解](http://blog.csdn.net/jkwmscq/article/details/47020699)
* [详解UIView的Tint Color属性](http://www.cocoachina.com/ios/20150703/12363.html?utm_medium=referral&utm_source=pulsenews)
