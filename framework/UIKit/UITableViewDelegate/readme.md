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


**`- tableView:accessoryButtonTappedForRowWithIndexPath:`**

说明：告诉代理对象，用户点击了指定行的附加视图。

<br>


**`- tableView:willSelectRowAtIndexPath:`**

说明：告诉代理对象，指定的行将要被选中。

注意：

* 如果你不想让行选中，那就返回nil。

* 除非`allowsSelectionDuringEditing`属性值设置为YES，否则在编辑模式下是不会调用该方法的。

<br>


**`- tableView:didSelectRowAtIndexPath:`**

说明：告诉代理对象，指定的行已被选中。

注意：

* 当表格处于编辑模式时，该方法不会被调用。

<br>


**`- tableView:willDeselectRowAtIndexPath:`**

说明：告诉代理对象，指定的行将要被取消选中。

注意：

* 如果你不想让行被选中，那就返回nil。

* 该方法仅在一种情况下调用：已经有一个表格行被选中，而用户想选中另一个表格行时。

<br>


**`- tableView:didDeselectRowAtIndexPath:`**

说明：告诉代理对象，指定的行已被取消选中。

<br>


**`- tableView:viewForHeaderInSection:`**

说明：要求代理对象为表格章节的页眉提供一个视图

注意：

* 仅当实现了`tableView:heightForHeaderInSection:`方法时，该方法才会正常工作。

<br>


**`- tableView:viewForFooterInSection:`**

说明：要求代理对象为表格章节的页脚提供一个视图

注意：

* 仅当实现了`tableView:heightForFooterInSection:`方法时，该方法才会正常工作。

<br>


**`- tableView:heightForHeaderInSection:`**

说明：设置指定章节的页眉高度

注意：

* 从iOS 5.0开始，你必须在该方法中返回指定章节页眉的实际高度。

* 如果你想隐藏指定章节的页眉，可以在该方法中返回一个大于0小于1的高度，直接返回0会无效。

<br>


**`- tableView:estimatedHeightForHeaderInSection:`**

说明：为指定章节的页眉设置一个预估高度

注意：设置预估高度的目的，是为了表格视图的加载性能，因为当表格视图中存在可变高度的章节页眉时，表格视图在加载时就需要计算所有页眉的高度，这就会导致表格视图的加载时间变长。给章节页眉设置预估高度，可以将这些计算从加载时间延迟到滚动时间。

<br>


**`- tableView:heightForFooterInSection:`**

说明：设置指定章节的页脚高度

注意：

* 如果表格视图的风格是`UITableViewStylePlain`时，不会调用该方法。

* 从iOS 5.0开始，你必须在该方法中返回指定章节页脚的实际高度。

* 如果你想隐藏指定章节的页眉，可以在该方法中返回一个大于0小于1的高度，直接返回0会无效。

<br>


**`- tableView:estimatedHeightForFooterInSection:`**

说明：为指定章节的页脚设置一个预估高度

注意：见`- tableView:estimatedHeightForHeaderInSection:`

<br>


**`- tableView:willDisplayHeaderView:forSection:`**

说明：告诉代理对象，指定章节的页眉视图即将显示。

<br>


**`- tableView:willDisplayFooterView:forSection:`**

说明：告诉代理对象，指定章节的页脚视图即将显示。

<br>


**`- tableView:willBeginEditingRowAtIndexPath:`**

说明：告诉代理对象，表格视图即将进入编辑模式。

注意：

* 当用户在一个表格行上水平滑动时会调用该方法

<br>


**`- tableView:didEndEditingRowAtIndexPath:`**

说明：告诉代理对象，表格视图已经退出编辑模式。

<br>