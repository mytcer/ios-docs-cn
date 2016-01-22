# UITableViewDelegate

### 简介

它是表格视图代理对象必须采用的协议


<br>
***
<br>


### API

**`- tableView:heightForRowAtIndexPath:`**

说明：要求代理对象返回指定位置的表格行高度。

注意：

* 如果你实现了该方法，那么表格视图的`rowHeight`属性值会被覆盖。

* 使用该方法替代`rowHeight`属性来设置表格行的高度，会带来性能影响，因为每次表格视图被显示时，都会为每个表格行调用一次该方法。当表格视图的表格行数较多时（大于等于1000行），会导致显著地性能问题。

* 该方法返回的行高不要大于2009

<br>


**`- tableView:estimatedHeightForRowAtIndexPath:`**

说明：要求代理对象返回指定位置的表格行的预估高度

注意：

* 如果没有预估值，则返回`UITableViewAutomaticDimension`。

* 当表格包含可变高度的表格行时，就得通过`- tableView:heightForRowAtIndexPath:`方法来计算所有的行高，这会影响表格的载入时间，而通过设置预估高度，可以将一些几何计算从加载时间延迟到滚动时间（注：从实际体验来看，由于滚动时需要计算高度，可能会影响滚动的流畅度），从而提高表格的加载性能。

<br>


**`- tableView:indentationLevelForRowAtIndexPath:`**

说明：要求代理对象返回表格行在指定章节中的缩进距离

<br>


**`- tableView:willDisplayCell:forRowAtIndexPath:`**

说明：告诉代理对象，表格视图将为特定行绘制一个单元格。

<br>


**`- tableView:editActionsForRowAtIndexPath:`**

说明：要求代理对象为指定行中的滑动行为提供响应动作，每个动作都用于创建一个用户可点击的按钮，（如向左滑动后，右侧出现"删除"、"置顶"按钮）。

注意：

* 当你想为表格行提供自定义的动作时，可以使用该方法来实现。

* 如果你没有实现该方法，那么当用户在表格行上水平滑动时，表格视图会显示标准附件按钮。

* 从iOS 8.0开始可用

<br>