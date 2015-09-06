# UIResponder

**简介**

该类为对象定义了响应及处理事件的接口，它是`UIApplication`、`UIView`及其子类的超类。

有两种类型的事件：触摸事件和运动事件。触摸事件的主要处理方法是：`touchesBegan:withEvent:`，`touchesMoved:withEvent:`，`touchesEnded:withEvent:`，`touchesCancelled:withEvent:`；运动事件的处理方法是：`motionBegan:withEvent:`，`motionEnded:withEvent:`，`motionCancelled:withEvent:`。



**注意**

* 从iOS4.0开始，可以通过`remoteControlReceivedWithEvent:`方法来处理远程控制事件。