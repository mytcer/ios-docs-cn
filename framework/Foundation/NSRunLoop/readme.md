# NSRunLoop

### 简介

`NSRunLoop`对象处理来自窗口系统的事件（如键盘事件），`NSPort`对象，`NSConnection`对象及`NSTimer`事件。每个`NSThread`对象（包括应用的主线程）都会在需要的时候创建一个`NSRunLoop`对象


***
<br>
***


### API

**currentMode**

说明：返回当前runloop的输入模式，输入模式是在调用`acceptInputForMode:beforeDate:`和`runMode:beforeDate:`时设置的。

注意：仅在当前runloop处于运行中时，才会返回输入模式；否则，返回nil。

<br>

**- (NSDate *)limitDateForMode:(NSRunLoopMode)mode**

说明：返回下一次执行的时间，如果指定的mode不存在，则返回nil。

<br>

**- (CFRunLoopRef)getCFRunLoop**

说明：返回runloop的CFRunLoop对象

<br>

**- (void)addTimer:(NSTimer *)timer forMode:(NSRunLoopMode)mode**

说明：添加一个定时器到指定的mode

注意：

* 一个定时器可以添加到多个mode
* 添加的timer会被runloop持有，可以通过发送`invalidate`消息给timer来从runloop中移除timer。

<br>

**- (void)addPort:(NSPort *)aPort forMode:(NSRunLoopMode)mode**

说明：添加aPort到指定的mode

注意：

* 一个port可以添加到多个mode
* 当runloop运行在指定的mode时，会派发消息给该port的回调。

<br>

**- (void)removePort:(NSPort *)aPort forMode:(NSRunLoopMode)mode**

说明：从runloop的指定mode中移除aPort

注意：如果你将port添加到了多个mode中，那么就得在每个mode都移除一次。

<br>

**- (void)run**

说明：运行runloop，运行模式为默认的NSDefaultRunLoopMode模式，没有超时限制。

注意：这个接口会导致runloop永久性的运行在NSDefaultRunLoopMode模式，即使使用`CFRunLoopStop`也无法停止runloop的运行，即这个子线程无法停止，只能永久运行下去。

<br>

**- (void)runUntilDate:(NSDate *)limitDate**

说明：运行runloop，运行模式为默认的NSDefaultRunLoopMode模式，参数为运行时间期限，超时就退出。

<br>

**- (BOOL)runMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate**

说明：

<br>


<br>
***
<br>

### 三. 关键点

* 每个线程都有唯一的一个与之对应的runloop

* 主线程中的runloop是默认启动的

* 非主线程在刚创建时并没有runloop，如果你不主动获取，就一直都不会有。

* 主线程的runloop可以全局获取，其获取方式为：`[NSRunLoop mainRunLoop]`或`CFRunLoopGetMain()`；非主线程的runloop，只能在该线程内获取，其获取方式为：`[NSRunLoop currentRunLoop]`或`CFRunLoopGetCurrent()`。

* 主线程的runloop在app结束时被销毁，非主线程的runloop在该线程结束时被销毁。

* 在非主线程中创建的timer，想要其生效，必须满足三个条件：
	* 将timer添加到该线程的runloop
	* 保证该线程的runloop已启动
	* runloop当前的runloopmode要与添加timer时指定的mode一致