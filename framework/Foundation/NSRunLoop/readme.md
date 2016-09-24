# NSRunLoop

### 简介

一个runloop就是一个事件处理循环，用来不停的监听和处理输入事件，它能处理的事件有两种：输入源和定时源，输入源包括三种：performSelector源、基于端口（Mach port）的源、以及自定义的源，他们都是用来处理异步事件的；定时源即NSTimer，一般情况下是用来处理同步事件的。


***
<br>
***


### runloop mode

一个runloop mode是一个集合，其中包含其监听的输入事件、定时器事件、以及在事件发生时需要通知的runloop observers。每个runloop可运行在不同的mode下，运行在一种mode下的runloop，只会处理该mode包含的输入事件、定时器事件、以及通知该mode包含的observers。

Cocoa中的预定义模式有:

* `NSDefaultRunLoopMode`

	* 说明：默认模式，它几乎包含了所有输入源（NSConnection除外）。

* `NSConnectionReplyMode`

	* 说明：该模式处理`NSConnection`对象相关事件，表明`NSConnection`对象等待reply，系统内部使用，用户基本不会使用。

* `NSModalPanelRunLoopMode`

	* 说明：用于处理modal panels事件，当需要等待处理的input source为modal panel时设置该模式，比如`NSSavePanel`和`NSOpenPanel`。

* `NSEventTrackingRunLoopMode`

	* 说明：该模式用于处理用户界面相关的事件，在此模式下会限制输入事件的处理。

	* 例子：当手指按住UITableView拖动时就会处于此模式

* `NSRunLoopCommonModes`

	* 说明：这不是一个特定的模式，而是一个模式集合，其默认包含`NSDefaultRunLoopMode`、`NSModalPanelRunLoopMode`、`NSEventTrackingRunLoopMode`。将输入源加入此模式，意味着在该模式集合中包含的所有模式下都可以处理。

	* 注意：可使用`CFRunLoopAddCommonMode`方法向该模式中添加自定义模式


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


### 注意

* 每个线程都有一个与之对应的runloop

* 主线程中的runloop是默认启动的

* 其它线程在刚创建时并没有runloop，如果你不主动获取，就一直都不会有。

* 主线程的runloop可以全局获取，其获取方式为：`[NSRunLoop mainRunLoop]`或`CFRunLoopGetMain()`；非主线程的runloop，只能在该线程内获取，其获取方式为：`[NSRunLoop currentRunLoop]`或`CFRunLoopGetCurrent()`。

* 主线程的runloop在app结束时被销毁，非主线程的runloop在该线程结束时被销毁。

* 在其它线程中创建的timer，想要其生效，必须满足三个条件：
	* 将timer添加到该线程的runloop
	* 保证该线程的runloop已启动
	* runloop当前的runloopmode要与添加timer时指定的mode一致

* 创建`NSTimer`添加到runloop中的时候，`NSTimer`默认是处于`NSDefaultRunloopMode`。