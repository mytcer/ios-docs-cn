# UITableView

**简介**

表格视图

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
