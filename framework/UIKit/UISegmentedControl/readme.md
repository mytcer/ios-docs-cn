# UISegmentedControl

一个`UISegmentedControl`对象表示一个由多个分段组成的水平控件（其实就是tabbar），一个分段控件可以显示一个标题或一个图像，`UISegmentedControl`对象会自动调整分段的大小以适应父视图，除非他们有一个指定的宽度集。


**自定义外观**

你可以通过`[UISegmentedControl appearance]`来自定义外观。如果要提供完整的定制，你需要为不同的状态组合提供分隔图像，这可以通过`setDividerImage:forLeftSegmentState:rightSegmentState:barMetrics:`方法实现：

```
// 什么都没选中的状态
[mySegmentedControl setDividerImage:image1 forLeftSegmentState:UIControlStateNormal
                  rightSegmentState:UIControlStateNormal barMetrics:barMetrics];

// 左边的分段被选中，右边的分段未选中
[mySegmentedControl setDividerImage:image1 forLeftSegmentState:UIControlStateSelected
                  rightSegmentState:UIControlStateNormal barMetrics:barMetrics];

// 左边的分段未选中，右边的分段被选中
[mySegmentedControl setDividerImage:image1 forLeftSegmentState:UIControlStateNormal
                  rightSegmentState:UIControlStateSelected barMetrics:barMetrics];
```


**注意**

* 通过`UIControlEventValueChanged`事件来监听分段的改变。