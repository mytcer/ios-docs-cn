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