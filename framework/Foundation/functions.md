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
***
<br>


### 包

**`NSLocalizedString`**

说明：返回一个字符串的本地化版本

使用：`NSString *localStr = NSLocalizedString(NSString *key, NSString *comment);`

类型：宏

注意：

* 使用该宏来生成默认的`Localizable.strings`文件

<br>


**`NSLocalizedStringFromTable`**

说明：返回指定表中字符串的本地化版本

使用：`NSString *localStr = NSLocalizedStringFromTable(NSString *key, NSString *tableName, NSString *comment);`

类型：宏

注意：

* 使用该宏来生成`[tableName].strings`文件

<br>


**`NSLocalizedStringFromTableInBundle`**

说明：返回一个字符串的本地化版本

使用：`NSString *localStr = NSLocalizedStringFromTableInBundle(NSString *key, NSString *tableName, NSBundle *bundle, NSString *comment);`

类型：宏

注意：

* 使用该宏在指定的包中生成`[tableName].strings`文件

<br>


**`NSLocalizedStringWithDefaultValue`**

说明：返回一个字符串的本地化版本

使用：`NSString *localStr = NSLocalizedStringWithDefaultValue(NSString *key, NSString *tableName, NSBundle *bundle, NSString *value, NSString *comment);`

类型：宏

注意：

* 使用该宏在指定的包中生层`[tableName].strings`文件


<br>
***
<br>


### 字节排序

**`NSConvertHostDoubleToSwapped`**

说明：将指定的双精度浮点数的值转换成可以交换字节的值

使用：`NSSwappedDouble result = NSConvertHostDoubleToSwapped(double x);`

注意：

* 该函数并不会真的交换`x`的字节
* 你不应该直接调用该函数

<br>


**`NSConvertHostFloatToSwapped`**

说明：将指定的单精度浮点数的值转换成可以交换字节的值

使用：`NSSwappedFloat result = NSConvertHostFloatToSwapped(float x);`

注意：

* 该函数并不会真的交换`x`的字节
* 你不应该直接调用该函数

<br>


**`NSConvertSwappedDoubleToHost`**

说明：将指定的值转换为双精度浮点数值

使用：`double result = NSConvertSwappedDoubleToHost(NSSwappedDouble x);`

注意：

* 该函数并不会真的交换`x`的字节
* 你不应该直接调用该函数

<br>


**`NSConvertSwappedFloatToHost`**

说明：将指定的值转为单精度浮点数值

使用：`float result = NSConvertSwappedFloatToHost(NSSwappedFloat x);`

注意：

* 该函数并不会真的交换`x`的字节
* 你不应该直接调用该函数

<br>


**`NSHostByteOrder`**

说明：返回字节存储次序格式：`NS_LittleEndian` 或 `NS_BigEndian`。

使用：`long result = NSHostByteOrder();`
