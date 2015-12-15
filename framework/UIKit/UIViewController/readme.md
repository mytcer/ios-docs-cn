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


**`nibName`**

说明：属性，返回视图控制器的nib文件名，只读。


**`nibBundle`**

说明：属性，返回视图控制器的nib包，只读。


**`storyboard`**

说明：属性，返回视图控制器所在的故事板，只读。

注意：如果视图控制器不是从故事板实例化的，则属性值为`nil`。


**`- shouldPerformSegueWithIdentifier:sender:`**

说明：该方法返回一个布尔值，用于决定指定标识符的segue是否应该被执行，YES表示执行，NO表示不执行。

注意：如果你没有实现该方法，所有segue都会被执行。


**`- prepareForSegue:sender:`**

说明：提醒视图控制器segue即将被执行。

注意：该方法的默认实现什么也没做。


**`- performSegueWithIdentifier:sender:`**

说明：使用来自当前视图控制器故事板文件中的特定标识符初始化segue。

注意：当前视图控制器必须已经从故事板载入，如果`storyboard`属性为nil，该方法会抛出异常。


**`- canPerformUnwindSegueAction:fromViewController:withSender:`

说明：在一个视图控制器上调用该方法，返回一个布尔值，以决定是否响应解绑动作（导航回退），YES表示视图控制器想处理解绑动作。

注意：

* 当一个解绑动作被触发时，UIKit使用该方法和`viewControllerForUnwindSegueAction:fromViewController:withSender:`方法找到一个合适的视图控制器来处理解绑动作。


**`view`**

说明：视图控制器的根视图。

注意：

* 如果访问该属性时，属性值为nil，则视图控制器会自动调用`loadView`方法将根视图载入到内存中，并返回刚载入的视图对象。

* 每个视图控制器是其视图的唯一所有者

* 你不能将同一个视图对象与多个视图控制器对象关联起来，除了视图控制器作为其他视图控制器的容器时，可以将其他视图控制器的视图作为容器视图的子视图，但在将其他视图控制器的视图作为子视图前，容器必须先调用`addChildViewController:`方法将其他视图控制器添加进来以建立父子关系。


**`isViewLoaded`**

说明：表示视图控制器的根视图是否已载入到内存中。

注意：在根视图没有载入到内存的情况下访问该属性，并不会导致根视图被加载到内存中。

<br>
***
<br>


### 参考资料

* [addChildViewController属性介绍(剖析网易新闻标签栏视图切换)](http://blog.csdn.net/hmt20130412/article/details/34523235)