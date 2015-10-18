# UITabBarController

**简介**

该类实现了一个管理单选风格选择界面的视图控制器，它会在窗口底部显示一个tabbar，每个tab关联一个自定义的视图控制器，当用户选择一个指定的tab，tabbar控制器就会显示对应视图控制器的根视图。

将每个tab对应的视图控制器指定给`viewControllers`属性，可以配置`UITabBarController`的tabs，指定视图控制器的顺序决定了他们在tabbar中的显示顺序。

给视图控制器的`tabBarItem`属性指定一个tab，可以在视图控制器和tab之间建立对应关系。如果你没有为视图控制器提供一个自定义的tab，视图控制器会创建一个没有图片的默认tab，tab的文本来自视图控制器的`title`属性。



**注意**

* 从iOS6开始，该类可以被子类化。
* 你可以使用导航控制器或自定义视图控制器作为一个tab的根视图控制器，如果根视图控制器是一个导航控制器，tabbar控制器会调整显示的导航内容的大小，以确保不覆盖tabbar。
* 如果你添加到6个或更多的自定义视图控制器到tabbar控制器中，tabbar控制器只会将前4个视图控制器的tab显示在tabbar上，其余的tab则会显示在"..."tab里。默认情况下，允许用户重新排列tabbar上的tab，如果不想让用户修改某些tab，可以从`customizableViewControllers`属性中移除相应的视图控制器。