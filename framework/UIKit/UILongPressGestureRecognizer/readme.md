# UILongPressGestureRecognizer

**简介**

它是`UIGestureRecognizer`的具体子类，表示长按手势。长按手势是连续的，当指定数量的手指（`numberOfTouchesRequired`）已经按下并保持了指定时间（`minimumPressDuration`），且接触没有超出允许的活动范围（`allowableMovement`），手势开始（`UIGestureRecognizerStateBegan`）。当手指移动时，手势识别器转换到状态改变，当任一手指解除接触时，手势结束（`UIGestureRecognizerStateEnded`）。



**注意**

* 用户必须在一个视图上按下一个或多个手指且保持一段时间才能触发动作。
* 当用户按下手指后，手指的移动不能超过指定的距离，否则手势会失败。