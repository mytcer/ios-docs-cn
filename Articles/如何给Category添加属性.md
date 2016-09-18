# 如何给Category添加属性？

### 示例

以给`ViewController+Alias`添加一个`aliasName`属性为例：

```
// UIViewController+Alias.h

@interface UIViewController (Alias)
@property (nonatomic, strong) NSString *aliasName;
@end


// UIViewController+Alias.m

#import <objc/runtime.h>
#import "UIViewController+Alias.h"

@implementation UIViewController (Alias)

- (void)setAliasName:(NSString *)alias {
    objc_setAssociatedObject(self, @selector(aliasName), alias, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)aliasName {
    return objc_getAssociatedObject(self, @selector(aliasName));
}
```

<br>
***
<br>

### 参考资料

* [Objective-C Associated Objects 的实现原理](http://blog.leichunfeng.com/blog/2015/06/26/objective-c-associated-objects-implementation-principle/)