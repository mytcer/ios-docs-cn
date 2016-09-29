# 属性关键字assign，weak，strong，copy的区别

### `assign`与`weak`的区别

说明：

* `assign`适用于基本数据类型（NSInteger，CGFloat）和C数据类型（int、float、double、char），`weak`适用于NSObject对象。

* `weak`修饰的对象在释放之后，指针地址会自动置为nil。

注意：

* `assign`也可以用来修饰对象，之所以不这么做，是因为被`assign`修饰的对象（一般编译的时候会产生警告：Assigning retained object to unsafe property; object will be released after assignment）在释放之后，指针的地址还是存在的（指针并没有被置为nil），从而造成野指针，导致程序crash。

* 之所以可以用`assign`修饰基本数据类型，是因为基础数据类型一般分配在栈上，栈的内存会由系统自己自动处理，不会造成野指针。


<br>
***
<br>


### `strong`与`copy`的区别

说明：`strong`与`copy`都会使引用计数加1，`strong`是指针拷贝（两个指针指向同一个内存地址），`copy`是内容拷贝（两个指针指向不同的内存地址）。

注意：

* 如果`copy`修饰的对象是数组，则只会复制数组元素的指针（浅复制），否则会复制内容（深复制）。