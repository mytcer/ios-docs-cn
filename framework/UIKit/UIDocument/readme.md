# UIDocument

**简介**

它是一个管理文档数据的抽象基类，使用它及其底层架构的应用程序将获得很多处理文档的好处：

* 在后台队列中异步的读写数据，不会影响应用程序对用户的响应。
* 与云服务自动集成的文档文件读写协调。
* 支持在两个不同版本的文档间发现冲突。
* 写数据时先写入一个临时文件，然后用它替换掉当前文档文件，以此来确保安全的保存文档数据。
* 在适当的时刻自动保存文档数据。

<br>

**文档的生命周期**

1. 创建或打开一个新文档
2. 用户编辑文档
3. 用户请求将文档与云服务集成（可选）
4. 用户关闭文档

<br>

**修改跟踪**

`UIDocument`会定期检查`hasUnsavedChanges`方法是否返回YES，如果是，则启动文档的保存操作。在你的`UIDocument`子类中，有两种主要方式来实现修改跟踪：

* 调用`NSUndoManager`类的方法来实现撤销和重做，你可以通过`UIDocument`对象的`undoManager`属性来获取默认的`NSUndoManager`对象。这是首选的方法，特别是针对已支持撤销和重做的现有应用。
* 在适当的时候调用`updateChangeCount:`方法。

<br>

**说明**

* `UIDocument`对象实现了`NSFilePresenter`协议的所有方法。
* 在一个`UIDocument`子类中，如果覆盖了一个`NSFilePresenter`方法，你依然可以调用父类的实现。

<br>

**注意**

* 一个基于文档的应用程序，必须为它的文档创建一个`UIDocument`的子类。
* 如果你使用一个数据库来存储文档数据，那么就创建一个`UIManageDocument`的子类来代替`UIDocument`（注：`UIManageDocument`是`UIDocument`的子类）。
* `UIDocument`对象不支持管理文档视图。