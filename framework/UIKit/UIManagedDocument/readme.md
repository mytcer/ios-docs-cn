# UIManagedDocument

**简介**

它是`UIDocument`的具体子类，与Core Data相集成。当你创建一个`UIManagedDocument`的实例，需要指定文档位置的URL，之后文档对象会创建一个Core Data堆栈，用于访问文档对象的持久化存储。

`UIManagedDocument`执行所有你需要为Core Data做的基本设置，你可以通过子类化`UIManagedDocument`来执行额外的定制：

* 覆盖`persistentStoreName`方法来自定义持久化存储文件的名称。
* 覆盖`managedObjectModel`属性来自定义创建托管对象模型。
* 覆盖`persistentStoreTypeForFileType:`方法来自定义文档使用的持久化存储类型。
* 覆盖`configurePersistentStoreCoordinatorForURL:ofType:modelConfiguration:storeOptions:error:`方法来自定义持久化存储的加载或创建。



**捕获错误**

为了允许应用程序观察和捕获在保存和校验管理文档的过程中出现的错误，你必须子类化`UIManagedDocument`并覆盖下列一个或全部方法（注：继承至`UIDocument`类）：

* `handleError:userInteractionPermitted:`
* `finishedHandlingError:recovered:`

覆盖是必须的，否则，你的应用程序只能收到`UIDocumentStateChangedNotification`通知信息，不会包含`userInfo`字典及特定的错误信息。