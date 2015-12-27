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


**`- targetViewControllerForAction:sender:`**

说明：返回处理指定动作的视图控制器，如果没有视图控制器处理该动作，就返回nil。

注意：

* 从iOS 8.0开始可用

* 一个视图控制器可以通过`canPerformAction:withSender:`方法返回一个合适的值，以选择性地响应一个动作。

<br>


**`presentationController`**

说明：当前视图控制器最近呈现的控制器

注意：

* 从iOS 8.0开始可用

<br>


**`popoverPresentationController`**

说明：当前视图控制器最近呈现的弹窗控制器

注意：

* 从iOS 8.0开始可用

<br>


**`- viewWillAppear:`**

说明：通知视图控制器，其视图将要被添加到视图层次结构中。

<br>


**`- viewDidAppear:`**

说明：通知视图控制器，其视图已经被添加到视图层次结构中。

<br>


**`- viewWillDisappear:`**

说明：通知视图控制器，其视图将要从视图层次结构中移除。

<br>


**`- viewDidDisappear:`**

说明：通知视图控制器，其视图已经从视图层次结构中移除。

<br>


**`- viewWillLayoutSubviews`**

说明：通知视图控制器，其视图将要对子视图进行布局。

注意：

* 当一个视图的边界发生改变时，视图就会调整其子视图的位置。

* 该方法的默认实现什么也不做

<br>


**`- viewDidLayoutSubviews`**

说明：通知视图控制器，其视图已完成对子视图的布局。

注意：该方法的默认实现什么也不做

<br>


**`- updateViewConstraints`**

说明：当视图控制器的视图需要更新其约束时，调用该方法。

注意：如果你覆盖了该方法，你的实现必须调用父类的实现。

<br>


**`bottomLayoutGuide`**

说明：显示屏幕内容的最低基准限制

<br>


**`topLayoutGuide`**

说明：显示屏幕内容的最高基准限制

<br>


**`edgesForExtendedLayout`**

说明：指定边缘要延伸的方向，默认值为`UIRectEdgeAll`。

注意：该属性只适用于内嵌在容器中（如`UINavigationController`）的控制器，窗口的根视图控制器不会对这个属性作出反应。

<br>


**`extendedLayoutIncludesOpaqueBars`**

说明：布尔值，表示是否扩展布局以包括不透明的条，默认值为NO。

<br>


**`automaticallyAdjustsScrollViewInsets`**

说明：布尔值，表明视图控制器是否应该自动调整滚动视图的内层，默认值为YES。

<br>


**`- isMovingFromParentViewController`**

说明：返回一个布尔值，表示当前视图控制器是否处于从父控制器移除的过程中。

注意：仅在`viewWillDisappear:`和`viewDidDisappear:`方法内调用该方法时，才会返回YES。

<br>


**`- isMovingToParentViewController`**

说明：返回一个布尔值，表示当前视图控制器是否处于被添加到父控制器的过程中。

注意：仅在`viewWillAppear:`和`viewDidAppear:`方法内调用该方法时，才会返回YES。

<br>


**`- isBeingPresented`** 

说明：返回一个布尔值，表示当前视图控制器是否处于被父控制器呈现的过程中。

注意：仅在`viewWillAppear:`和`viewDidAppear:`方法内调用该方法时，才会返回YES。

<br>


**`- isBeingDismissed`**

说明：返回一个布尔值，表示当前视图控制器是否处于被父控制器解散的过程中。

注意：仅在`viewWillDisappear:`和`viewDidDisappear:`方法内调用该方法时，才会返回YES。

<br>


**`- shouldAutorotate`**

说明：返回一个布尔值，表示当前视图控制器的内容是否应该自动旋转，默认返回YES。

<br>


**`- supportedInterfaceOrientations`**

说明：返回当前视图控制器支持的所有界面方向，默认值是`UIInterfaceOrientationMaskAll`（for ipad）和`UIInterfaceOrientationMaskAllButUpsideDown`（for iphone）。

注意：

* 当用户改变了设备方向时，系统会调用根视图控制器或最顶层的视图控制器的该方法，如果视图控制器支持新方向，窗口和视图控制器会旋转新方向。

* 仅当`shouldAutorotate`方法返回YES时，才会调用该方法。

<br>


**`- preferredInterfaceOrientationForPresentation`**

说明：返回呈现视图控制器时所使用的界面方向

注意：

* 当全屏呈现视图控制器时，系统会调用该方法。

* 如果视图控制器实现了该方法，视图控制器视图使用首选的方向来显示；如果视图控制器没有实现该方法，系统使用状态条的当前方向来显示。

<br>


**`+ attemptRotationToDeviceOrientation`**

说明：尝试将所有窗口的方向旋转成设备的当前方向

<br>


**`- collapseSecondaryViewController:forSplitViewController:`**

说明：当一个拆分视图控制器过渡到紧凑的宽度尺寸时，调用该方法。

注意：从iOS 8.0开始可用

<br>


**`- separateSecondaryViewControllerForSplitViewController:`**

说明：当一个拆分视图控制器过渡到正常的宽度尺寸时，调用该方法。

注意：从iOS 8.0开始可用

<br>


**`childViewControllers`**

说明：只读属性，表示当前视图控制器的子控制器列表。

注意：该属性不包含任何呈现的视图控制器

<br>


**`- addChildViewController:`**

说明：给当前视图控制器添加一个子控制器

注意：

* 将子控制器的视图添加父控制器的视图中时，必须先调用该方法，将子控制器添加到父控制器之中，以建立父子关系。

* 如果新的子控制器已经被添加到父控制器中，那么会先从父控制器中移除该子控制器，然后再将其添加到父控制器。

* 如果你覆盖了该方法，就必须调用其父类的实现。

<br>


**`- removeFromParentViewController`**

说明：从父控制器中移除当前视图控制器

注意：如果你覆盖了该方法，就必须调用其父类的实现。

<br>


**`- transitionFromViewController:toViewController:duration:options:animations:completion:`**

说明：在当前视图控制器的子控制器之间转换，该方法将第二个子视图控制器的视图添加到父控制器的视图层级中，然后执行动画，当动画执行完毕后，就会从父控制器的视图层级中移除第一个子视图控制器的视图。

注意：如果你覆盖了该方法，就必须调用其父类的实现。

<br>


**`- shouldAutomaticallyForwardAppearanceMethods`**

说明：返回一个布尔值，表示外观方法是否转发给了子视图控制器，该方法的默认实现返回YES。

注意：如果你覆盖了该方法且返回NO，你就要负责在子视图控制器的视图将要出现或消失时通知子控制器，这是通过调用子视图控制器的`beginAppearanceTransition:animated:`和`endAppearanceTransition`方法实现的。

<br>


**`- beginAppearanceTransition:animated:`**

说明：告诉子控制器，它的外观即将改变。

<br>


**`- endAppearanceTransition`**

说明：告诉子控制器，它的外观已经改变。

<br>


**`- setOverrideTraitCollection:forChildViewController:`**

说明：改变分配给指定子视图控制器的特征

注意：从iOS 8.0开始可用

<br>


**`- overrideTraitCollectionForChildViewController:`**

说明：返回一个子视图控制器的特征集合

注意：从iOS 8.0开始可用

<br>


**`- willMoveToParentViewController:`**

说明：在视图控制器被添加父控制器或从父控制器移除之前，调用该方法。

注意：

* 如果你实现了自己的容器控制器，你必须在调用子视图控制器的`removeFromParentViewController`方法之前，调用`willMoveToParentViewController:`方法，参数值使用nil。

* 当你自定义的容器控制器调用`addChildViewController:`方法时，它会在子视图控制器被添加之前，自动调用子视图控制器的`willMoveToParentViewController:`方法。

<br>


**`- didMoveToParentViewController:`**

说明：当视图控制器已经被添加到容器控制器，或已从容器控制器中移除时，调用该方法。

注意：

* 如果你实现了自己的容器控制器，你必须在当前控制器与新控制器之间的转换完成后调用`didMoveToParentViewController:`方法；如果没有转换，那么应该在调用`addChildViewController:`方法后立即调用`didMoveToParentViewController:`方法。

* `removeFromParentViewController`方法会自动调用`didMoveToParentViewController:`方法。

<br>


**`presentingViewController`**

说明：只读，返回呈现当前视图控制器的控制器

<br>


**`presentedViewController`**

说明：只读，返回由当前控制器或视图控制器层级中任一父控制器呈现的视图控制器

<br>


**`parentViewController`**

说明：只读，返回接收者的父视图控制器。

<br>


**`navigationController`**

说明：只读，返回当前视图控制器的导航控制器。

<br>


**`splitViewController`**

说明：只读，返回当前视图控制器的拆分控制器。

<br>


**`tabBarController`**

说明：只读，返回当前视图控制器的标签栏控制器。

<br>


**`- didReceiveMemoryWarning`**

说明：当应用收到内存警告时，会调用该方法。

注意：

* 不要直接调用该方法

* 如果你覆盖了该方法，就必须调用父类的实现。

<br>


**`restorationIdentifier`**

说明：一个标识符，用来决定视图控制器是否要支持状态恢复，默认值为nil。

<br>


**`restorationClass`**

说明：该类负责恢复应用状态时重新创建视图控制器

注意：

* 该类必须遵循`UIViewControllerRestoration`协议

* 如果一个视图控制器有一个关联的restoration class，则状态恢复期间会调用`viewControllerWithRestorationIdentifierPath:coder:`方法，该方法会返回restoration identifier标识的视图控制器；如果你没有给视图控制器指定restoration class，状态恢复引擎会要求应用程序代理提供视图控制器对象。

<br>


**`- encodeRestorableStateWithCoder:`**

说明：编码视图控制器的状态相关信息

注意：

* 不要直接调用该方法

<br>


**`- decodeRestorableStateWithCoder:`**

说明：解码和恢复视图控制器的状态相关信息

<br>


**`- applicationFinishedRestoringState`**

说明：在其他对象解码完成后，系统会调用该方法。

<br>


**`extensionContext`**

说明：返回视图控制器的扩展内容

注意：从iOS 8.0开始可用

<br>


**`- registerForPreviewingWithDelegate:sourceView:`**

说明：注册一个视图控制器来参与3D触控预览和提交

注意：从iOS 9.0开始可用

<br>


**`- unregisterForPreviewingWithContext:`**

说明：通过指定的上下文对象来注销以前注册的视图控制器

注意：

* 上下文对象即调用`registerForPreviewingWithDelegate:sourceView:`方法注册视图控制器时返回的对象

* 当一个已注册的3D触控视图控制器被释放后，系统会自动调用该方法。

<br>


**`- previewActionItems`**

说明：返回用户在3D触控预览上向上扫时所显示的快捷操作，默认实现返回一个空数组。

注意：从iOS 9.0开始可用

<br>


**`- childViewControllerForStatusBarHidden`**

说明：当系统需要使用视图控制器来决定状态条的隐藏状态时，调用该方法，默认返回nil。

注意：

* 如果该方法返回nil，则状态条的隐藏状态与当前视图控制器一致。

* 如果你改变了该方法的返回值，则需要调用`setNeedsStatusBarAppearanceUpdate`方法。

<br>


**`- childViewControllerForStatusBarStyle`**

说明：当系统需要使用视图控制器来决定状态条的风格时，调用该方法。

注意：

* 如果该方法返回nil，则状态条风格与当前视图控制器一致。

* 如果你改变了该方法的返回值，则需要调用`setNeedsStatusBarAppearanceUpdate`方法。

<br>


**`- preferredStatusBarStyle`**

说明：视图控制器状态条的首选风格

<br>


**`- prefersStatusBarHidden`**

说明：指定视图控制器状态条的显示状态

注意：如果改变了该方法的返回值，则需要调用`setNeedsStatusBarAppearanceUpdate`方法。

<br>


**`modalPresentationCapturesStatusBarAppearance`**

说明：布尔值，标明一个非全屏呈现的控制器是否由自己控制状态条的外观。

注意：

* 当你通过`presentViewController:animated:completion:`方法呈现视图控制器时，仅当被呈现控制器的`modalPresentationStyle`属性值是`UIModalPresentationFullScreen`时，其状态条的外观才会由自己控制，而将该属性值设置为YES后，即使视图控制器是非全屏呈现的，也可以由自己控制状态条的外观。

* 当视图控制器全屏呈现时，系统会忽略该属性值。

<br>


**`- preferredStatusBarUpdateAnimation`**

说明：指定视图控制器隐藏和显示状态条时使用的动画风格，默认值为`UIStatusBarAnimationFade`。

注意：当你通过`prefersStatusBarHidden`方法改变状态条的显示或隐藏状态时，才会执行动画。

<br>


**`- setNeedsStatusBarAppearanceUpdate`**

说明：告诉系统，视图控制器的状态条属性（如显示状态，风格）已经改变。

<br>


**`navigationItem`**

说明：只读，导航条上的导航条目

<br>


**`hidesBottomBarWhenPushed`**

说明：布尔值，表示当前视图控制器被推入导航控制器时是否显示屏幕底部的工具条。

<br>


**`- setToolbarItems:animated:`**

说明：设置显示在视图控制器上的工具条栏目。

<br>


**`toolbarItems`**

说明：当前视图控制器的工具条项目

<br>


**`tabBarItem`**

说明：标签栏视图控制器的标签栏项目

<br>


**`editing`**

说明：布尔值，表示当前视图控制器是否允许用户编辑视图内容。

<br>


**`- setEditing:animated:`**

说明：设置视图控制器是否要显示一个可编辑的视图

注意：在更新视图之前，应该先调用父类的实现。

<br>


**`- editButtonItem`**

说明：返回一个编辑按钮

注意：该按钮的默认动作会调用`setEditing:animated:`方法


**`UIViewControllerShowDetailTargetDidChangeNotification`**

说明：消息，当一个拆分视图控制器被展开或收起时发送。

注意：从iOS 8.0开始可用


<br>
***
<br>


### 参考资料

* [addChildViewController属性介绍(剖析网易新闻标签栏视图切换)](http://blog.csdn.net/hmt20130412/article/details/34523235)
* [通过edgesForExtendedLayout解决视图上移44pt的问题](http://blog.csdn.net/cny901111/article/details/26529949)