# NSThread、NSOperation/NSOperationQueue、GCD三种多线程技术的对比及使用

### 一. 三种多线程技术的对比

* NSThread
    * 说明：每个`NSThread`对象对应一个线程。
    * 优点：轻量级，使用简单
    * 缺点：需要自己管理线程的生命周期
    * 适用：
        * 需要自己管理线程的场景
        * 只是简单地在线程中执行一个任务的场景

* NSOperation/NSOperationQueue
    * 说明：面向对象的多线程技术
    * 优点：自带线程周期管理；通过`NSOperationQueue`可以给各个操作（`NSOperation`子类的实例）添加依赖关系、取消操作的执行、暂停和恢复操作队列
    * 缺点：`NSOperation`是一个抽象类，只能实现它或者使用系统预定义好的两个子类：`NSInvocationOperation`和`NSBlockOperation`
    * 适用：
        * 多个操作需要设置依赖关系；
        * 操作有暂停、恢复、取消的需求；

* GCD
    * 说明：它是基于C语言开发的，用于多核编程的解决方案。
    * 优点：它以FIFO的顺序执行并发任务，使用它时我们不用关系任务的调度情况；三种技术中它最高效。
    * 缺点：如果想给任务之间添加依赖关系、取消或暂停一个正在执行的任务，则比较棘手。
    * 适用：需要处理大量并发数据，且对性能有要求。


<br>
***
<br>


### 二. NSThread基本使用

#### 开启新线程

```
// 动态实例化
NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(method) object:nil];
thread.threadPriority = 1; // 设置线程的优先级(0.0 - 1.0，1.0最高级)
[thread start];

// 静态实例化
[NSThread detachNewThreadSelector:@selector(method) toTarget:self withObject:nil];

// 隐式实例化
[self performSelectorInBackground:@selector(method) withObject:nil];

```

<br>

#### 获取线程

```
// 获取当前线程
NSThread *current = [NSThread currentThread];

// 获取主线程
NSThread *main = [NSThread mainThread];

```

<br>

#### 暂停线程

```
[NSThread sleepForTimeInterval:2];

```

<br>

#### 线程之间通信

```
// 在指定线程上执行操作
[self performSelector:@selector(run) onThread:thread withObject:nil 
waitUntilDone:YES]; 

// 在主线程上执行操作
[self performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:YES]; 

// 在当前线程执行操作
[self performSelector:@selector(run) withObject:nil];

```

<br>
***
<br>


### 三. NSOperation/NSOperationQueue

`NSOperation`是抽象类，不能直接实例化，如果我们想要使用它来执行具体的任务，就必须创建自己的子类或使用系统预定义的子类。


#### 系统预定义的子类

**NSInvocationOperation**：它可以通过指定对象及selector，直接创建一个`NSInvocationOperation`对象，如

```
NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(testMethod) object:nil];

```

**NSBlockOperation**：我们可以使用它来并发执行一个或多个任务，只有当一个`NSBlockOperation`所关联的所有 block 都执行完毕时，这个`NSBlockOperation`才算执行完成，如

```
NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
    // code1
}];

[operation addExecutionBlock:^{
    // code2
}];

[operation addExecutionBlock:^{
    // code3
}];
    
```

<br>

#### 执行方式

* 将操作添加到一个操作队列中，让操作队列来帮我们自动执行。
* 直接调用操作的`start`方法（默认同步执行）

<br>

#### 支持的特性

* 在操作之间建立依赖关系，只有当被依赖的操作执行完毕时，当前操作才会开始执行。
* 支持一个可选的 completion block（`setCompletionBlock:`），该block会在操作的主任务执行完成时被调用。
    * 当一个操作被取消时，它的 completion block 仍然会执行，所以最好在 completion block 里检查一下`isCancelled`的值。
    * completion block 不一定是在主线程执行
* 支持通过`KVO`来观察操作执行状态的变化
* 支持设置操作执行的队列优先级（`setQueuePriority:`）
    * 新建的操作，队列优先级默认都是`normal`。
    * 队列优先级只应用于相同操作队列里的操作之间
    * 队列优先级只决定`isReady`状态为YES的操作的执行顺序，如两个操作A和B，当`isReady`均为YES时，优先级高的操作先执行；如果A的`isReady`为YES，B的`isReady`为NO，则A先执行（即使B的优先级更高，因为B还没ready）。
* 支持取消正在执行的操作
* 在执行一个操作（调用操作的`start`方法）或将操作添加到操作队列前，可以通过操作的`setThreadPriority:`方法来修改执行该操作的线程的优先级（`0.0 ~ 1.0`，`0.0`表示最低优先级，`1.0`表示最高优先级，默认值`0.5`）
    * 当操作开始执行时，操作默认的`start`方法会使用我们指定的值来修改当前线程的优先级
    * 我们指定的这个线程优先级，只会影响`main`方法执行时所在线程的优先级，所有其他的代码会一直以默认的线程优先级执行。
    * 如果自定义一个并发的`NSOperation`子类时，需要在`start`方法中根据指定的值自行修改线程的优先级。

<br> 
    
#### 注意

* 无法暂停执行一个操作，只能直接取消掉。
* 暂停执行操作队列并不能使正在执行的操作暂停执行，而只是简单地暂停调度新的操作。


<br>
***
<br>

### 参考资料

* [iOS 并发编程之 Operation Queues](http://blog.leichunfeng.com/blog/2015/07/29/ios-concurrency-programming-operation-queues/)