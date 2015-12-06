# UICollectionViewController

**简介**

集合视图控制器，它实现了以下行为：

* 如果集合视图控制器有一个指定的nib文件或从一个storyboard载入集合视图控制器，那么视图控制器的视图也会从nib或storyboard载入；如果你通过代码创建集合视图控制器，则会自动创建一个集合视图对象（可以通过`collectionView`属性访问）。

* 从nib文件或storyboard载入集合视图时，对应的datasource和delegate对象会从nib文件或storyboard获得；如果datasource和delegate没有指定，集合视图控制器会将其指定为自己。

* 当集合视图首次出现时，集合视图控制器会重载集合视图数据，每次显示视图时还会清除选中。

<br>
***
<br>

### 参考资源