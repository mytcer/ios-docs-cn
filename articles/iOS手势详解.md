# iOS手势详解

### 一. UIKit预定义的手势

* UITapGestureRecognizer -- 敲击（单击或双击）手势
* UIPanGestureRecognizer -- 拖动手势
* UIPinchGestureRecognizer -- 缩放手势
* UISwipeGestureRecognizer -- 轻扫手势
* UIRotationGestureRecognizer -- 旋转手势
* UILongPressGestureRecognizer -- 长按手势

<br>

***

<br>

### 二. 手势的类型

手势不是离散的就是连续的：

* 一个离散的手势（如tap），只发生一次；一个连续的手势（如pinch），发生在一个时间段内。

* 离散手势的手势识别器只会发送一次消息给它的目标；而连续手势的手势识别器会持续发送消息给目标，直到触摸序列停止。

<br>

***

<br>

### 三. 手势识别状态

手势识别器的所有状态如下：

* UIGestureRecognizerStatePossible -- 不确定，所有手势识别器开始都处于该状态
* UIGestureRecognizerStateBegan -- 手势开始
* UIGestureRecognizerStateChanged -- 手势改变
* UIGestureRecognizerStateCancelled -- 手势已取消
* UIGestureRecognizerStateFailed -- 识别失败
* UIGestureRecognizerStateRecognized -- 已识别
* UIGestureRecognizerStateEnded -- 结束（注意：它是“已识别”状态的同义词）

手势识别状态的变化，取决于手势识别器是离散的还是连续的：

* 对于一个离散的手势识别器而言，如果识别出了手势，则识别状态从“不确定”迁移到“已识别”，否则迁移到“识别失败”。

* 对于一个连续的手势识别器而言，
	1. 当手势识别器第一次识别出手势时，识别状态会从“不确定”迁移到“开始”。
	2. 然后，它会从“开始”状态迁移到“改变”状态，并且在手势发生时持续地从“改变”状态迁移到“改变”状态。
	3. 当用户的最后一个手指从视图上举起离开的时候，识别状态会迁移到“结束”状态，手势识别至此完成。
	4. 如果识别器确定当前手势不再符合期望的模式，识别状态从“改变”状态迁移到“取消”状态。
	
> 注意：
> 
> * 手势识别器每次改变状态时，会向它的目标发送一条消息，除非它迁移到了“失败”状态或“取消”状态。因此，一个离散的手势识别器在它从“不确定”迁移到“已识别”状态时，只会发送一条动作消息。一个连续的手势识别器在它改变状态时，会发送很多条动作消息。
>
> * 当一个手势识别器迁移到了“已识别”（或“结束”）状态时，它将重置它的状态到“不确定”，状态往回迁移到“不确定”，不会向目标发送消息。


<br>

***

<br>

### 四. 将手势与view关联

> 注意：每一个特定的手势必须关联到view对象中才会有作用，一个view对象可以关联多个不同的特定手势，但是每一个特定的手势只能与一个view相关联。当用户触摸了view，对应的手势识别器就会接收到消息，以响应特定的触摸事件。

例子：给视图关联一个拖动手势

```
UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]
initWithTarget:self action:@selector(handlerPanGesture:)];
panGestureRecognizer.delegate = self;
panGestureRecognizer.maximumNumberOfTouches = 2;
panGestureRecognizer.minimumNumberOfTouches = 2;
[self.view addGestureRecognizer:_panGestureRecognizer];

```

<br>

***

<br>

### 五. 参考资料

* [iOS事件处理指南-手势识别器](http://www.jianshu.com/p/0a63aefd6293)