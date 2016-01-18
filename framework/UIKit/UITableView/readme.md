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
