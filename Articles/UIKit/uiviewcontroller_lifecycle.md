# UIViewController的生命周期

**1. alloc**                                  

说明：创建对象，分配内存空间
	
<br>


**2. init (或initWithNibName:bundle:)**

说明：初始化对象

<br>


**3. loadView**                         

说明：载入视图
	
注意：
	
* 如果你重载了这个方法，则必须创建必要的view，并将一个非nil值传给UIViewController的view属性。
	
* 如果你没有重载这个方法，UIViewController会默认使用nibName和nibBundle属性，并尝试从nib文件加载view。如果没有找到nib文件，它尝试寻找一个与UIViewController类名匹配的nib文件。
	
* 如果没有可用的nib文件，那么它创建一个空的UIView作为它的view。

<br>


**4. viewDidLoad**                  

说明：视图载入完成，可以进行自定义数据以及动态创建其他控件。

<br>


**5. viewWillAppear**              

说明：视图将要出现在屏幕之前执行

<br>


**6. viewDidAppear**              

说明：视图已在屏幕上渲染完成

<br>


**7. viewWillDisappear**            

说明：视图将要从屏幕上移除之前执行

<br>


**8. viewDidDisappear**             

说明：视图已经被从屏幕上移除，用户看不到这个视图了。

<br>


**9. dealloc**                                 

说明：视图被销毁

注意：视图控制器被出栈后，如果视图控制器的引用计数为0，则会调用dealloc方法，否则不会。


<br>
***
<br>


### 参考资源

* [iOS中控制器的释放问题](http://segmentfault.com/a/1190000003858306)