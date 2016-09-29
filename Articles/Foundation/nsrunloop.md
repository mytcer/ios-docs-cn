# NSRunLoop详解

### 简介

一个runloop就是一个事件处理循环，用来不停处理输入事件，它能处理的事件有两种：输入源和定时源，输入源包括三种：performSelector源、基于端口（Mach port）的源、以及自定义的源，他们都是用来处理异步事件的；定时源即NSTimer，一般情况下是用来处理同步事件的。


<br>
***
<br>


### runloop mode

一个runloop mode是一个集合，其中包含其监听的输入事件、定时器事件、以及在事件发生时需要通知的runloop observers。每个runloop可运行在不同的模式下，运行在一种模式下的runloop，只会处理该模式包含的输入事件、定时器事件、以及通知该模式包含的observers。

Cocoa中的预定义模式有:

* `NSDefaultRunLoopMode`

	* 说明：默认模式，它几乎包含了所有输入源（NSConnection除外）。

* `NSConnectionReplyMode`

	* 说明：该模式处理`NSConnection`对象相关事件，表明`NSConnection`对象等待reply，系统内部使用。

* `NSModalPanelRunLoopMode`

	* 说明：用于处理modal panels事件，当需要等待处理的输入源为modal panel时设置该模式，比如`NSSavePanel`和`NSOpenPanel`。

* `NSEventTrackingRunLoopMode`

	* 说明：该模式用于处理用户界面相关的事件，在此模式下会限制输入事件的处理。

	* 例子：当手指按住UITableView拖动时就会处于此模式

* `NSRunLoopCommonModes`

	* 说明：这不是一个特定的模式，而是一个模式集合，其默认包含`NSDefaultRunLoopMode`、`NSModalPanelRunLoopMode`、`NSEventTrackingRunLoopMode`。将输入源加入此模式，意味着在该模式集合中包含的所有模式下，都可以处理输入源。

	* 注意：可使用`CFRunLoopAddCommonMode`方法向该模式中添加自定义模式


<br>
***
<br>


### 注意

* 每个线程都有一个与之对应的runloop

* 主线程中的runloop是默认启动的，其它线程在刚创建时并没有runloop，如果你不主动获取，就一直都不会有。

* 主线程的runloop可以全局获取，其获取方式为：`[NSRunLoop mainRunLoop]`或`CFRunLoopGetMain()`；其他线程的runloop，只能在该线程内获取，其获取方式为：`[NSRunLoop currentRunLoop]`或`CFRunLoopGetCurrent()`。

* 主线程的runloop在app结束时被销毁，其他线程的runloop在该线程结束时被销毁。

* 在其它线程中创建的timer，想要其生效，必须满足三个条件：
	* 将timer添加到该线程的runloop
	* 保证该线程的runloop已启动
	* runloop当前的runloopmode要与添加timer时指定的mode一致

* 创建`NSTimer`添加到runloop中的时候，`NSTimer`默认是处于`NSDefaultRunloopMode`。


<br>
***
<br>


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

说明：如果没有输入源或定时器附加到该runloop，该方法会立即退出；否则，它会在`NSDefaultRunLoopMode`模式下反复调用`runMode:beforeDate:`，由于没有指定过期时间，所以该方法会开始一个无限循环。

注意：

* 从runloop中手动移除所有已知的输入源和定时器，不能保证该runloop会退出。
* 如果你想要runloop终止，就不应该使用该方法。

<br>


**- (void)runUntilDate:(NSDate *)limitDate**

说明：运行runloop直到超时，在此期间它处理来自所有附加输入源的数据。

注意：

* 如果没有输入源或定时器附加到runloop，该方法会立即退出；否则，它会在`NSDefaultRunLoopMode`模式下反复调用`runMode:beforeDate:`方法，直到超出指定的过期时间。
* 从runloop中手动移除所有已知的输入源和定时器，不能保证该runloop会退出。

<br>


**- (BOOL)runMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate**

说明：在指定模式下运行一次runloop，并等待事件输入，直到超时。

注意：

* 如果没有输入源，或定时器被附加到该runloop，则该方法立即退出并返回NO；否则，该方法会在处理完第一个输入源，或超时后返回YES。
* 从runloop中手动移除所有已知的输入源和定时器，不能保证该runloop立即退出。
* 一个定时器不会被认为是一个输入源，而且在等待该方法退出的过程中，定时器可能会触发多次。

<br>


**- (void)acceptInputForMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate**

说明：运行一次runloop，直到超时，仅接受指定模式下的输入。

注意：

* 如果没有输入源或定时器被附加到runloop，该方法立即退出；否则，它会运行一次runloop，一旦处理了一个输入源消息或超出指定的过期时间时，该方法就会返回。
* 一个定时器不会被认为是一个输入源，而且在等待该方法退出的过程中，定时器可能会触发多次。
* 从runloop中手动移除所有已知的输入源和定时器，不能保证该runloop会退出。

<br>


**- (void)performSelector:(SEL)aSelector target:(id)target argument:(id)arg order:(NSUInteger)order modes:(NSArray<NSRunLoopMode> *)modes**

说明：该方法设置了一个定时器，并在下一次runloop循环开始时，执行`aSelector`消息。

注意：

* 定时器被配置为在`modes`指定的模式运行
* 当定时器触发时，对应的线程会尝试从runloop中出列消息并执行`aSelector`。
* 如果runloop运行在指定的模式之一，则表示消息执行成功；否则，定时器会一直等到runloop运行在指定的模式之一为止。
* 该方法会在`aSelector`消息发送前返回
* runloop会持有`target`和`arg`对象，直到定时器触发，然后释放它们。
* 如果你想在当前事件被处理后发送多个消息，且需要确保这些消息按照一个特定的顺序发送时，可以使用该方法。

<br>


**- (void)cancelPerformSelector:(SEL)aSelector target:(id)target argument:(id)arg**

说明：取消先前通过`performSelector:target:argument:order:modes:`发送的消息

注意：该方法从runloop的所有模式中移除指定的执行请求

<br>


**- (void)cancelPerformSelectorsWithTarget:(id)target**

说明：取消与`target`对象相关联的消息

注意：该方法从runloop的所有模式中移除指定的执行请求

<br>


**mainRunLoop**

说明：只读属性，返回主线程的runloop。
