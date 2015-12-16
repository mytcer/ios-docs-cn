# UIViewController

### 简介

视图控制器基类


<br>
***
<br>


### API

**`- initWithNibName:bundle:`**

说明：用指定包中的nib文件返回一个新初始化的视图控制器。

注意：

* 如果没有指定nibName参数值，且没有覆盖`loadView`方法，视图控制器会搜索如下两种名称的nib文件：
	* 如果试图控制器的类名以`Controller`结尾（如`MyViewController`)，则会搜索`MyView.nib`文件（即文件名不包含`Controller`）。
	* 搜索名为视图控制器类名的nib文件，如试图控制器的类名为`MyViewCtrl`，则会搜索`MyViewCtrl.nib`文件。

* 如果nib文件名包含特定的平台标识符（如`~ipad`，`~iphone`)，则该nib文件只会在相应类型的设备上载入，如`MyViewController~ipad.nib`文件就只会在ipad上载入。

<br>

**`nibName`**

说明：属性，返回视图控制器的nib文件名，只读。

<br>


**`nibBundle`**

说明：属性，返回视图控制器的nib包，只读。

<br>


**`storyboard`**

说明：属性，返回视图控制器所在的故事板，只读。

注意：如果视图控制器不是从故事板实例化的，则属性值为`nil`。

<br>


**`- shouldPerformSegueWithIdentifier:sender:`**

说明：该方法返回一个布尔值，用于决定指定标识符的segue是否应该被执行，YES表示执行，NO表示不执行。

注意：如果你没有实现该方法，所有segue都会被执行。

<br>


**`- prepareForSegue:sender:`**

说明：提醒视图控制器segue即将被执行。

注意：该方法的默认实现什么也没做。

<br>


**`- performSegueWithIdentifier:sender:`**

说明：使用来自当前视图控制器故事板文件中的特定标识符初始化segue。

注意：当前视图控制器必须已经从故事板载入，如果`storyboard`属性为nil，该方法会抛出异常。

<br>


**`- canPerformUnwindSegueAction:fromViewController:withSender:`**

说明：在一个视图控制器上调用该方法，返回一个布尔值，以决定是否响应解绑动作（导航回退），YES表示视图控制器想处理解绑动作。

注意：

* 当一个解绑动作被触发时，UIKit使用该方法和`viewControllerForUnwindSegueAction:fromViewController:withSender:`方法找到一个合适的视图控制器来处理解绑动作。

<br>


**`view`**

说明：视图控制器的根视图。

注意：

* 如果访问该属性时，属性值为nil，则视图控制器会自动调用`loadView`方法将根视图载入到内存中，并返回刚载入的视图对象。

* 每个视图控制器是其视图的唯一所有者

* 你不能将同一个视图对象与多个视图控制器对象关联起来，除了视图控制器作为其他视图控制器的容器时，可以将其他视图控制器的视图作为容器视图的子视图，但在将其他视图控制器的视图作为子视图前，容器必须先调用`addChildViewController:`方法将其他视图控制器添加进来以建立父子关系。

<br>


**`isViewLoaded`**

说明：表示视图控制器的根视图是否已载入到内存中。

注意：在根视图没有载入到内存的情况下访问该属性，并不会导致根视图被加载到内存中。

<br>


**`- segueForUnwindingToViewController:fromViewController:identifier:`**

说明：当一个解绑动作需要在两个视图控制器之间过渡时，会调用该方法。

注意：

* 从iOS 9.0开始，该方法已废弃。

* 如果你需要实现一个使用segue解绑的视图控制器容器，那么你需要覆盖此方法，否则就不用覆盖。

<br>


**`- viewControllerForUnwindSegueAction:fromViewController:withSender:`**

说明：当一个segue解绑动作想从视图控制器容器中搜索一个子视图控制器来处理解绑动作时，调用此方法。

注意：

* 从iOS 9.0开始，该方法已废弃。

* 自定义的视图控制器容器应该覆盖此方法，并且使用此方法来搜索一个子视图控制器来处理解绑动作，这是通过调用每个子视图控制器的`canPerformUnwindSegueAction:fromViewController:withSender:`方法来实现的。如果一个子视图控制器可以处理解绑动作，你应该在该方法中返回该子视图控制器。如果没有子视图控制器想处理解绑动作，就调用父类的该方法并返回其执行结果。

<br>


**`- loadView`**

说明：创建视图控制器根视图

注意：

* 不要直接调用此方法（在访问`view`属性时，若属性值为nil，视图控制器会自动调用该方法）。

* 如果你使用Interface Builder来创建视图并初始化视图控制器，你必须覆盖此方法。

* 覆盖此方法时，不能调用父类的该方法。

<br>


**`- viewDidLoad`**

说明：在视图控制器的视图载入到内存中后调用

<br>


**`title`**

说明：视图控制器的标题，会显示在导航条标题的位置。

<br>


**`preferredContentSize`**

说明：视图控制器根视图的首选尺寸

<br>


**`modalPresentationStyle`**

说明：以模态呈现视图控制器时的呈现风格，该属性决定了视图控制器如何以模态显示在屏幕上，可用的呈现风格见`UIModalPresentationStyle`。

<br>


**`modalTransitionStyle`**

说明：呈现视图控制器时使用的过渡风格，该属性决定了使用`presentViewController:animated:completion:`方法呈现视图控制器时的屏幕动画，其默认值是`UIModalTransitionStyleCoverVertical`。

注意：如果要改变呈现视图控制器时的过度风格，必须在呈现视图控制器前设置该属性的值。

<br>
***
<br>


### 参考资料

* [addChildViewController属性介绍(剖析网易新闻标签栏视图切换)](http://blog.csdn.net/hmt20130412/article/details/34523235)