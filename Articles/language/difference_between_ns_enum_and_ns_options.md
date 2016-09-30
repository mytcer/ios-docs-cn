# NS_ENUM与NS_OPTIONS的区别

### NS_ENUM

说明：它用于定义一般的`NSInteger`类型的枚举，在使用其枚举值时，每次只能选择其中一项，如：

```
typedef NS_ENUM(NSInteger, UIViewContentMode) {
    UIViewContentModeScaleToFill,
    UIViewContentModeScaleAspectFit,
    UIViewContentModeScaleAspectFill,
    UIViewContentModeRedraw,
    UIViewContentModeCenter,
    UIViewContentModeTop,
    UIViewContentModeBottom,
    UIViewContentModeLeft,
    UIViewContentModeRight,
    UIViewContentModeTopLeft,
    UIViewContentModeTopRight,
    UIViewContentModeBottomLeft,
    UIViewContentModeBottomRight,
};

NSInteger contentMode = UIViewContentModeScaleAspectFit; // 只能指定一个枚举值，不能同时指定多个
```

注意：通过`NS_ENUM`定义枚举时，如果没有手动给每个枚举值赋值，那么会给每个枚举值赋予从0开始依次累加1的值。


<br>
***
<br>


### NS_OPTIONS

说明：它用于定义位掩码（bitmasked）类型的枚举，其枚举值可以进行组合使用，如：

```
typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
    UIViewAutoresizingNone                 = 0,
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
    UIViewAutoresizingFlexibleWidth        = 1 << 1,
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
    UIViewAutoresizingFlexibleHeight       = 1 << 4,
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
};

NSUInteger autoresizing = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight; // 可以同时指定多个枚举值，进行组合使用
```

<br>
***
<br>


### 系统如何知道我们是否使用了多个枚举值组合？

1. 首先，将各枚举值组合之后的新值（如：`NSUInteger autoresizing = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;`，即按位或运算），分别与各个枚举值进行按位与运算（如：`NSUInteger value1 = autoresizing & UIViewAutoresizingFlexibleWidth`）；

2. 然后，判断按位与运算的结果是否与目标枚举值相等（如：`value1 == UIViewAutoresizingFlexibleWidth`），若相等，则说明包含该枚举值，否则说明不包含。

>> 更详细地说明可以阅读[这篇文章](http://gold.xitu.io/post/57bee1c15bbb5000631d9845)