# 消息转发及其实际应用

### 简介

在Objective-C中，在调用对象的某个方法时，其实是在向这个对象发送消息。系统会查看这个对象能否接收该消息，如果不能，则会进行消息转发，消息转发最多三个步骤（注：如果前一步成功处理了消息，那么就不会走到下一步）：

1. 调用`resolveInstanceMethod:`或`resolveClassMethod:`来决定是否动态添加方法。如果动态添加，则消息得到处理，消息转发结束；否则，进入下一步。

2. 调用`forwardingTargetForSelector:`来确定能不能把这条消息转给其他接收者处理，如果返回一个非`self`的对象，则会把消息发送给该对象，消息转发结束；否则，进入下一步。

3. 通过`methodSignatureForSelector:`方法获取签名，如果签名为nil，则消息无法处理，抛出异常；否则，调用`forwardInvocation:`方法，调用成功则消息转发结束，调用失败则消息无法处理，抛出异常。

**注：步骤越往后，处理消息的代价越大。**


<br>
***
<br>


### 实例

#### 例一：通过`resolveInstanceMethod:`为`ViewController`类的`name`属性动态添加 getter & setter 方法

```
// ViewController.m

#import <objc/runtime.h>
#import "ViewController.h"


@interface ViewController()

@property (nonatomic, strong) NSString *name;

@end


@implementation ViewController2

@dynamic name;

id GetterName(id self, SEL cmd) {
    return objc_getAssociatedObject(self, cmd);
}

void SetterName(id self, SEL cmd, NSString *value) {
    NSString *sel = NSStringFromSelector(cmd);
    NSString *key = [sel substringWithRange:NSMakeRange(3, sel.length - 4)].lowercaseString;
    objc_setAssociatedObject(self, NSSelectorFromString(key), value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setName:@"test"];
    NSLog(@"get name: %@", [self name]);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(name)) {
        // "@@:"的意思：
        // 第一个字符表示函数的返回值类型，"@"表示GetterName函数的返回值类型为id
        // 后面的字符表示函数的参数类型，"@:"表示GetterName函数接收两个参数，
        // "@"表示参数类型为id，":"表示参数类型为SEL
        class_addMethod(self, sel, (IMP)GetterName, "@@:");
        return YES;
    }
    if (sel == @selector(setName:)) {
        // "v@:@"的意思：
        // "v"表示SetterName函数的返回值类型为void
        // "@:@"参见上面
        class_addMethod(self, sel, (IMP)SetterName, "v@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
```

<br>

#### 例二：通过`forwardingTargetForSelector:`将发给`ViewController`类的`name`消息，转给`Person`类来处理

```
// ViewController.m

#import <objc/runtime.h>
#import "ViewController.h"
#import "Person.h"


@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"name: %@", [self performSelector:@selector(name)]);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSString *sel = NSStringFromSelector(aSelector);
    
    if ([sel isEqualToString:@"name"]) {
        return [Person new];
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

@end
```

```
// Person.h

@interface Person : NSObject

- (NSString *)name;

@end


// Person.m

#import "Person.h"

@implementation Person

- (NSString *)name {
    return @"I'm a tester";
}

@end
```

**注意：`resolveInstanceMethod:`或`resolveClassMethod:`方法必须返回`NO`，否则不会调用`forwardingTargetForSelector:`方法。**

<br>

#### 例三：通过`methodSignatureForSelector:`与`forwardInvocation:`，将发送给`ViewController`类的消息`name`转发给`Person`类处理

```
#import <objc/runtime.h>
#import "ViewController.h"
#import "Person.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"name: %@", [self performSelector:@selector(name)]);
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    // 这里必须返回NO
    return NO;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    // 这里必须返回nil
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"name"]) {
        // 为转发的方法手动生成签名
        return [NSMethodSignature signatureWithObjCTypes:"@@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    SEL selector = [anInvocation selector];
    // 将消息转给Person类
    Person *person = [Person new];
    if ([person respondsToSelector:selector]) {
        [anInvocation invokeWithTarget:person];
    }
}

@end
```

```
// Person.h

@interface Person : NSObject

- (NSString *)name;

@end


// Person.m

#import "Person.h"

@implementation Person

- (NSString *)name {
    return @"I'm a tester";
}

@end
```

**注意：`resolveInstanceMethod:`或`resolveClassMethod:`方法必须返回`NO`，且`forwardingTargetForSelector:`必须返回`nil`，否则不会调用`methodSignatureForSelector:`与`forwardInvocation:`方法。**