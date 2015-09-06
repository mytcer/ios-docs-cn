# UIInterpolatingMotionEffect

**简介**

使用它可以是视图随着设备在水平或垂直方向的倾斜而移动，你可以使用这个类来确定应用于视图的倾斜量（沿着一个轴）。在创建该类的实例后，你必须为`minimumRelativeValue`和`maximumRelativeValue`属性指定适当的值，当用户移动设备时，实例对象将系统返回的固定偏移值（范围是`-1~1`）转换为你指定值的范围，然后UIKit会将转换后的值应用于目标视图。