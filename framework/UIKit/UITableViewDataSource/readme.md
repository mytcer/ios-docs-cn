# UITableViewDataSource

### 简介

它是表格视图的数据源对象需要采用的协议，数据源为表格视图对象提供了构建和修改表格视图所需要的信息。


<br>
***
<br>


### API

**`- tableView:cellForRowAtIndexPath:`**

说明：必选，用于向数据源请求一个单元格来插入到表格视图中的特定位置。

注意：

* 出于性能考虑，你应该在该方法内通过`dequeueReusableCellWithIdentifier:`方法来返回一个重用的单元格。

<br>


**`- tableView:numberOfRowsInSection:`**

说明：必选，请求数据源返回指定表格章节的行数。

<br>


**`- numberOfSectionsInTableView:`**

说明：请求数据源返回表格视图的章节数量，默认值为1。

<br>


**`- sectionIndexTitlesForTableView:`**

说明：要求数据源返回表格视图的章节标题

注意：

* 表格视图的风格必须是`UITableViewStylePlain`

<br>


**`- tableView:sectionForSectionIndexTitle:atIndex:`**

说明：要求数据源返回拥有指定标题和标题索引的章节的索引值

注意：

* 仅在表格视图带一个章节索引列表时，才需要实现该方法。

* 通过`sectionIndexTitlesForTableView:`方法返回的章节标题数量，可以比实际的表格章节数量少。

<br>


**`- tableView:titleForHeaderInSection:`**

说明：要求数据源返回表格视图中指定章节的页眉标题

注意：

* 表格视图为页眉标题使用固定的字体样式，如果你想有一个不同的字体样式，可以在代理方法`tableView:viewForHeaderInSection:`中返回一个自定义视图来替代。

<br>


**`- tableView:titleForFooterInSection:`**

说明：要求数据源返回表格视图中指定章节的页脚标题

注意：

* 表格视图为页脚标题使用固定的字体样式，如果你想有一个不同的字体样式，可以在代理方法`tableView:viewForFooterInSection:`中返回一个自定义视图来替代。

<br>


**`- tableView:commitEditingStyle:forRowAtIndexPath:`**

说明：要求数据源提交在表格视图中插入或删除一个表格行的操作

注意：

* 数据源通过调用表格视图的`insertRowsAtIndexPaths:withRowAnimation:`或`deleteRowsAtIndexPaths:withRowAnimation:`方法，来提交插入或删除操作。

* 想实现滑动删除，就必须实现该方法。

* 你不应该在该方法内调用`setEditing:animated:`，如果你因为一些原因而必须这么做，那就通过`performSelector:withObject:afterDelay:`方法来延迟调用。

<br>