# 关联对象及其实际应用

### 简介

关联对象即给某个对象关联许多其他的对象，这些对象通过"键"来区分。关联这些对象时，可以指明存储策略，可用的存储策略值如下：

* **`OBJC_ASSOCIATION_ASSIGN`**：等效于`@property (assign) 或 @property (unsafe_unretained)`

* **`OBJC_ASSOCIATION_RETAIN_NONATOMIC`**：等效于`@property (nonatomic, strong)`

* **`OBJC_ASSOCIATION_COPY_NONATOMIC`**：等效于`@property (nonatomic, copy)`

* **`OBJC_ASSOCIATION_RETAIN`**：等效于`@property (atomic, strong)`

* **`OBJC_ASSOCIATION_COPY`**：等效于`@property (atomic, copy)`


<br>
***
<br>


### 相关的API

* **`objc_setAssociatedObject(id object, const void *key, id value, objc_AssociationPolicy policy)`**

    * 作用：以给定的键和策略为某对象设置关联对象值

* **`objc_getAssociatedObject(id object, void *key)`**

    * 作用：根据给定的键从某对象中获取对应的对象值

* **`objc_removeAssociatedObjects(id object)`**

    * 作用：移除指定对象的全部关联对象


<br>
***
<br>


### 实际应用

#### 应用一：通过关联对象给Category添加属性（以给`ViewController+Alias`添加一个`aliasName`属性为例）

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

