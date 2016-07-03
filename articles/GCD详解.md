# GCD详解

### 一. Dispatch Queue的分类

* 串行队列：系统使用一个线程，按照任务的添加顺序有序执行，一次只能执行一个任务，当前一个任务执行完毕后才能开始下一个任务。
* 并行队列：系统使用多个线程，无序地并行执行多个任务，并行执行的任务数量取决于当前系统状态。

注意：

* 当使用多个线程更新相同资源会导致数据竞争时，适用串行队列。
* 当并行执行多个处理不会发生数据竞争时，适用并行队列。


<br>
***
<br>


### 二. Dispatch Queue的创建方法

1. 通过`dispatch_create_queue`函数生成Dispatch Queue

```
// 生成一个串行队列
dispatch_queue_t queue = dispatch_create_queue("queueName", NULL);

// 生成一个并行队列
dispatch_queue_t queue = dispatch_create_queue("queueName", DISPATCH_QUEUE_CONCURRENT);
```

注意：

* `dispatch_create_queue`函数可生成任意多个`Dispatch Queue`
* 当生成多个串行队列时，各个串行队列将并行执行。

<br>

2. 通过`dispatch_get_main_queue`函数生成Main Dispatch Queue

```
dispatch_queue_t mainQueue = dispatch_get_main_queue();
```

注意：

* Main Dispatch Queue是在主线程中执行的队列，由于主线程只有一个，所以它是串行队列。

<br>

3. 通过`dispatch_get_global_queue`函数生成Global Dispatch Queue

```
dispatch_queue_t globalQueue = dispatch_get_global_queue(优先级, 0);
```

注意：

* Global Dispatch Queue是并行队列
* Global Dispatch Queue有4个执行优先级：
	* DISPATCH_QUEUE_PRIORITY_HIGH -- 高优先级
	* DISPATCH_QUEUE_PRIORITY_DEFAULT -- 默认优先级
	* DISPATCH_QUEUE_PRIORITY_LOW -- 低优先级
	* DISPATCH_QUEUE_PRIORITY_BACKGROUND -- 后台优先级


<br>
***
<br>


### 三. 队列的释放和持有

即使开启了ARC，生成的`Dispatch Queue`也必须由程序员来负责释放（因为`Dispatch Queue`没有作为Objective-C对象来处理的技术）：

```
// 持有队列
dispatch_retain(queue);

// 释放队列
dispatch_release(queue);
```
