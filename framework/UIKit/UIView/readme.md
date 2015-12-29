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


**`maskView`**

说明：一个可选的视图，它的alpha通道用来遮盖一个视图的内容。

注意：从iOS 8.0开始可用

<br>


**`+ layerClass`**

说明：返回用于创建核心动画层实例的类

<br>


**`layer`**

说明：只读，返回视图的核心动画层。

注意：

* 该属性的值永远不会是nil

* 当前layer的代理对象就是当前视图，所以不要将当前视图设置为另一个CALayer对象的代理，也不要改变当前layer的代理对象。

<br>


**`userInteractionEnabled`**

说明：布尔值，表示是否忽略用户事件并从事件队列移除，默认值为YES（表示不忽略）。

注意：在动画期间，无论该属性的值是什么，所有视图的用户交互都会被暂时禁用。你可以在配置动画时，通过设置`UIViewAnimationOptionAllowUserInteraction`选项来禁止该行为。

<br>


**`multipleTouchEnabled`**

说明：布尔值，表示是否视图是否支持多点触摸事件，默认值为NO。

注意：如果你只想让当前视图多点触摸事件，可以在将设置该属性为YES的同时，将`exclusiveTouch`设置为YES。

<br>


**`exclusiveTouch`**

说明：布尔值，表示是否只允许当前视图处理触摸事件，默认值为NO。

注意：将该属性值设置为YES后，当前视图会阻止触摸事件转发到同一窗口中的其他视图。

<br>


**`frame`**

说明：它用来描述当前视图在其父视图坐标系统中的位置和尺寸

注意：

* 如果你想在`frame`属性改变时自调用视图的`drawRect:`方法，就将`contentMode`的属性值设置为`UIViewContentModeRedraw`。

<br>


**`bounds`**

说明：它用来描述当前视图在自己坐标系统中的位置和尺寸，默认的原点是`(0,0)`，尺寸则和`frame`的尺寸一致。

<br>


**`center`**

说明：当前视图`frame`的中心点

注意：

* 中心点是在父视图的坐标系统中指定的

* 设置该属性会改变相应地`frame`属性的值

<br>


**`transform`**

说明：指定应用于当前视图的变换，变换的原点即为当前视图的`center`属性值，或当前视图layer的`anchorPoint`属性（如果该属性值发生了改变），默认值为`CGAffineTransformIdentity`。

<br>


**`superview`**

说明：只读，返回当前视图的父视图，如果没有父视图，则返回nil。

<br>


**`subviews`**

说明：只读，返回当前视图的直接子视图。

<br>


**`window`**

说明：只读，返回当前视图所在的窗口对象，如果没有，则返回nil。

<br>


**`- addSubview:`**

说明：添加一个视图到当前视图子视图列表的末尾

注意：视图只能有一个父视图，如果被添加的视图已经有了父视图且该视图不是接受者，那么该方法会在当前视图成为被添加视图新的父视图前，移除被添加视图原有的父视图。

<br>


**`- bringSubviewToFront:`**

说明：移动指定的子视图，让它出现在其兄弟视图的最顶部。

注意：该方法实际上是将目标子视图移动到`subviews`列表的末尾

<br>


**`- sendSubviewToBack:`**

说明：移动指定的子视图，让它出现在其兄弟视图的最后面。

注意：该方法实际上是将目标子视图移动到`subviews`列表的队首

<br>


**`- removeFromSuperview`**

说明：从当前视图的父视图及当前视图所在的窗口中分离视图，并将其从响应者链中删除。

注意：不要在当前视图的`drawRect:`方法调用该方法

<br>


**`- insertSubview:atIndex:`**

说明：在`subviews`列表的指定位置插入一个子视图

<br>


**`- insertSubview:aboveSubview:`**

说明：在视图层级里另一个视图的上面插入指定视图

<br>


**`- insertSubview:belowSubview:`**

说明：在视图层级里另一个视图的下面插入指定视图

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
