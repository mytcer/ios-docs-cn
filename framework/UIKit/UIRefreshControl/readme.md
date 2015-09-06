# UIRefreshControl

**简介**

它提供了一个用于启动表格视图内容刷新的标准控件。要使用该控件，除了将该控件设置为`UITableViewController`的`refreshControl`属性值外，还必须配置控件自身的目标和动作。该控件不会直接启动刷新操作，而是在刷新操作发生时发送`UIControlEventValueChanged`事件，你必须为此事件指定一个动作方法并执行其他所需的动作。



**注意**

* 它只能在`UITableViewController`管理的表格视图中使用。
* 拥有一个刷新控件的`UITableViewController`对象负责设置该控件的边框矩形，因此不需要在你的视图层次里管理控件的大小和位置。