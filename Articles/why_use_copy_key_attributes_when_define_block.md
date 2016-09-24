# 定义block属性时为什么要用copy关键字

例子：`@property (nonatomic, copy) BlockType callback;`

原因：

* block在创建的时候，它的内存是分配在栈上的，可能被随时回收。
* block本身的作用域是属于创建时候的作用域，一旦在该作用域之外调用block，就会导致程序crash。

而通过`copy`可以把block拷贝到堆上，既避免了随时回收的问题，又保证block可以在声明域外使用。