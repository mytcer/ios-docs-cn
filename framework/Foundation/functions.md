# 函数及类似函数的宏

### 断言

**`NSAssert`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSAssert(condition, desc, ...);`

类型：宏

注意：

* 这个宏只能在Objective-C方法中使用

* 如果定义了预处理宏`NS_BLOCK_ASSERTIONS`，那么断言会被禁用。

* 不要在该宏的`condition`参数中调用函数，因为当宏被禁用时，`condition`参数不会被求值，函数也就不会被调用。

<br>


**`NSAssert1`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSAssert1(condition, desc, arg1);`

类型：宏

注意：

* 该宏与`NSAssert`的区别在于第三个参数的数量

<br>


**`NSAssert2`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSAssert2(condition, desc, arg1, arg2);`

类型：宏

<br>


**`NSAssert3`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSAssert3(condition, desc, arg1, arg2, arg3);`

类型：宏

<br>


**`NSAssert4`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSAssert4(condition, desc, arg1, arg2, arg3, arg4);`

类型：宏

<br>


**`NSAssert5`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSAssert5(condition, desc, arg1, arg2, arg3, arg4, arg5);`

类型：宏

<br>


**`NSCAssert`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSCAssert(condition, NSString *description);`

类型：宏

注意：

* 这个宏只能在C方法中使用（与`NSAssert`的区别在于此）

* 如果定义了预处理宏`NS_BLOCK_ASSERTIONS`，那么断言会被禁用，所有宏返回`void`。

* 不要在该宏的`condition`参数中调用函数，因为当宏被禁用时，`condition`参数不会被求值，函数也就不会被调用。

<br>


**`NSCAssert1`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSCAssert1(condition, NSString *description, arg1);`

类型：宏

注意：

* 与`NSCAssert`的区别在于参数数量

<br>


**`NSCAssert2`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSCAssert2(condition, NSString *description, arg1, arg2);`

类型：宏

<br>


**`NSCAssert3`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSCAssert3(condition, NSString *description, arg1, arg2, arg3);`

类型：宏

<br>


**`NSCAssert4`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSCAssert4(condition, NSString *description, arg1, arg2, arg3, arg4);`

类型：宏

<br>


**`NSCAssert5`**

说明：如果给定的条件为假，则产生一个断言。

使用：`NSCAssert5(condition, NSString *description, arg1, arg2, arg3, arg4, arg5);`

类型：宏

<br>


**`NSCParameterAssert`**

说明：用于验证一个C函数的参数，如果对参数的求值结果为false，则打印包含参数的错误信息，然后抛出一个异常。

使用：`NSCParameterAssert(condition);`

类型：宏

注意：

* 如果定义了预处理宏`NS_BLOCK_ASSERTIONS`，那么断言会被禁用，所有宏返回`void`。

<br>


**`NSParameterAssert`**

说明：用于验证一个Objective-C方法的参数，如果对参数的求值结果为false，则打印包含参数的错误信息，然后抛出一个异常。

类型：宏

注意：

* 如果定义了预处理宏`NS_BLOCK_ASSERTIONS`，那么断言会被禁用，所有宏返回`void`。

<br>

