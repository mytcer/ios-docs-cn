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


**`- exchangeSubviewAtIndex:withSubviewAtIndex:`**

说明：将`subviews`列表中指定索引处的两个子视图互换位置

注意：该方法不会改变子视图的父视图，只是互换一下它们在`subviews`数组中的位置。

<br>


**`- isDescendantOfView:`**

说明：返回一个子视图，表示当前视图是否为给定视图的子视图，或是否与给定视图为同一个视图。

<br>


**`autoresizingMask`**

说明：它用于决定当父视图的边界改变时，视图如何重新调整自己的大小，默认值为`UIViewAutoresizingNone`（即视图始终不会调整大小）。

<br>


**`autoresizesSubviews`**

说明：布尔值，表示当前视图的边界发生改变时，是否自动调整其子视图，默认值为YES。

<br>


**`contentMode`**

说明：它用于决定当视图的边界发生改变时，如何对视图的内容进行布局，默认值为`UIViewContentModeScaleToFill`。

<br>


**`- sizeThatFits:`**

说明：要求视图计算并返回最适合其子视图的尺寸

注意：

* 该方法的默认实现返回视图的现有大小

* 该方法不会调整当前视图的大小

<br>


**`- sizeToFit`**

说明：调整并移动视图，使它能包围它的子视图。

注意：

* 当你想要调整当前视图的尺寸时，调用该方法，以便于它使用最合适的尺寸。

* 你不能覆盖该方法，如果你想改变你的视图的默认尺寸信息，覆盖`sizeThatFits:`方法。

<br>


**`- layoutSubviews`**

说明：布局子视图

注意：

* 不要直接调用该方法

<br>


**`- setNeedsLayout`**

说明：废止视图的当前布局并在下一个布局更新期间触发一个新的布局

注意：

* 当你想调整一个视图的子视图布局时，在应用的主线程中调用那个视图的该方法。

* 这个方法不会强制立即更新，而是等待下一个更新周期，你可以使用它来废止之前多个视图的布局更新。这种行为可以让你将所有的布局更新放到一个更新周期内，这通常会带来更好的性能。

<br>


**`- layoutIfNeeded`**

说明：立即布局子视图

<br>


**`+ requiresConstraintBasedLayout`**

说明：返回布尔值，表示当前视图是否依赖基于约束的布局系统。

<br>


**`translatesAutoresizingMaskIntoConstraints`**

说明：返回布尔值，表示是否需要将视图从Autoresizing（即`autoresizingMask`属性值表示的自动调整模式）转换到基于约束的自动布局。

注意：

* 通过程序创建的视图，该属性的默认值为YES；通过Interface Builder创建的视图，系统自动将该属性设置为NO。

<br>


**`bottomAnchor`**

说明：只读，它是一个表示视图框架底部边缘的布局锚点，可用它创建视图底部边缘的约束。

注意：

* 从iOS 9.0开始可用

<br>


**`centerXAnchor`**

说明：只读，它是一个表示视图框架水平中心的布局锚点，可以用它创建视图水平中心的约束。

注意：

* 从iOS 9.0开始可用

<br>


**`centerYAnchor`**

说明：只读，它是一个表示视图框架垂直中心的布局锚点，可以用它创建视图垂直中心的约束。

注意：

* 从iOS 9.0开始可用

<br>


**`firstBaselineAnchor`**

说明：只读，它是一个表示视图中顶行文本基线的布局锚点，可用它创建基线约束。

注意：

* 从iOS 9.0开始可用

<br>


**`heightAnchor`**

说明：只读，它是一个用于表示视图高度的布局锚点，可用它创建视图的高度约束。

注意：

* 从iOS 9.0开始可用

<br>


**`lastBaselineAnchor`**

说明：只读，它是一个表示视图中底部文本基线的布局锚点，可用它创建基线约束。

注意：

* 从iOS 9.0开始可用

<br>


**`leadingAnchor`**

说明：只读，它是一个表示视图框架行距的布局锚点，可用它创建视图的行距约束。

注意：

* 从iOS 9.0开始可用

<br>


**`leftAnchor`**

说明：只读，它是一个表示视图框架左边距的布局锚点，可用它创建视图的左边距约束。

注意：

* 从iOS 9.0开始可用

<br>


**`rightAnchor`**

说明：只读，它是一个表示视图框架右边距的布局锚点，可用它创建视图的右边距约束。

注意：

* 从iOS 9.0开始可用

<br>


**`topAnchor`**

说明：只读，它是一个表示视图框架顶边距的布局锚点，可用它创建视图的顶边距约束。

注意：

* 从iOS 9.0开始可用

<br>


**`trailingAnchor`**

说明：只读，它是一个表示视图框架尾随距离的布局锚点，可用它创建视图的尾随距离约束。

注意：

* 从iOS 9.0开始可用

<br>


**`widthAnchor`**

说明：只读，它是一个表示视图宽度的布局锚点，可用它创建视图的宽度约束。

注意：

* 从iOS 9.0开始可用

<br>


**`constraints`**

说明：只读，返回视图持有的布局约束。

<br>


**`- addConstraint:`**

说明：给当前视图或其子视图添加一个布局约束

注意：对于iOS 8.0+，可以通过将约束对象的`active`属性设置为YES来替代该方法，设置为YES后，会自动将约束添加到正确的视图上。

<br>


**`- addConstraints:`**

说明：给当前视图或其子视图添加多个布局约束

注意：对于iOS 8.0+，可用使用`NSLayoutConstraint`的`activateConstraints:`方法来替代该方法，它会自动将约束添加到正确的视图上。

<br>


**`- removeConstraint:`**

说明：从当前视图中移除指定的布局约束

注意：对于iOS 8.0+，可以通过将约束对象的`active`属性设置为NO来替代该方法，设置为NO后，它会将约束从正确的视图上移除。

<br>


**`- removeConstraints:`**

说明：从当前视图或其子视图移除多个布局约束

注意：对于iOS 8.0+，可用使用`NSLayoutConstraint`的`deactivateConstraints:`方法来替代该方法，它会自动将约束从正确的视图上移除。

<br>


**`- addLayoutGuide:`**

说明：给视图添加一个指定的UILayoutGuide对象

注意：

* 该方法会将指定的layoutGuide添加到视图的`layoutGuides`数组的末尾

* 当前视图也被赋值给layoutGuide对象的`owningView`属性

* 从iOS 9.0开始可用

<br>


**`layoutGuides`**

说明：只读，表示当前视图拥有的UILayoutGuide对象

注意：从iOS 9.0开始可用

<br>


**`layoutMarginsGuide`**

说明：只读，它是一个UILayoutGuide对象，表示视图外边距，可以使用这个UILayoutGuide对象的锚点来创建视图的外边距约束。

注意：从iOS 9.0开始可用

<br>


**`readableContentGuide`**

说明：只读，它是一个UILayoutGuide对象，用于表示视图内的一个可读宽度区域。

注意：

* 从iOS 9.0开始可用

<br>


**`- removeLayoutGuide:`**

说明：从视图中删除指定的layoutGuide

注意：

* 该方法会将指定的layoutGuide从视图的`layoutGuides`数组中移除

* 被移除layoutGuide对象的`owningView`属性，其值同时被设置为nil。

* 从iOS 9.0开始可用

<br>


**`- systemLayoutSizeFittingSize:`**

说明：返回满足视图持有之约束的尺寸

<br>


**`- systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:`**

说明：返回满足视图持有之约束的尺寸

注意：

* 从iOS 8.0开始可用

<br>


**`- intrinsicContentSize`**

说明：返回视图的自然大小（只考虑视图本身的属性），默认值为`UIViewNoIntrinsicMetric`。

<br>


**`- invalidateIntrinsicContentSize`**

说明：废止视图的内在内容大小

<br>


**`- contentCompressionResistancePriorityForAxis:`**

说明：返回在指定轴线上缩小视图内在大小的优先级

注意：

* 子类不应该覆盖该方法，而应该在创建自定义视图时设置默认值，通常是`NSLayoutPriorityDefaultLow`或`NSLayoutPriorityDefaultHigh`。

<br>


**`- setContentCompressionResistancePriority:forAxis:`**

说明：设置指定轴线上缩小视图内在大小的优先级

注意：

* 子类不应该覆盖该方法

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
* [细数AutoLayout以来UIView和UIViewController新增的相关API](http://www.cocoachina.com/ios/20141026/10045.html)
