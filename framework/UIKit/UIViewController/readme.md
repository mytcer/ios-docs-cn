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


**`- prepareForSegue:sender:`

说明：提醒视图控制器segue即将被执行。

注意：该方法的默认实现什么也没做。

<br>
***
<br>


### 参考资料

* [addChildViewController属性介绍(剖析网易新闻标签栏视图切换)](http://blog.csdn.net/hmt20130412/article/details/34523235)