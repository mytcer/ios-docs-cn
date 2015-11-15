# UIAppearance

**简介**

它是一个协议，使用它可以获取一个类的外观代理，你可以通过发送外观修改消息给一个类的外观代理来自定义其外观。自定义对象外观的方式有两种：

1. 全局定义 -- 会影响目标对象的所有实例

例子：整个应用中，所有导航条的背景色都会变为灰色

```
[[UINavigationBar appearance] setBarTintColor:[UIColor grayColor]];
```

2. 局部定义 -- 会影响到出现在某个容器类中的目标对象

例子：出现在导航条中的`UIButton`，其文字颜色为灰色

```
[[UIButton appearanceWhenContainedIn:[UINavigationBar class], nil] setTintColor:[UIColor grayColor]];
```


**注意**

* 当一个视图进入一个窗口时，iOS会应用对外观的修改，它不会改变一个已经显示在窗口中的视图的外观。如果要改变一个已经显示在窗口中的视图外观，需要先将该视图从视图层次中删除，然后再添加回去。