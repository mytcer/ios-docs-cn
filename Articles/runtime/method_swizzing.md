# 方法交换（method swizzing）及其实际应用

### 简介

在Objective-C中，对象收到消息之后，究竟会调用哪个方法需要在运行时才能确定。查找消息的唯一依据是`selector`，`selector`与相应的`IMP`对应，利用Objective-C的动态特性，可以实现在运行时替换`selector`对应的`IMP`，这就是方法交换。

注：在Objective-C中，每个类都有一个方法列表（即`objc_class`结构体中的`methodLists`），里面存放着`selector`的名字与`IMP`的映射关系。


<br>
***
<br>


### 相关的API

* **class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)**

	* 作用：替换类中指定方法的实现，当类中没有想替换的目标方法时，它会调用`class_addMethod`来为该类增加目标方法。

* **method_exchangeImplementations(Method m1, Method m2)**

	* 作用：交换两个方法的实现（注：内部实现就是调用了两次`method_setImplementation`方法）

* **method_setImplementation(Method m, IMP imp)**

	* 作用：设置一个方法的实现


<br>
***
<br>


### 实际应用

#### 应用一：检查类的`dealloc`有没有执行（以`UIViewController`为例）

```
#import "UIViewController+Dealloc.h"
#import <objc/runtime.h>

@implementation UIViewController (Dealloc)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method1 = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        Method method2 = class_getInstanceMethod(self, @selector(my_dealloc));
        method_exchangeImplementations(method1, method2);
    });
}

- (void)my_dealloc {
    NSLog(@"%@销毁了", self);
    [self my_dealloc];
}

@end
```

<br>
***
<br>


### 注意

* 交换方法应该只在`+load`中完成
* 交换方法应该只在`dispatch_once`中完成，确保只会被执行一次。
* 在交换方法实现后，记得要调用原生方法的实现（除非你非常确定可以不用调用原生方法的实现）。
* 确保调用了原生方法的所有地方，不会因为你交换了方法的实现而出现意想不到的结果。


<br>
***
<br>


### 参考资料

* [Method Swizzling](http://nshipster.cn/method-swizzling/)