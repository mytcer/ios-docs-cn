# NSRunLoop详解

### 什么是RunLoop？

RunLoop是一种让线程能随时处理事件但并不退出（注：一个线程一次只能执行一个任务，任务执行完成后线程就会退出）的机制，它实际上是一个对象，该对象管理了其需要处理的事件和消息，并提供了一个入口函数来执行Event Loop的逻辑，线程执行了这个函数后，就会一直处于该函数内部的"接受消息 => 等待 => 处理"的循环中。iOS提供了两个RunLoop对象：

* CFRunLoopRef：它提供了纯C函数的API，这些API都是线程安全的。
* NSRunLoop：它是基于CFRunLoopRef的封装，提供了面向对象的API，这些API不是线程安全的。

RunLoop能处理的事件有两种：输入源和定时源，输入源包括三种：performSelector源、基于端口（Mach port）的源、以及自定义的源，他们都是用来处理异步事件的；定时源即NSTimer，一般情况下是用来处理同步事件的。


<br>
***
<br>


### RunLoop模式

每个模式包含若干个模式项目（Source/Timer/Observer），一个模式项目可以被同时加入多个模式，但一个模式项目被重复加入同一个模式是无效的。

每次调用RunLoop的主函数时，只能指定其中一个模式，如果需要切换模式，只能退出RunLoop，然后再重新指定一个模式进入。这样做主要是为了分隔开不同组的模式项目，让其互不影响。

Cocoa中的预定义模式有:

* `NSDefaultRunLoopMode`

	* 说明：APP的默认模式，通常主线程是在这个模式下运行，它几乎包含了所有输入源（NSConnection除外）。

* `NSConnectionReplyMode`

	* 说明：该模式处理`NSConnection`对象相关事件，表明`NSConnection`对象等待reply，系统内部使用。

* `NSModalPanelRunLoopMode`

	* 说明：用于处理modal panels事件，当需要等待处理的输入源为modal panel时设置该模式，比如`NSSavePanel`和`NSOpenPanel`。

* `NSEventTrackingRunLoopMode`

	* 说明：界面跟踪模式，用于ScrollView追踪触摸滑动，保证界面滑动时不受其他模式影响。

* `NSRunLoopCommonModes`

	* 说明：这不是一个特定的模式，而是一个模式集合，其默认包含`NSDefaultRunLoopMode`、`NSModalPanelRunLoopMode`、`NSEventTrackingRunLoopMode`。将输入源加入此模式，意味着在该模式集合中包含的所有模式下，都可以处理输入源。

	* 注意：可使用`CFRunLoopAddCommonMode`方法向该模式中添加自定义模式


<br>
***
<br>


### RunLoop与线程的关系

* RunLoop与线程之间是一一对应的，该对应关系保存在一个全局的字典里。
* 主线程在创建时会默认创建一个线程，子线程在创建时并没有RunLoop，如果你不主动获取，那它一直都不会有。
* 主线程的RunLoop在app结束时被销毁，子线程的RunLoop在该线程结束时被销毁。
* 主线程的RunLoop可以全局获取，其获取方式为：`[NSRunLoop mainRunLoop]`或`CFRunLoopGetMain()`；子线程的RunLoop，只能在该线程内获取，其获取方式为：`[NSRunLoop currentRunLoop]`或`CFRunLoopGetCurrent()`。
* 在子线程中创建的timer，想要其生效，必须满足三个条件：
	* 将timer添加到该线程的RunLoop
	* 保证该线程的RunLoop已启动
	* RunLoop当前的RunLoopmode要与添加timer时指定的mode一致
* 创建`NSTimer`添加到RunLoop中的时候，`NSTimer`默认是处于`NSDefaultRunloopMode`。


<br>
***
<br>


### RunLoop与AutoreleasePool

APP启动后，苹果在主线程RunLoop里注册了两个Observer：

* 第一个Observer监视的事件是Entry（即将进入RunLoop），其回调内会调用`_objc_autoreleasePoolPush()`创建自动释放池。该Observer的优先级最高，保证创建释放池发生在其他所有回调之前。
* 第二个Observer监视了两个事件：BeforeWaiting（准备进入休眠）时调用`_objc_autoreleasePoolPop()`和`_objc_autoreleasePoolPush()`释放旧的池并创建新池；Exit（即将退出RunLoop）时调用`_objc_autoreleasePoolPop()`来释放自动释放池，该Observer的优先级最低，保证其释放池子发生在其他所有回调之后。

在主线程执行的代码，会被对应的RunLoop创建好的AutoreleasePool环绕。


<br>
***
<br>


### RunLoop与NSTimer

一个NSTimer注册到RunLoop后，RunLoop会为其重复的时间点注册好事件，为了节省资源，RunLoop并不会在非常准确的时间点回调这个定时器，如果某个时间点被错过了，那么该时间点的回调会跳过去，不会延后执行。


<br>
***
<br>


### RunLoop与PerformSelecter

当调用`NSObject`的`performSelecter:afterDelay:`后，实际上其内部会创建一个Timer并添加到当前线程的RunLoop中，所以如果当前线程没有RunLoop，则这个方法会失效。

当调用`performSelector:onThread:`时，实际上其会创建一个Timer加到对应的线程去，如果对应线程没有RunLoop，则该方法也会失效。


<br>
***
<br>


### API

**currentMode**

说明：返回当前RunLoop的输入模式，输入模式是在调用`acceptInputForMode:beforeDate:`和`runMode:beforeDate:`时设置的。

注意：仅在当前RunLoop处于运行中时，才会返回输入模式；否则，返回nil。

<br>

**- (NSDate *)limitDateForMode:(NSRunLoopMode)mode**

说明：返回下一次执行的时间，如果指定的mode不存在，则返回nil。

<br>

**- (CFRunLoopRef)getCFRunLoop**

说明：返回RunLoop的CFRunLoop对象

<br>

**- (void)addTimer:(NSTimer *)timer forMode:(NSRunLoopMode)mode**

说明：添加一个定时器到指定的mode

注意：

* 一个定时器可以添加到多个mode
* 添加的timer会被RunLoop持有，可以通过发送`invalidate`消息给timer来从RunLoop中移除timer。

<br>

**- (void)addPort:(NSPort *)aPort forMode:(NSRunLoopMode)mode**

说明：添加aPort到指定的mode

注意：

* 一个port可以添加到多个mode
* 当RunLoop运行在指定的mode时，会派发消息给该port的回调。

<br>

**- (void)removePort:(NSPort *)aPort forMode:(NSRunLoopMode)mode**

说明：从RunLoop的指定mode中移除aPort

注意：如果你将port添加到了多个mode中，那么就得在每个mode都移除一次。

<br>


**- (void)run**

说明：如果没有输入源或定时器附加到该RunLoop，该方法会立即退出；否则，它会在`NSDefaultRunLoopMode`模式下反复调用`runMode:beforeDate:`，由于没有指定过期时间，所以该方法会开始一个无限循环。

注意：

* 从RunLoop中手动移除所有已知的输入源和定时器，不能保证该RunLoop会退出。
* 如果你想要RunLoop终止，就不应该使用该方法。

<br>


**- (void)runUntilDate:(NSDate *)limitDate**

说明：运行RunLoop直到超时，在此期间它处理来自所有附加输入源的数据。

注意：

* 如果没有输入源或定时器附加到RunLoop，该方法会立即退出；否则，它会在`NSDefaultRunLoopMode`模式下反复调用`runMode:beforeDate:`方法，直到超出指定的过期时间。
* 从RunLoop中手动移除所有已知的输入源和定时器，不能保证该RunLoop会退出。

<br>


**- (BOOL)runMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate**

说明：在指定模式下运行一次RunLoop，并等待事件输入，直到超时。

注意：

* 如果没有输入源，或定时器被附加到该RunLoop，则该方法立即退出并返回NO；否则，该方法会在处理完第一个输入源，或超时后返回YES。
* 从RunLoop中手动移除所有已知的输入源和定时器，不能保证该RunLoop立即退出。
* 一个定时器不会被认为是一个输入源，而且在等待该方法退出的过程中，定时器可能会触发多次。

<br>


**- (void)acceptInputForMode:(NSRunLoopMode)mode beforeDate:(NSDate *)limitDate**

说明：运行一次RunLoop，直到超时，仅接受指定模式下的输入。

注意：

* 如果没有输入源或定时器被附加到RunLoop，该方法立即退出；否则，它会运行一次RunLoop，一旦处理了一个输入源消息或超出指定的过期时间时，该方法就会返回。
* 一个定时器不会被认为是一个输入源，而且在等待该方法退出的过程中，定时器可能会触发多次。
* 从RunLoop中手动移除所有已知的输入源和定时器，不能保证该RunLoop会退出。

<br>


**- (void)performSelector:(SEL)aSelector target:(id)target argument:(id)arg order:(NSUInteger)order modes:(NSArray<NSRunLoopMode> *)modes**

说明：该方法设置了一个定时器，并在下一次RunLoop循环开始时，执行`aSelector`消息。

注意：

* 定时器被配置为在`modes`指定的模式运行
* 当定时器触发时，对应的线程会尝试从RunLoop中出列消息并执行`aSelector`。
* 如果RunLoop运行在指定的模式之一，则表示消息执行成功；否则，定时器会一直等到RunLoop运行在指定的模式之一为止。
* 该方法会在`aSelector`消息发送前返回
* RunLoop会持有`target`和`arg`对象，直到定时器触发，然后释放它们。
* 如果你想在当前事件被处理后发送多个消息，且需要确保这些消息按照一个特定的顺序发送时，可以使用该方法。

<br>


**- (void)cancelPerformSelector:(SEL)aSelector target:(id)target argument:(id)arg**

说明：取消先前通过`performSelector:target:argument:order:modes:`发送的消息

注意：该方法从RunLoop的所有模式中移除指定的执行请求

<br>


**- (void)cancelPerformSelectorsWithTarget:(id)target**

说明：取消与`target`对象相关联的消息

注意：该方法从RunLoop的所有模式中移除指定的执行请求

<br>


**mainRunLoop**

说明：只读属性，返回主线程的RunLoop。


<br>
***
<br>


### 参考资料

* [深入理解RunLoop](http://www.cocoachina.com/ios/20150601/11970.html)