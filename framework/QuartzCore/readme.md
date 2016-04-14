# QuartzCore

### 简介

该框架包含Core Animation接口，Core Animation是高级动画制作和混合技术，它使用经过优化的渲染路径实现复杂的动画和视觉效果，它提供的高级Objective-C接口可对动画效果进行配置，然后在设备硬件中进行渲染，以此来提高程序的性能。Core Animation框架被整合到iOS的许多部分，可以为多种系统行为提供动画效果，您也可以使用该框架中的Objective-C接口直接创建定制动画。


<br>
***
<br>


### 图层动画的分类

* 属性动画：对单独的图层属性进行具体的控制

* 动画组：把多个属性动画组合成一个独立单元

* 过渡动画：可以用来对图层的任何内容做任何类型的动画，会影响整个图层。


<br>
***
<br>


### Demo

* [CATransform3D实现立方体](./CATransform3D/CATransform3DCubeDemo)
* [CAGradientLayer实现线性渐变](./CAGradientLayer/CAGradientLayerDemo)
* [CAReplicatorLayer实现跳动音符和转菊花](./CAReplicatorLayer/CAReplicatorLayerDemo)
* [CAReplicatorLayer实现环形卡片](./CAReplicatorLayer/CircleLayersDemo)
* [CAReplicatorLayer实现图片倒影](./CAReplicatorLayer/ReflectionDemo)
* [CAShapeLayer画一个火柴人](./CAShapeLayer/CAShapeLayerStickman)
* [CAShapeLayer实现圆角矩形](./CAShapeLayer/CAShapeLayerSomeRoundCorners)
* [CATransformLayer作为立方体的容器（不会平面化立方体图层）](./CATransformLayer/CATransformLayerCubeDemo)
* [CAEmitterLayer实现类爆炸效果](./CAEmitterLayer/BurstEffectDemo)
* [通过设置CALayer的actions属性来给图层添加从左向右滑的动画](./CALayer/ActionsPropertyAnimateDemo)
* [通过动画对象的autoreverses特性来实现自动开关的门](./CABasicAnimation/AutoSwitchDoorDemo)
* [通过CAKeyframeAnimation实现帧动画](./CAKeyframeAnimation/CAKeyframeAnimationDemo)
* [通过CAKeyframeAnimation和UIBezierPath来实现物体曲线滑行](./CAKeyframeAnimation/CurveFlightDemo)
* [通过CAAnimationGroup来实现物体曲线滑行的同时改变背景颜色](./CAAnimationGroup/CAAnimationGroupDemo)
* [通过CATransition实现图片切换时的过渡动画](./CATransition/SwitchImageDemo)
* [物体曲线滑行：timeOffset和speed的值对动画的影响](./CAKeyframeAnimation/TimeOffsetAndSpeedTestDemo)
* [通过removedOnCompletion与fillMode来解决动画执行结束后急速返回初始状态的问题](./CABasicAnimation/FillModeDemo)