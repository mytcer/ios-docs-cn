# UIUserNotificationSettings

**简介**

它封装了通知的类型，应用程序在使用通知时必须登记他们使用的通知类型，UIKit根据应用程序注册的通知类型和用户偏好来决定你的应用程序可以使用的通知类型。

使用这个类来封装你的初始注册请求并查看请求的结果，在你创建一个该类的实例并指定你的首选设置后，调用`UIApplication`类的`registerUserNotificationSettings:`方法来注册这些设置。在检查完你的设置请求和用户偏好后，应用程序将结果发送给应用程序代理对象的`application:didRegisterUserNotificationSettings:`方法，这个结果就表明你的应用程序可以使用什么类型的通知。

除了注册应用程序的警报类型，你也可以使用这个类来注册自定义操作组和通知一起显示。自定义操作表示当前任务的应用程序可以对通知作出响应。定义行动组并与给定的通知相关联，显示相应的警报时，系统会给每个动作增加按钮，当用户点击一个按钮时，系统会唤醒你的应用程序，并调用`application:handleActionWithIdentifier:forRemoteNotification:completionHandler:`或`application:handleActionWithIdentifier:forLocalNotification:completionHandler:`方法，通过这些方法来执行请求的操作。

<br>

***

<br>

### 参考资源

* [iOS 8创建交互式通知](http://www.cocoachina.com/ios/20141009/9857.html)