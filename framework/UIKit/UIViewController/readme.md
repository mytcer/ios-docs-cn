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


**`modalInPopover`**

说明：布尔值，表示视图控制器是否应该通过弹窗模式来呈现，默认值为NO。

注意：值设置为YES会导致弹窗控制器被显示后，禁止控制器之外的交互。你可以使用该行为来确保点击弹窗控制器之外的部分时，弹窗不会消失。

<br>


**`- showViewController:sender:`**

说明：在一个主要上下文中呈现视图控制器，使用该方法，一个视图控制器不需要知道它是否被嵌入导航控制器或拆分视图控制器内部。

注意：

* 从iOS 8.0开始可用

* 这个方法的默认实现调用`targetViewControllerForAction:sender:`方法，在视图控制器层级结构中定位一个覆盖了`- showViewController:sender:`方法的对象，然后在找到的对象上调用`- showViewController:sender:`方法。

* 如果`targetViewControllerForAction:sender:`方法返回nil，该方法会使用窗口的根视图控制器以模态的方式来呈现`vc`。

<br>


**`- showDetailViewController:sender:`**

说明：在一个二级上下文中呈现视图控制器

注意：从iOS 8.0开始可用

<br>


**`- presentViewController:animated:completion:`**

说明：以模态呈现一个视图控制器

注意：

* 在横向常规的环境中，视图控制器按照`modalPresentationStyle`属性值描述的风格呈现；在横向紧凑的环境中，视图控制器默认全屏呈现。

* 如果你给被呈现的控制器关联了一个代理，你就可以动态地修改呈现风格。

* 被呈现的视图控制器调用`viewDidAppear:`方法后，才会调用completion回调。

<br>


**`- dismissViewControllerAnimated:completion:`**

说明：解散当前视图控制器中以模态呈现的控制器

注意：被呈现的视图控制器调用`viewDidDisappear:`方法后，才会调用completion回调。

<br>


**`definesPresentationContext`**

说明：布尔值，用于表示当前视图控制器或其子类呈现一个视图控制器时，它的视图是否被覆盖，默认值为NO。

注意：

* 一些系统提供的视图控制器（如`UINavigationController`），会将默认值设置为YES。

* 当一个基于上下文的呈现发生时，UIKit开始呈现视图控制器并且遍历视图控制器层级，如果UIKit找到一个该属性值为YES的视图控制器，UIKit会要求该视图控制器来呈现新的视图控制器；如果没有视图控制器定义呈现上下文，UIKit会要求窗口的根视图控制器来处理呈现。

<br>


**`providesPresentationContextTransitionStyle`**

说明：布尔值，表示当前视图控制器是否为它呈现的视图控制器指定了过渡风格，默认值为NO。

注意：当值设置为YES时，当前视图控制器的过渡风格会替代掉被呈现的视图控制器的过渡风格；当值为NO时，UIKit会使用被呈现的视图控制器的过渡风格。

<br>


**`- disablesAutomaticKeyboardDismissal`**

说明：返回一个布尔值，表示当控件发生改变时，当前输入视图是否自动消失，YES表示禁止自动消失。

注意：当视图控制器的模态呈现风格为`UIModalPresentationFormSheet`时，该方法默认返回YES；其他呈现风格时返回NO。

<br>


**`transitioningDelegate`**

说明：代理对象，它提供了过渡动画、交互控制及自定义呈现控制对象。

注意：当视图控制器的`modalPresentationStyle`属性是`UIModalPresentationCustom`时，UIKit使用该代理对象来促进过渡和呈现视图控制器。

<br>


**`- transitionCoordinator`**

说明：返回处于活动状态的过渡协调对象

注意：如果你覆盖了该方法，那么首先调用父类的该方法，看看有没有合适的过渡协调器返回，如果有，就返回它。

<br>


<br>
***
<br>


### 参考资料

* [addChildViewController属性介绍(剖析网易新闻标签栏视图切换)](http://blog.csdn.net/hmt20130412/article/details/34523235)