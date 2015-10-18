# UITabBar

**简介**

它是一个控件，通常显示在屏幕底部，每个tab项都是UITabbarItem的实例。



**注意**

* 可以通过`UITabBarDelegate`来重排、移除及添加tab项。
* 不要修改`UITabBarController`的`tabbar`属性，否则系统会抛出一个异常，要这么做，只能通过`UITabBarController`的API。
* 可以通过`[UITabBar appearance]`自定义外观。