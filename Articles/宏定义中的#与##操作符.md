# 宏定义中的#与##操作符

### 字符串化操作符`#`

作用：在目标宏参数的左右各加上一个双引号，从而将宏参数转为字符串，如：

```
#define test(num) NSLog(@"%@", @"test"#num)

- (void)viewDidLoad {
    [super viewDidLoad];
    test(10); // 输出结果：test10
}
```

注意：

* 只有宏参数能够被`#`转换为字符串
* `#`只在宏定义中有效


<br>
***
<br>


### 连接符`##`

作用：将两个相邻的标记(token)连接为一个单独的标记，如：

```
#define customVar(varName, varValue) id cs_##varName = varValue

- (void)viewDidLoad {
    [super viewDidLoad];
    customVar(test, @"test");
    NSLog(@"%@", cs_test); // 输出结果：test
}
```

注意：

* `##`必须位于宏定义中才有效
* `##`连接的对象只要是token就行