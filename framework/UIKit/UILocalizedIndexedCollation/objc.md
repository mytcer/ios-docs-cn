# UILocalizedIndexedCollation

**简介**

`UILocalizedIndexedCollation`是一个帮助我们组织、排序、本地化表格视图数据的类，表格视图的数据源使用该对象为表格视图提供章节标题及章节索引标题（如下）。

```
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
}
 
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}
 
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}
```

<br>

***

<br>

### 参考资源

* [UILocalized​Indexed​Collation](http://nshipster.cn/uilocalizedindexedcollation/)