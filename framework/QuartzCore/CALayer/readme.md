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


### API

**`geometryFlipped`**

作用：BOOL型，用于决定一个图层的坐标是否相对于父图层垂直翻转。

说明：

* 在iOS上，一个图层的position位于父图层的左上角，但是在Mac OS上，通常是位于左下角，Core Animation可以通过geometryFlipped属性来适配这两种情况。

* 在iOS上通过设置它为YES意味着它的子图层将会被垂直翻转，也就是将会沿着底部排版。

<br>

**`zPosition`**

作用：

说明：

* 该属性可以明显改变屏幕上图层的顺序，但不能改变事件传递的顺序

<br>

**`masksToBounds`**

作用：沿边界裁剪图形

<br>

**`cornerRadius`**

作用：设定图层圆角半径

<br>

**`mask`**

作用：图层蒙版

说明：如果mask图层比父图层要小，只有在mask图层里面的内容才是它关心的，除此以外的一切都会被隐藏起来。


<br>
***
<br>


### 注意

* CALayer不处理用户交互
* CALayer能包含一张图片，这被称之为寄宿图。（例子：`layer.contents = (__bridge id)image.CGImage;`）
* 当图层显示在屏幕上时，CALayer不会自动重绘它的内容，它把重绘的决定权交给了开发者。
* 当你使用CALayerDelegate绘制寄宿图的时候，超出边界外的内容不会被绘制（看上去就像是沿边界裁剪过一样）。
* 当UIView创建了它的宿主图层时，就会自动地把图层的delegate设置为它自己，并提供了一个`-displayLayer:`的实现。
* 图层的阴影是根据寄宿图的轮郭来确定，而不是根据边界和角半径来确定；当阴影和裁剪扯上关系的时候就有一个头疼的限制：阴影通常就是在Layer的边界之外，如果你开启了masksToBounds属性，所有从图层中突出来的内容都会被才剪掉。
* 实时计算阴影也是非常消耗资源的，尤其是图层有多个子图层，每个图层还有一个有透明效果的寄宿图的时候。在知道阴影形状的情况下，可以通过`shadowPath`来提高性能。


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