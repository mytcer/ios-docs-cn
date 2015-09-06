# UIPanGestureRecognizer

**简介**

它是`UIGestureRecognizer`类的具体子类，表示平移手势。在用户平移时，必须在一个视图上按下一个或多个手指。平移手势是连续的，当指定数量的手指按下且移动了足够距离时，手势的状态变为`UIGestureRecognizerStateBegan`。当指定数量的手指按下并发生移动时，手势状态变更为`UIGestureRecognizerStateChanged`。当所有手指都取消触摸后，手势状态变更为`UIGestureRecognizerStateEnded`。