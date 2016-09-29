# 线程死锁详解

### 一. 什么是线程死锁？

线程死锁，通常是指一个线程内或多个线程间出现了循环等待（即A等待B，B又等待A）。


<br>
***
<br>


### 二. 在主线程调用GCD的同步方法会造成线程死锁？

例一：在主线程调用`dispatch_sync`方法向主队列添加一个任务

```
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"log");
        });
    }
    return 0;
}
// 结果：没有输出"log"，且出现了crash（xcode中异常断点在dispatch_sync这一行）
```


例二：在主线程调用`dispatch_sync`方法向全局队列添加一个任务

```
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSLog(@"log");
        });
    }
    return 0;
}

// 结果：输出了"log"
```


分析：

* 在主线程中调用`dispatch_sync`方法，可以看做是主线程中正在执行的任务1；而添加到队列中的block，可以看做是等待在线程中执行的任务2。

* `dispatch_sync`是一个同步方法，它会阻塞主线程，直到block执行完毕（`dispatch_sync`方法等到block执行完毕后才会返回），这意味着任务1在等待任务2。

* 例一将任务2添加到主队列中，由于主队列是串行队列，且主队列中的任务会在主线程执行，所以任务2只有在任务1执行完毕后才会执行，这意味着任务1与任务2出现了相互等待，这就导致主线程一直处于被阻塞的状态。

* 例二将任务2添加到全局队列中，由于全局队列是并行队列，会新开线程来执行任务2，这意味着任务1与任务2不会出现相互等待，所以主线程不会一直被阻塞。


结论：在主线程中同步地向主队列添加任务，会导致线程死锁；向非主队列添加任务时，不会线程导致死锁。


<br>
***
<br>


### 三. 在子线程调用GCD的同步方法是否会导致线程死锁？

例三：在子线程中调用`dispatch_sync`方法向一个串行队列添加任务

```
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatch_queue_t queue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
        dispatch_async(queue, ^{
            NSLog(@"log 1");
            dispatch_sync(queue, ^{
                NSLog(@"log 2");
            });
        });
    }
    return 0;
}
// 结果：输出了"log 1"，但没有输出"log 2"（xcode中异常断点在dispatch_sync这一行）
```

例四：在子线程中调用`dispatch_sync`方法向一个并行队列添加任务

```
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        dispatch_queue_t queue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
        dispatch_async(queue, ^{
            NSLog(@"log 1");
            dispatch_sync(queue, ^{
                NSLog(@"log 2");
            });
        });
    }
    return 0;
}
// 结果：输出了"log 1"和"log 2"
```

分析：两个例子的区别，仅仅在于队列类型不同：例三是串行队列，例四是并行队列，这与例一和例二的情况一样。

结论：在子线程中同步地向对应的串行队列添加任务，会导致线程死锁。


<br>
***
<br>


### 四. 最终结论

结合以上四个例子，可以得出一个结论：**在一个串行队列中，通过GCD的同步方法向这个队列添加任务，会导致线程死锁。**

