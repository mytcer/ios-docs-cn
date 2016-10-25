# 锁的种类及其特点

在Objective-C中，如果有多个线程要执行同一份代码，就会出现线程安全问题。锁机制正是用于解决这一问题，确保同一时间内只有一个线程执行目标代码。


<br>
***
<br>


### @synchronized(anObject)

说明：根据给定的对象，自动创建一个锁，并等待块中的代码执行完毕。当执行到代码结尾处时，锁就释放了，如

```
// 该类用于多线程环境下的测试

@implementation TestObj

- (void)method1 {
    NSLog(@"Test: %@",NSStringFromSelector(_cmd));
}

- (void)method2 {
    NSLog(@"Test: %@",NSStringFromSelector(_cmd));    
}

@end

```

```
#import "TestObj.h"
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 主线程中
    TestObj *obj = [[TestObj alloc] init];
    
    // 线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized (self) {
            [obj method1];
            sleep(5);
        }
    });
    
    // 线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1); // 以保证让线程2的代码后执行
        @synchronized (self) {
            [obj method2];
        }
    });
}

@end

结果：method1 执行后，等待5秒再执行 method2，即线程1锁住后，线程2会一直等待，直到线程1解锁后，method2 才会执行。

```

优点：不需要在代码中显式的创建锁对象，便可以实现锁的机制

缺点：`@synchronized(anObject)`方法针对`anObject`只有一个锁（多个同步块会共用这个锁），如果有多个同步块，则其他的同步块都要等待当前同步块执行完毕才能继续执行，降低了执行效率，如


<br>
***
<br>


### NSLock

说明：最基本的锁对象，如

```
#import "TestObj.h"
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 主线程中
    TestObj *obj = [[TestObj alloc] init];
    NSLock *lock = [[NSLock alloc] init];
    
    // 线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [lock lock];
        [obj method1];
        sleep(5);
        [lock unlock];
    });
    
    // 线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1); // 以保证让线程2的代码后执行
        [lock lock];
        [obj method2];
        [lock unlock];
    });
}

@end

```

缺点：使用不当容易出现死锁，比如在递归或循环中使用（这种情况下，适合用`NSRecursiveLock`）

```
#import "ViewController1.h"
#import "TestObj.h"


@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 主线程中
    NSLock *theLock = [[NSLock alloc] init];
    TestObj *obj = [[TestObj alloc] init];
    
    // 线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        static void(^TestMethod)(int);
        TestMethod = ^(int value) {
            [theLock lock];
            if (value > 0) {
                [obj method1];
                sleep(5);
                TestMethod(value-1);
            }
            [theLock unlock];
        };
        TestMethod(5);
    });
    
    // 线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        [theLock lock];
        [obj method2];
        [theLock unlock];
    });
}

@end

结果：method1 只会被调用一次（预期是5次），method2 不会被调用。

原因：线程1被加锁2次（TestMethod内 [theLock lock] 被执行2次），却从未解锁（TestMethod内 [theLock unlock] 一次都没执行），出现了死锁，导致线程1与线程2都被锁住了。

```

<br>
***
<br>


### C语言的pthread_mutex_t

```
#import "pthread.h"
#import "TestObj.h"
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 主线程中
    TestObj *obj = [[TestObj alloc] init];
    __block pthread_mutex_t mutex;
    pthread_mutex_init(&mutex, NULL);
    
    // 线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        pthread_mutex_lock(&mutex);
        [obj method1];
        sleep(5);
        pthread_mutex_unlock(&mutex);
    });
    
    // 线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        pthread_mutex_lock(&mutex);
        [obj method2];
        pthread_mutex_unlock(&mutex);
    });
}

@end

```


<br>
***
<br>


### GCD信号量

```
#import "TestObj.h"
#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 主线程中
    TestObj *obj = [[TestObj alloc] init];
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    // 线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 减少信号量
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        [obj method1];
        sleep(5);
        // 增加信号量
        dispatch_semaphore_signal(semaphore);
    });
    
    // 线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        [obj method2];
        dispatch_semaphore_signal(semaphore);
    });
}

@end

```

<br>
***
<br>


### NSRecursiveLock

说明：递归锁，该类定义的锁可以在同一线程多次lock，而不会造成死锁。递归锁会跟踪它被lock多少次，每次成功的lock都必须平衡调用unlock操作，只有所有的加锁和解锁操作都平衡的时候，锁才真正被释放给其他线程获得。

`NSLock`章节的死锁例子，只需将锁换成递归锁即可解决，如

```
#import "ViewController1.h"
#import "TestObj.h"


@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 主线程中
    NSRecursiveLock *theLock = [[NSRecursiveLock alloc] init];
    TestObj *obj = [[TestObj alloc] init];
    
    // 线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        static void(^TestMethod)(int);
        TestMethod = ^(int value) {
            [theLock lock];
            if (value > 0) {
                [obj method1];
                sleep(5);
                TestMethod(value-1);
            }
            [theLock unlock];
        };
        TestMethod(5);
    });
    
    // 线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        [theLock lock];
        [obj method2];
        [theLock unlock];
    });
}

@end

结果：线程1中 TestMethod 执行5次后，再执行线程2中的代码。

```


<br>
***
<br>


### NSConditionLock

说明：条件锁，只有满足指定条件的情况下才能解锁或加锁，如

```
#import "ViewController.h"

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 主线程中
    NSConditionLock *theLock = [[NSConditionLock alloc] init];
    
    // 线程1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i=0;i<=2;i++)
        {
            [theLock lock];
            NSLog(@"thread1:%d",i);
            sleep(1);
            // 满足指定条件时才解锁
            [theLock unlockWithCondition:i];
        }
    });
    
    // 线程2
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 满足指定条件才加锁
        [theLock lockWhenCondition:2];
        NSLog(@"thread2");
        [theLock unlock];
    });
}

@end

结果：thread1:0，thread1:1，thread1:2，thread2

```

注意：`NSConditionLock`也跟其它的锁一样：需要`lock`与`unlock`对应，只是`lock`、`lockWhenCondition:`与`unlock`、`unlockWithCondition:`是可以随意组合的。


<br>
***
<br>


### NSDistributedLock

说明：分布锁，通过文件系统实现，适用于在多个进程或多个程序之间构建互斥的场景（**其他的锁都用于解决多线程之间的冲突**），它并非继承于`NSLock`，只实现了`tryLock`，`unlock`，`breakLock`，如（注：该示例没有亲自验证过）

```
// 程序A
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSDistributedLock *lock = [[NSDistributedLock alloc] initWithPath:@"file path"];
    [lock breakLock];
    [lock tryLock];
    sleep(5);
    [lock unlock];
    NSLog(@"appA: OK");
});

// 程序B
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSDistributedLock *lock = [[NSDistributedLock alloc] initWithPath:@"file path"];
    while (![lock tryLock]) {
        NSLog(@"appB: waiting");
        sleep(1);
    }
    [lock unlock];
    NSLog(@"appB: OK");
});

结果：当程序A运行的时候，程序B一直处于等待中，大概5秒之后，程序B打印出log。

```

**注意：程序A与程序B中的`file path`必须是同一个文件或文件夹的地址，如果该地址不存在，那么在`tryLock`返回YES时，会自动创建该文件或文件夹。在结束时该文件/文件夹会被清除，所以在选择的该路径的时候，应该选择一个不存在的路径，以防止误删了文件。**