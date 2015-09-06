# UIPasteboard

**简介**

该类允许一个应用程序在应用内与另一个应用程序共享数据。与任意地其他应用共享数据，你可以使用系统级的剪贴板；与拥有相同`team ID`的其他应用共享数据，你可以使用应用专用的剪贴板。

一个剪贴板是一个可用于共享数据的具名内存区域，有两个系统剪贴板：普通剪贴板（`UIPasteboardNameGeneral`），可以用它拷贝、粘帖任意类型的数据；查找剪贴板（`UIPasteboardNameFind`），可以用它持有搜索条中最近搜索的字符串值。应用也可以创建剪贴板供自己使用，或由具有相同`team ID`的其他应用使用。

当你写入一个对象到剪贴板时，该对象被存储为一个剪贴板项目，一个剪贴板项目是一个或多个键值对，键是一个标识值的表示类型的字符串。如果一个剪贴板项目有多个表示类型，将使得它更可能用于应用与其他应用共享数据，例如：应用将同一个图像数据以PNG、JPEG、GIF格式写入剪贴板，即使接收数据的应用只能处理GIF格式，也可以从剪贴板获取该数据。

统一类型标识符（UTI）通常用于表示类型，例如：可以使用`kUTTypeJPEG`来表示JPEG类型的数据。应用程序可以自由使用任意字符串来命名表示类型，但对于应用专用的数据类型，推荐使用反向DNS符号来命名表示类型以确保类型的唯一性，例如：`com.myCompany.myApp.myType`。



**注意**

* 一个剪贴板必须使用唯一的名称标识。
* 系统级的剪贴板默认是持久的。
* 可以将一个应用专用的剪贴板标记为持久的。
* 如果写入剪贴板的数据可以表示为一个对象，如：NSString, NSArray, NSDictionary, NSDate, NSNumber, UIImage, NSURL，就使用`setValue:forPasteboardType:`方法。
* 如果写入剪贴板的数据是二进制的，就使用`setData:forPasteboardType:`方法。

<br>

***

<br>

### 参考资源

* [UIPasteboard的应用](http://www.luobbe.com/ios-pasteboard/)