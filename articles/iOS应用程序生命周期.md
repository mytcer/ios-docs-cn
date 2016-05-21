# iOS应用程序生命周期

### 应用程序的状态

* **Not running**

	说明：未运行，应用没启动。

* **Inactive**

	说明：未激活，应用在前台运行，不过没有接收到事件，在没有事件处理的情况下，应用通常停留在这个状态。

* **Active** 

	说明：激活，应用在前台运行而且接收到了事件。

* **Backgroud**

	说明：后台，应用在后台而且能执行代码，大多数应用进入这个状态后会在在这个状态上停留一会，时间到之后会进入挂起状态(Suspended)，有的应用经过特殊的请求后可以长期处于Backgroud状态。

* **Suspended**

	说明：挂起，应用在后台不能执行代码，系统会自动把应用变成这个状态而且不会发出通知。当挂起时，应用还是停留在内存中的，当系统内存低时，系统就把挂起的应用清除掉，为前台应用提供更多的内存。


<br>
***
<br>


### 应用生命周期及对应的方法

**启动应用**

1. 应用启动但还没进入状态保存

	- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions

2. 应用启动完成准备开始运行

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions

3. 应用进入激活状态

	- (void)applicationDidBecomeActive:(UIApplication *)application


**按下home键**

1. 应用进入非激活状态

	- (void)applicationWillResignActive:(UIApplication *)application

2. 应用进入后台

	- (void)applicationDidEnterBackground:(UIApplication *)application


**双击home键，再打开应用**

1. 应用将要从后台回到前台

	- (void)applicationWillEnterForeground:(UIApplication *)application

2. 应用进入激活状态

	- (void)applicationDidBecomeActive:(UIApplication *)application


**应用被终止（系统强制应用退出或用户手工关闭应用）

	- (void)applicationWillTerminate:(UIApplication *)application


<br>
***
<br>


### 注意

* 当应用进入后台后，大概有`5秒的时间来让应用完成一些任务（如保存用户状态等）。如果超过时间还有未完成的任务，你的程序就会被终止而且从内存中清除。如果有需要长时间的运行任务，可以调用`beginBackgroundTaskWithExpirationHandler`方法去请求后台运行时间和启动线程来运行耗时长的任务。

* 应用进入后台后，当系统内存不足时，会终止一些挂起的程序来回收内存，那些内存最大的程序首先被终止。

* 如果Info.plist文件中包含了`UIApplicationExitsOnSuspend`键，那么当应用进入挂起状态后，会被系统终止。


<br>
***
<br>


### 参考资源

* [iOS应用程序生命周期详解](http://blog.csdn.net/totogo2010/article/details/8048652)