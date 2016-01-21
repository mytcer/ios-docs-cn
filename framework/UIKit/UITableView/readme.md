# UITableView

### 简介

表格列表视图


<br>
***
<br>


### API

**`- initWithFrame:style:`**

说明：初始化并返回一个拥有指定框架和风格的表格视图对象

注意：

* 当你创建表格视图时，必须指定一个风格。在表格视图创建后，风格是无法修改的。

* 如果你使用继承自`UIView`的`initWithFrame:`方法来初始化表格视图，则其默认风格为`UITableViewStylePlain`。

<br>


**`style`**

说明：只读，返回表格视图的风格。

<br>


**`- numberOfRowsInSection:`**

说明：返回指定的section中单元格的数量

注意：

* `UITableView`通过其数据源对象的该方法获得单元格的数量，并将其缓存起来。

<br>


**`numberOfSections`**

说明：只读，返回表格视图的section数量。

注意：

* `UITableView`通过其数据源对象的该方法获得section的数量，并将其缓存起来。

<br>


**`rowHeight`**

说明：可读写，表示每个单元格的高度，默认值为`UITableViewAutomaticDimension`。

注意：

* 高度的单位是点

* 如果你在Interface Builder中创建了一个自我调整大小的单元格，则该单元格的默认高度会调整为在Interface Builder中设置的值。

* 为了取得Interface Builder中创建的自我调整大小的单元格，你必须显示地将`rowHeight`属性值设置为`UITableViewAutomaticDimension`。

* 每当一个表格视图显示时，都会为每个单元格调用表格视图的代理方法`tableView:heightForRowAtIndexPath:`，当单元格数量大于等于1000个时，会导致显著的性能问题。

<br>


**`separatorStyle`**

说明：表格单元格分隔线的风格

<br>


**`separatorColor`**

说明：表格单元格分割线的颜色，默认为灰色（gray）。

<br>


**`separatorEffect`**

说明：应用于表格分割线的效果

注意：从iOS 8.0开始可用

<br>


**`backgroundView`**

说明：表格视图的背景视图

注意：

* 表格视图的背景视图会自动调整尺寸，以匹配表格视图的尺寸。

* 背景视图作为表格视图的一个子视图，位于所有单元格、页眉及页脚视图的后面。

* 设置表格视图的背景颜色时，必须将该属性值设置为nil。

<br>


**`separatorInset`**

说明：指定单元格分割线的默认内边距

注意：

* 从iOS 7开始，单元格分割线不会延伸到表格视图的边缘。

* 只有左右内边距的设置是有效的

例子：

```
tableView.separatorInset = UIEdgeInsetsMake(0, 3, 0, 11);

```
<br>


**`cellLayoutMarginsFollowReadableWidth`**

说明：布尔值，表示单元格的外边距是否来自于可读内容向导的宽度。

注意：从iOS 9.0开始可用

<br>


**`- registerNib:forCellReuseIdentifier:`**

说明：使用指定的重用标识符注册一个包含一个单元格的nib对象

注意：

* `identifier`参数不能是nil或空字符串

* 在使用指定标识符注册时，如果已经存在指定标识符的class或nib对象，且`nib`参数值不为nil，则会使用新的对象替代旧的。

* 你可以通过将`nib`参数值设置为nil，来注销指定标识符的nib对象。

<br>


**`- registerClass:forCellReuseIdentifier:`**

说明：注册一个用于创建新表格单元格的类

注意：

* `identifier`参数不能是nil或空字符串

* 在使用指定标识符注册时，如果已经存在指定标识符的class或nib对象，则会使用新的类替代旧的。

* 你可以通过将`cellClass`参数值设置为nil，来注销指定标识符的class。

<br>


**`- dequeueReusableCellWithIdentifier:forIndexPath:`**

说明：返回一个使用指定标识符的可重用表格单元格视图，并将其添加到表格中。

注意：

* `identifier`参数不能是nil或空字符串

* 一个表格视图维护着一个被数据源标记为重用的`UITableViewCell`对象队列

<br>


**`- dequeueReusableCellWithIdentifier:`**

说明：通过标识符来返回一个可重用的表格单元格视图

注意：

* `identifier`参数不能是nil

<br>


**`- registerNib:forHeaderFooterViewReuseIdentifier:`**

说明：使用指定的重用标识符注册一个包含一个表格视图页眉或页脚的nib对象

注意：

* `identifier`参数不能是nil或空字符串

* 在使用指定标识符注册时，如果已经存在指定标识符的class或nib对象，且`nib`参数值不为nil，则会使用新的对象替代旧的。

* 你可以通过将`nib`参数值设置为nil，来注销指定标识符的nib对象。

<br>


**`- registerClass:forHeaderFooterViewReuseIdentifier:`**

说明：注册一个用于创建表格视图页眉或页脚的类

注意：

* `identifier`参数不能是nil或空字符串

* 在使用指定标识符注册时，如果已经存在指定标识符的class或nib对象，则会使用新的类替代旧的。

* 你可以通过将`aClass`参数值设置为nil，来注销指定标识符的类。

<br>


**`- dequeueReusableHeaderFooterViewWithIdentifier:`**

说明：通过指定的标识符返回一个可重用的页眉或页脚视图

注意：

* `identifier`参数不能是nil

* 一个表格视图维护着一个被表格视图的代理标记为重用的`UITableViewHeaderFooterView`对象队列

<br>


**`tableHeaderView`**

说明：表格页眉视图，默认值为nil。

注意：

* 表格页眉视图与章节页眉（即section header）是不同的

<br>


**`tableFooterView`**

说明：表格页脚视图，默认值为nil。

注意：

* 表格页脚视图与章节页脚（即section footer）是不同的

<br>


**`sectionHeaderHeight`**

说明：表格视图中章节的页眉高度，非负值。

注意：

* 这个属性值仅用于表格视图的代理对象没有实现`tableView:heightForHeaderInSection:`方法的情况

<br>


**`sectionFooterHeight`**

说明：表格视图中章节的页脚高度，非负值。

注意：

* 这个属性值仅用于表格视图的代理对象没有实现`tableView:heightForFooterInSection:`方法的情况

<br>


**`- headerViewForSection:`**

说明：返回指定章节的页眉视图

<br>


**`- footerViewForSection:`**

说明：返回指定章节的页脚视图

<br>


**`- cellForRowAtIndexPath:`**

说明：返回指定索引路径中的表格单元格

注意：

* 如果单元格不可见，或indexPath越界，则返回nil。

<br>


**`- indexPathForCell:`**

说明：返回给定的表格单元格所在的索引路径

注意：

* 如果indexPath是无效的，则返回nil。

<br>


**`- indexPathForRowAtPoint:`**

说明：返回一个给定点所在的行对应的索引路径

注意：

* 如果点超出了任意行的边界，则返回nil。

<br>


**`- indexPathsForRowsInRect:`**

说明：返回一个给定的矩形所覆盖的行对应的索引路径

注意：

* 如果矩形没有覆盖任何行，则返回一个空数组。

<br>


**`visibleCells`**

说明：只读，返回表格视图中的可见单元格。

<br>


**`indexPathsForVisibleRows`**

说明：只读，返回表格视图可见行的索引路径。

注意：

* 如果没有可见行，则返回nil。

<br>


**`estimatedRowHeight`**

说明：表格视图的预估行高，默认值为0。

注意：

* 如果表格包含了可变高度的行，则在加载表格时，可能需要计算所有行的高度（这会影响表格的加载性能），而使用预估高度可以将一些几何计算的成本，从表格加载时间推迟到滚动时间，从而提高性能。

* 当你创建一个自我调整大小的表格单元格时，你需要设置该属性并通过约束来定义单元格的尺寸。

<br>


**`estimatedSectionHeaderHeight`**

说明：表格视图章节页眉的预估高度，默认值为0。

注意：

* 如果表格包含了可变高度的章节页眉，则在加载表格时，可能需要计算所有章节的页眉高度（这会影响表格的加载性能），而使用预估高度可以将一些几何计算的成本，从表格加载时间推迟到滚动时间，从而提高性能。

<br>


**`estimatedSectionFooterHeight`**

说明：表格视图章节页脚的预估高度，默认值为0。

注意：

* 如果表格包含了可变高度的章节页脚，则在加载表格时，可能需要计算所有章节的页脚高度（这会影响表格的加载性能），而使用预估高度可以将一些几何计算的成本，从表格加载时间推迟到滚动时间，从而提高性能。

<br>


**`- scrollToRowAtIndexPath:atScrollPosition:animated:`**

说明：滚动表格视图，直到索引路径标识的行位于屏幕上的指定位置。

注意：

* 调用此方法不会导致代理对象接收到`scrollViewDidScroll:`消息

<br>


**`- scrollToNearestSelectedRowAtScrollPosition:animated:`**

说明：滚动表格视图，以便于被选中的行靠近指定的位置。

<br>


**`indexPathForSelectedRow`**

说明：只读，返回选中行对应的索引路径。

注意：

* 如果索引路径是无效的，则返回nil。

* 如果选中了多个行，则返回选中行数组中第一个对象对应的索引路径。

<br>


**`indexPathsForSelectedRows`**

说明：只读，返回被选中的多个行对应的索引路径。

注意：

* 如果没有行被选中，则返回nil。

<br>


**`- selectRowAtIndexPath:animated:scrollPosition:`**

说明：通过指定的索引路径来选择一个表格行，并可选地将其滚动到表格视图中的指定位置。

注意：

* 调用该方法不会导致代理收到`tableView:willSelectRowAtIndexPath:`或`tableView:didSelectRowAtIndexPath:`消息，也不会导致`UITableViewSelectionDidChangeNotification`通知被发送。

* 将`scrollPosition`的参数值设置为`UITableViewScrollPositionNone`，将不会产生滚动。

例子：

```
// 滚动到最新选中的行
NSIndexPath *rowToSelect;
UITableView *myTableView;
[myTableView selectRowAtIndexPath:rowToSelect animated:YES scrollPosition:UITableViewScrollPositionNone];
[myTableView scrollToRowAtIndexPath:rowToSelect atScrollPosition:UITableViewScrollPositionNone animated:YES];
```

<br>


**`- deselectRowAtIndexPath:animated:`**

说明：通过指定的索引路径来取消选中一个表格行，并且可以设置这个取消选中是否带有动画效果。

注意：

* 调用该方法不会导致代理收到`tableView:willDeselectRowAtIndexPath:`或`tableView:didDeselectRowAtIndexPath:`消息，也不会导致`UITableViewSelectionDidChangeNotification`通知被发送。

* 调用此方法不会导致滚动到被取消选中的行

<br>


**`allowsSelection`**

说明：布尔值，表示是否允许用户选中表格行，YES表示允许。

注意：

* 该属性仅为影响非编辑模式下的表格行选中，编辑模式下需要通过`allowsSelectionDuringEditing`属性来设置。

<br>


**`allowsMultipleSelection`**

说明：布尔值，表示是否允许用户在非编辑模式下选中多个表格行，YES表示允许，默认值为NO。

<br>


**`allowsSelectionDuringEditing`**

说明：布尔值，表示是否允许用户在编辑模式下选中表格行，YES表示允许，默认值为NO。

<br>


**`allowsMultipleSelectionDuringEditing`**

说明：布尔值，表示是否允许用户在编辑模式下选中多个表格行，YES表示允许，默认值为NO。

<br>


**`- beginUpdates`**

说明：开始一系列的方法调用，像插入、删除、选中表格行和章节。

注意：

* 如果你想在表格视图中并发执行插入、删除、选中表格行和章节的操作，同时使用动画效果，那就调用该方法。

* 调用该方法之后，必须调用`endUpdates`。

* `beginUpdates`与`endUpdates`方法组可以嵌套使用

* 可以使用`beginUpdates`与`endUpdates`方法组，在不重载单元格的情况下，动画的改变单元格的高度。

* 如果你不将插入、删除、选中表格行和章节的操作放在`beginUpdates`与`endUpdates`方法组内，表格属性（如行数）可能会失效。

* 你不应该在`beginUpdates`与`endUpdates`方法组内调用`reloadData`方法

<br>


**`- endUpdates`**

说明：结束一系列的方法调用，像插入、删除、选中，或重载表格行和章节。

注意：

* 当你调用该方法时，表格视图会同时动画的执行插入、删除、选中，或重载表格行和章节的操作。

<br>


**`- insertRowsAtIndexPaths:withRowAnimation:`**

说明：将表格行插入到索引路径标识的指定位置，并可以指定是否以动画方式插入。

注意：

* 当在`beginUpdates`与`endUpdates`方法组内调用该方法时，表格视图会延迟任何行或章节的插入操作，直到它处理完行或章节的删除操作。

<br>


**`- deleteRowsAtIndexPaths:withRowAnimation:`**

说明：删除被指定索引路径标识的表格行，并可以指定是否以动画方式删除。

注意：

* 当在`beginUpdates`与`endUpdates`方法组内调用该方法时，表格视图会延迟任何行或章节的插入操作，直到它处理完行或章节的删除操作。

<br>


**`- moveRowAtIndexPath:toIndexPath:`**

说明：将表格行从指定位置移动到目标位置

注意：

* 该方法每次只能移动一个表格行，如果你想移动多行，可以在`beginUpdates`与`endUpdates`方法组内反复地调用该方法。

<br>


**`- insertSections:withRowAnimation:`**

说明：向表格视图中插入一个或多个章节，并可以指定是否以动画方式插入。

注意：

* 当在`beginUpdates`与`endUpdates`方法组内调用该方法时，表格视图会延迟任何行或章节的插入操作，直到它处理完行或章节的删除操作。

<br>


**`- deleteSections:withRowAnimation:`**

说明：从表格视图中删除一个或多个章节，并可以指定是否以动画方式删除。

注意：

* 当在`beginUpdates`与`endUpdates`方法组内调用该方法时，表格视图会延迟任何行或章节的插入操作，直到它处理完行或章节的删除操作。

<br>


**`- moveSection:toSection:`**

说明：在表格视图中，将一个章节移动到新位置。

注意：

* 该方法每次只能移动一个表格章节，如果你想移动多个章节，可以在`beginUpdates`与`endUpdates`方法组内反复地调用该方法。

<br>


**`editing`**

说明：布尔值，用于表明表格视图是否处于编辑模式，默认值为NO。

注意：

* 当表格处于编辑模式时，每个单元格的左边可能会显示一个插入或删除控件，右边可能会显示一个排序控件，这些都取决于如何配置单元格。

* 轻击一个控件会导致表格视图调用数据源的`tableView:commitEditingStyle:forRowAtIndexPath:`方法

<br>


**`- setEditing:animated:`**

说明：切换表格视图的编辑模式状态

<br>


**`- reloadData`**

说明：重载表格视图的行和章节

注意：

* 为了提高效率，表格视图只会重新显示可见的行。

* 你不应该在`beginUpdates`与`endUpdates`方法组内调用`reloadData`方法

<br>


**`- reloadRowsAtIndexPaths:withRowAnimation:`**

说明：使用指定的动画效果重载指定的表格行

注意：

* 当在`beginUpdates`与`endUpdates`方法组内调用该方法时，它的行为类似于`deleteRowsAtIndexPaths:withRowAnimation:`。

<br>


**`- reloadSections:withRowAnimation:`**

说明：使用指定的动画效果重载指定的表格章节

注意：

* 当在`beginUpdates`与`endUpdates`方法组内调用该方法时，它的行为类似于`deleteSections:withRowAnimation:`。

<br>


**`- reloadSectionIndexTitles`**

说明：重载表格视图右侧的索引栏项目

注意：

* 该方法提供了一种插入或删除表格章节后，在不重载整个表格的情况下，更新章节索引的方法。

<br>


**`- rectForSection:`**

说明：返回表格视图指定章节的绘制区域

<br>


**`- rectForRowAtIndexPath:`**

说明：返回被指定索引路径标识的表格行的绘制区域，如果索引路径是无效的，则返回CGRectZero。

<br>


**`- rectForFooterInSection:`**

说明：返回指定章节页脚的绘制区域

<br>


**`- rectForHeaderInSection:`**

说明：返回指定章节页眉的绘制区域

<br>


**`dataSource`**

说明：表格视图的数据源对象

注意：

* 数据源对象必须遵循`UITableViewDataSource`协议

* 它是非持有的（不会增加数据源对象的引用计数）

<br>


**`delegate`**

说明：表格视图的代理对象

注意：

* 代理对象必须遵循`UITableViewDelegate`协议

* 它是非持有的（不会增加代理对象的引用计数）

<br>


**`sectionIndexMinimumDisplayRowCount`**

说明：表示在表格视图的第几行显示右边的索引列表，默认值为0。

注意：

* 此属性仅适用于风格为`UITableViewStylePlain`的表格视图

<br>


**`sectionIndexColor`**

说明：表格视图索引文本的颜色

注意：

* 当属性值为nil时，表示使用默认颜色。

<br>


**`sectionIndexBackgroundColor`**

说明：表格视图的章节索引在没有被触摸时的背景颜色

注意：

* 当属性值为nil时，表示使用默认颜色。

<br>


**`sectionIndexTrackingBackgroundColor`**

说明：表格视图的章节索引被触摸时的背景颜色

注意：

* 当属性值为nil时，表示使用默认颜色。

<br>


**`UITableViewSelectionDidChangeNotification`**

说明：当被选中的行发生改变时，发送该通知。

注意：

* 该通知没有对应的`userInfo`字典数据


<br>
***
<br>


### 参考资源

<br>
***
<br>


### 经验

* 如何去掉表格单元格分割线左边的空白？

```
tableView.separatorInset = UIEdgeInsetsZero;
```

* 如何去掉表格单元格底部的分割线？

```
tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
```

* 如何设置表格分组之间的间隔？

```
// 将表格的风格设置为UITableViewStyleGrouped，然后实现下面的协议方法

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01; // 由于设置0无效，这里设置一个接近于0的数，从视觉上让header不可见
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10; // 你期望的间隔距离
}
```
