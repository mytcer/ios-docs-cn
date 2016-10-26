# 通过NSOperationQueue实现线程依赖

例子：现有三个任务A、B、C，要求三个任务都异步执行，且B依赖A，C依赖B。

```
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    // 设置最大并发数
    queue.maxConcurrentOperationCount = 3;
    
    // 创建三个任务
    NSBlockOperation *operationA = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"TaskA");
    }];
    NSBlockOperation *operationB = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"TaskB");
    }];
    NSBlockOperation *operationC = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"TaskC");
    }];
    
    // 设置三个任务的依赖关系
    [operationB addDependency:operationA];
    [operationC addDependency:operationB];
    
    // 添加操作到队列中
    [queue addOperation:operationA];
    [queue addOperation:operationB];
    [queue addOperation:operationC];
}

@end

结果：按照要求的依赖顺序输出了日志

```

注意：

* 必须在操作被添加到队列之前设置依赖关系
* 不能循环依赖