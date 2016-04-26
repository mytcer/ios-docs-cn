# CALayer

### 简介

CALayer可实现的功能：

* 阴影，圆角，带颜色的边框
* 3D变换
* 非矩形范围
* 透明遮罩
* 多级非线性动画


<br>
***
<br>


### 注意

* CALayer不处理用户交互
* CALayer能包含一张图片，这被称之为寄宿图。（例子：`layer.contents = (__bridge id)image.CGImage;`）
* 当图层显示在屏幕上时，CALayer不会自动重绘它的内容，它把重绘的决定权交给了开发者。
* 当你使用CALayerDelegate绘制寄宿图的时候，超出边界外的内容不会被绘制（看上去就像是沿边界裁剪过一样）。
* 当UIView创建了它的宿主图层时，就会自动地把图层的delegate设置为它自己，并提供了一个`-displayLayer:`的实现。


<br>
***
<br>


### 参考资料

* [CALayer画Mask指南](http://www.monk-studio.com/calayerhua-mask/)


<br>
***
<br>


### Demo

* [图层蒙版](./CALayerMaskDemo)