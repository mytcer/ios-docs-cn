# GCD详解

### 一. Dispatch Queue的分类

* 串行队列：系统使用一个线程，按照任务的添加顺序有序执行，一次只能执行一个任务，当前一个任务执行完毕后才能开始下一个任务。
* 并行队列：系统使用多个线程，无序地并行执行多个任务，并行执行的任务数量取决于当前系统状态。

注意：

* 当使用多个线程更新相同资源会导致数据竞争时，适用串行队列；否则，适用并行队列。


<br>
***
<br>


### 二. Dispatch Queue的创建方法

1. 通过`dispatch_create_queue`函数生成Dispatch Queue

```
// 生成一个串行队列
dispatch_queue_t queue = dispatch_create_queue("com.tcer.testSerialDispatchQueue", NULL);
```

注意：

* `dispatch_create_queue`函数可生成任意多个`Dispatch Queue`
* 当生成多个串行队列时，各个串行队列将并行执行。