# Objective-C中的保留字

### @property

作用：声明属性，如

```
@interface ViewController()

@property (nonatomic, copy) NSString *name;

@end

```

说明：编译器会自动为该属性生成 **getter** 和 **setter** 方法，以及一个对应的变量名，变量名的格式是`_` + 属性名（如`_name`）。在代码中便可以如下的使用：

```
self.name = @"haha"; // setter
NSLog(@"name: %@", self.name); // getter
NSLog(@"name: %@", _name);

```

注意：

* `self.name`访问的是属性，会调用 **getter** 或 **setter** 方法；`_name`访问的是变量，不会触发 **getter** 和 **setter** 方法。
* 自动生成的变量只能在类的内部访问，而属性则可以在类的外部访问。


<br>
***
<br>


### @synthesize

作用：生成 **getter** 和 **setter** 方法（如果使用`@property`声明属性，则不用写`@synthesize 属性名;`，因为编译器会自动加上），如

```
@interface ViewController()

@property (nonatomic, copy) NSString *name;

@end


@implementation ViewController

@synthesize name; // 这一句可以不写，编译器会自动加上（默认加上 @synthesize name = _name;）

@end

```

注意：如果要重写某个属性的 **getter** 和 **setter** 方法，则必须显示地的写明：`@synthesize name = _name;`，否则会报错，提示`_name`为定义，如

```
@interface ViewController()

@property (nonatomic, copy) NSString *name;

@end


@implementation ViewController

@synthesize name = _name; // 这句必须有，否则会报错

- (NSString *)name {
    return _name;
}

- (void)setName:(NSString *)name {
    _name = name;
}

@end

```

<br>
***
<br>


### @dynamic

作用：用于生成对应的 **setter** 和 **getter** 方法，但`@ dynamic`表示这个成员变量的 **setter** 和 **getter** 方法并不是直接由编译器生成，而是手工生成或者运行时生成，如

```
@interface ViewController()

@property (nonatomic, copy) NSString *name;

@end


@implementation ViewController

@dynamic name;

- (NSString *)name {
    return _name;
}

- (void)setName:(NSString *)name {
    _name = name;
}

@end

```

注意：如果为某个属性应用了该关键字，却没有实现 **setter** 和 **getter** 方法，那么在编译时还不会报错，但在运行的时候可能会Crash（如果访问了该属性的 **setter** 和 **getter** 方法）。


<br>
***
<br>


### @encode

作用：用于表示一个类型的字符串（[官方的类型说明文档](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html)），如

```
char *enc1 = @encode(int); // enc1 = "i"
char *enc2 = @encode(id);  // enc2 = "@"
    
```


<br>
***
<br>


### @compatibility_alis

作用：用于给一个类设置一个别名，如

```
#import "ViewController1.h"
#import "ViewController2.h"

@compatibility_alias Test ViewController2;

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    Test *controller = [Test new];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

```


<br>
***
<br>


### @autoreleasepool

作用：用于 ARC 下代替 `NSAutoreleasePool`，[苹果的官方文档](http://developer.apple.com/library/ios/#releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html) 中提到，`@autoreleasepool` 比 `NSAutoreleasePool` 快 6 倍。


<br>
***
<br>


### 参考资料

* [Objective-C 2.0 保留字速查表](https://maniacdev.com/cheatsheetobjccd.pdf)