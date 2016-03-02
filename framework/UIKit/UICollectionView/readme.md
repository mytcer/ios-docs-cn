# UICollectionView

**简介**

集合视图，它可以使用自定义的布局来呈现有序的数据集合，可以支持多列、平铺、循环等多种布局，你甚至可以动态改变集合视图的布局。


<br>
***
<br>

### 经验

> 在`- performBatchUpdates:completion:`方法的`updates`回调中调用`reloadData`方法时，如果layout的`headerReferenceSize
`或`footerReferenceSize`为`CGSizeZero`，则会出现crash。

* 解决方法：使用CGSizeMake(0.001, 0.001)这样小的size替代CGSizeZero，[参考资料](http://stackoverflow.com/a/25332322)


<br>
***
<br>


### 参考资料

* [UICollectionView详解](http://blog.csdn.net/majiakun1/article/details/24177347)