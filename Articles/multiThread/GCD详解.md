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

1. 通过`dispatch_queue_create`函数生成Dispatch Queue

```
// 生成一个串行队列
dispatch_queue_t queue = dispatch_queue_create("queueName", NULL);

// 生成一个并行队列
dispatch_queue_t queue = dispatch_queue_create("queueName", DISPATCH_QUEUE_CONCURRENT);
```

注意：

* `dispatch_queue_create`函数可生成任意多个`Dispatch Queue`
* 当生成多个串行队列时，各个串行队列将并行执行。
* `dispatch_queue_create`函数生成队列，不管是并行队列还是串行队列，都与默认优先级的Global Dispatch Queue使用相同执行优先级的线程。

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

注意：

* 对 Main Dispatch Queue 和 Global Dispatch Queue 执行`dispatch_retain`和`dispatch_release`函数是无效的


<br>
***
<br>


### 四. 变更Dispatch Queue的执行优先级

通过`dispatch_set_target_queue`函数来变更指定队列的执行优先级：

```
dispatch_queue_t originQueue = dispatch_queue_create("com.tcer.testQueue", NULL);
dispatch_queue_t targetQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);

// 将originQueue的执行优先级变更为与globalQueue一样
dispatch_set_target_queue(originQueue, targetQueue);
```

注意：

* 不能使用该方法变更 Main Dispatch Queue 和 Global Dispatch Queue 的执行优先级
* 如果通过该函数，将多个串行队列的优先级都变更为与另一个串行队列（目标队列）一样，那么这些原本应该并行执行的串行队列，在目标队列上只能同时执行一个处理（注：该特点可用于防止多个串行队列中的处理并行执行），如下：

```
dispatch_queue_t originQueue1 = dispatch_queue_create("com.tcer.testQueue1", NULL);
dispatch_queue_t originQueue2 = dispatch_queue_create("com.tcer.testQueue2", NULL);
dispatch_queue_t targetQueue = dispatch_queue_create("com.tcer.testQueue3", NULL);

// 将 originQueue1 和 originQueue2 的执行优先级变更为与 targetQueue 一样
// 注：变更后，originQueue1 和 originQueue2 将由并行执行变为串行执行
dispatch_set_target_queue(originQueue1, targetQueue);
dispatch_set_target_queue(originQueue2, targetQueue);
```

<br>
***
<br>


### 五. 在指定时间后执行处理

可以通过`dispatch_after`函数，在指定时间追加处理到Dispatch Queue（注：不是在指定时间后执行处理）：

```
// 3秒后，将block追加到主队列
// 注意：因为主队列在主线程的RunLoop中执行，所以block最快在3秒后执行，并且在主队列有大量处理追加或主线程的处理本身有延迟时，
// 这个时间会更长。
dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull * NSEC_PER_SEC);
dispatch_after(time, dispatch_get_main_queue(), ^{...});
```

<br>
***
<br>


### 六. 获取指定时间后的时间

可以通过`dispatch_time`函数，获取从指定时间开始，指定时间后的相对时间：

```
dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3ull * NSEC_PER_SEC);
```

* DISPATCH_TIME_NOW，它表示现在的时间。
* ull，即`unsigned long long`，是C语言的数值字面量。
* NSEC_PER_SEC表示秒数，NSEC_PER_NSEC表示毫秒。
* dispatch_walltime函数用于计算绝对时间


<br>
***
<br>


### 七. 等待多个并行处理结束后，再执行指定处理

1. 通过Dispatch Group与dispatch_group_notify来实现

```
dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
// 创建group
dispatch_group_t group = dispatch_group_create(); 
// 将指定的block追加到queue中，该block属于指定的group
dispatch_group_async(group, queue, ^{...}); 
dispatch_group_async(group, queue, ^{...});
dispatch_group_async(group, queue, ^{...});
// 在追加到group中的处理都结束时，将block追加到主队列中
dispatch_group_notify(group, dispatch_get_main_queue(), ^{...});
dispatch_release(group);
```

2. 通过Dispatch Group与dispatch_group_wait来实现

```
dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
dispatch_group_t group = dispatch_group_create(); 
dispatch_group_async(group, queue, ^{...}); 
dispatch_group_async(group, queue, ^{...});
dispatch_group_async(group, queue, ^{...});
// 等待追加到group中的处理执行结束
long result = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
dispatch_release(group);
```

* DISPATCH_TIME_FOREVER，意味着永久等待，只要group中的处理尚未执行结束，就会一直等待，中途不能取消。
* DISPATCH_TIME_NOW，意味着不用等待即可判定追加到group中的处理是否执行结束。
* 如果dispatch_group_wait函数的返回不为0，就意味着虽然经过了指定的时间，但属于group的某一个处理还在执行中。如果返回值为0，
那么说明全部处理执行结束。
* 当等待时间为DISPATCH_TIME_FOREVER时，dispatch_group_wait函数的返回值恒为0。



