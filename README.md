# ios-docs-cn

### 一. 语言

* [Objective-C](./objc/readme.md)
* [Swift](./swift/readme.md)


<br>
***
<br>


### 二. 系统框架

* Cocoa Touch Layer
	* [AddressBookUI](./framework/AddressBookUI)
	* [EventKitUI](./framework/EventKitUI)
	* [GameKit](./framework/GameKit)
	* [iAd](./framework/iAd)
	* [MapKit](./framework/MapKit)
	* [MessageUI](./framework/MessageUI)
	* [UIKit](./framework/UIKit)
	* NotificationCenter
	* PhotosUI
	* WatchKit
* 多媒体层
	* [AssetsLibrary](./framework/AssetsLibrary)
	* [AVFoundation](./framework/AVFoundation)
	* [AudioToolbox](./framework/AudioToolbox)
	* [AudioUnit](./framework/AudioUnit)
	* [CoreAudio](./framework/CoreAudio)
	* [CoreGraphics](./framework/CoreGraphics)
	* [CoreText](./framework/CoreText)
	* [CoreVideo](./framework/CoreVideo)
	* [ImageIO](./framework/ImageIO)
	* [MediaPlayer](./framework/MediaPlayer)
	* [OpenAL](./framework/OpenAL)
	* [OpenGLES](./framework/OpenGLES)
	* [QuartzCore](./framework/QuartzCore)
* Core Services Layer
	* [AddressBook](./framework/AddressBook)
	* [CFNetwork](./framework/CFNetwork)
	* [CoreData](./framework/CoreData)
	* [CoreFoundation](./framework/CoreFoundation)
	* [CoreLocation](./framework/CoreLocation)
	* [CoreMedia](./framework/CoreMedia)
	* [CoreTelephony](./framework/CoreTelephony)
	* [EventKit](./framework/EventKit)
	* [Foundation](./framework/Foundation)
	* [MobileCoreServices](./framework/MobileCoreServices)
	* [QuickLook](./framework/QuickLook)
	* [StoreKit](./framework/StoreKit)
	* [SystemConfiguration](./framework/SystemConfiguration)
	* [WebKit](./framework/WebKit)
	* [CloudKit](./framework/CloudKit)
	* [CoreMotion](./framework/CoreMotion)
	* [JavascriptCore](./framework/JavaScriptCore)
	* ACAccounts
	* AdSupport
	* HealthKit
	* HomeKit
	* MultipeerConnectivity
	* NewsstandKit
	* PassKit
	* PushKit
	* Social
	* UIAutomation
* Core OS Layer
	* [Accelerate](./framework/Accelerate)
	* [ExternalAccessory](./framework/ExternalAccessory)
	* [Security](./framework/Security)
	* [System](./framework/System)
	* CoreBluetooth
	* LocalAuthentication


<br>
***
<br>


### 三. 优质第三方框架/库

* 响应式编程
	* [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)
		* [ReactiveCocoa入门教程：第一部分](http://www.cocoachina.com/industry/20140707/9053.html)
		* [Reactive Cocoa 3.0在MVVM中的应用](http://ios.jobbole.com/82232/)
		* [快速让你上手ReactiveCocoa之基础篇](http://www.jianshu.com/p/87ef6720a096)
	* [RxSwift](https://github.com/ReactiveX/RxSwift) -- 基于Swift

* 网络相关
	* [AFNetworking](https://github.com/AFNetworking/AFNetworking) -- 网络连接库
	* [Alamofire](https://github.com/Alamofire/Alamofire) -- Swift版的网络连接库
	* [socket.io-client-swift](https://github.com/socketio/socket.io-client-swift) -- WebSockect客户端类库，支持Objective-C & Swift，要求iOS8+
	* [starscream](https://github.com/daltoniam/starscream) -- Swift版的WebSocket库
	* [CocoaAsyncSocket](https://github.com/robbiehanson/CocoaAsyncSocket) -- 异步socket网络库

* Model
	* [JSONModel](https://github.com/icanzilb/JSONModel) -- 将JSON模型化为OC对象
	* [Mantle](https://github.com/Mantle/Mantle) -- 将JSON模型化为OC对象，适合大系统使用
	* [MJExtension](https://github.com/CoderMJLee/MJExtension) -- 使用简单的字典转模型框架
	* [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) -- 使Swift的JSON解析变得简单
	* [YYModel](https://github.com/ibireme/YYModel) -- 高性能的model框架

* 数据库
	* [FMDB](https://github.com/ccgus/fmdb) -- 对SQLite的Objective-C封装
	* [SQLite.swift](https://github.com/stephencelis/SQLite.swift) -- 纯swift实现的类型安全的SQLite3封装
	* [Realm](https://github.com/realm/realm-cocoa) -- 专为移动设备打造的数据库，使用简单、支持Objective-C和Swift、跨平台，其宣称在移动设备上的性能表现要好于Sqlite
		* [官方中文介绍](https://realm.io/cn/)
	* [MagicalRecord](https://github.com/magicalpanda/MagicalRecord) -- 号称CoreData第一库，用于简化CoreData的使用。
		* [深入浅出MagicalRecord](http://childhood.logdown.com/posts/208957/easy-magicalrecord-01)

* 缓存相关
	* 图像
		* [SDWebImage](https://github.com/rs/SDWebImage) -- 获取并缓存网络图片
		* [FastImageCache](https://github.com/path/FastImageCache) -- 高效、持久、快速的来存储和检索应用中的图像
		* [YYWebImage](https://github.com/ibireme/YYWebImage) -- 异步加载图片的库，支持APNG、WebP、GIF格式，支持支持渐进式图片加载
		* [Kingfisher](https://github.com/onevcat/Kingfisher) -- 获取并缓存网络图片，基于Swift
	* 通用
		* [EGOCache](https://github.com/enormego/EGOCache) -- 简单、线程安全的key/value缓存库，可缓存NSString、UIImage、NSImage、NSData及任何实现了`NSCoding`协议的对象
		* [HanekeSwift](https://github.com/Haneke/HanekeSwift) -- 一个基于Swift的轻量级通用缓存库

* 消息通信
	* [KVOController](https://github.com/facebook/KVOController) -- 简单、线程安全的KVO
	* [MMWormhole](https://github.com/mutualmobile/MMWormhole) -- 用于实现宿主应用和扩展之间的通信（基于`app groups`实现）

* IM
	* [XMPPFramework](https://github.com/robbiehanson/XMPPFramework) -- 基于XMPP协议的IM框架
	* [JSQMessagesViewController](https://github.com/jessesquires/JSQMessagesViewController) -- 一个优雅地聊天UI库
	* [ChatSecure-iOS](https://github.com/ChatSecure/ChatSecure-iOS) -- 一个开源的即时通讯客户端（适合学习源码）
	* [MessageDisplayKit](https://github.com/xhzengAIB/MessageDisplayKit) -- 一个类似微信的IM应用

* Keychain
	* [SSKeychain](https://github.com/soffes/sskeychain) -- 它对系统Keychain进行了简单包装，用于访问账户，获取、设置、删除密码。
	* [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess) -- 它对系统Keychain进行简单包装，基于Swift。

* Crash Reporter
	* [KSCrash](https://github.com/kstenerud/KSCrash)

* 图表
	* [PNChart](https://github.com/kevinzhow/PNChart) -- 图表库

* 自动布局
	* [Masonry](https://github.com/Masonry/Masonry)

* 上拉下拉刷新
	* [MJRefresh](https://github.com/CoderMJLee/MJRefresh)

* UITabBarController相关
	* [CYLTabBarController](https://github.com/ChenYilong/CYLTabBarController) -- 从README来看，使用方便，功能强大

* UIViewController相关
	* [VCTransitionsLibrary](https://github.com/ColinEberhardt/VCTransitionsLibrary)  -- 视图控制器转场动画库
	* [UIScrollSlidingPages](https://github.com/TomThorpe/UIScrollSlidingPages) -- 页面级的tab切换
	* [DLSlideView](https://github.com/agdsdl/DLSlideView) -- 基于ViewController的container特性（而不是scrollview）来管理各个子页面，以支持无限分页
	* [WMPageController](https://github.com/wangmchn/WMPageController) -- 页面级的tab切换
	* [RKSwipeBetweenViewControllers](https://github.com/cwRichardKim/RKSwipeBetweenViewControllers) -- UIPageViewController和自定义UISegmentedControl的同步动画
	* [BubbleTransition](https://github.com/andreamazz/BubbleTransition) -- 以气泡膨胀和缩小的动画效果来显示和移除controller

* UITableView相关
	* [UITableView+FDTemplateLayoutCell](https://github.com/forkingdog/UITableView-FDTemplateLayoutCell) -- 自动计算UITableViewCell的高度并优化UITableView滚动
	* [MGSwipeTableCell](https://github.com/MortimerGoro/MGSwipeTableCell) -- 让UITableViewCell支持侧滑菜单
	* [XLForm](https://github.com/xmartlabs/XLForm) -- 表单库
	* [Form](https://github.com/hyperoslo/Form) -- 基于JSON构建表单
	* [RETableViewManager](https://github.com/romaonthego/RETableViewManager) -- 它可以十分方便地生成各种样式、各种功能的TableView
	* [UUChatTableView](https://github.com/ZhipingYang/UUChatTableView) -- 支持文本、图片以及音频的气泡聊天界面
	* [DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet) -- 专门用于处理UITableView或UICollectionView为空的情况
	* [FDStackView](https://github.com/forkingdog/FDStackView) -- 让iOS9之前的版本（最低支持iOS6）也支持UIStackView
	* [TZStackView](https://github.com/tomvanzummeren/TZStackView) -- 让iOS9之前的版本（最低支持iOS6）也支持UIStackView，基于Swift

* 进度指示器
	* [MBProgressHUD](https://github.com/jdg/MBProgressHUD) -- loading提示
	* [SVProgressHUD](https://github.com/samvermette/SVProgressHUD) -- 轻量级的loading提示
	* [NVActivityIndicatorView](https://github.com/ninjaprox/NVActivityIndicatorView) -- 提供了29种loading动画效果

* 弹出框
	* [MMPopupView](https://github.com/adad184/MMPopupView) -- 
	* [PSTAlertController](https://github.com/steipete/PSTAlertController) -- 可以兼容iOS7的UIAlertViewController
	* [STPopup](https://github.com/kevin0571/STPopup) -- 支持内容导航的弹框

* 菜单
	* [AwesomeMenu](https://github.com/levey/AwesomeMenu) -- 仿Path 2.0菜单
	* [DCPathButton](https://github.com/Tangdixi/DCPathButton) -- 仿Path 4.0菜单
	* [KYGooeyMenu](https://github.com/KittenYang/KYGooeyMenu) -- 带粘性的扇形菜单，动画效果很赞
	* [LiquidFloatingActionButton](https://github.com/yoavlt/LiquidFloatingActionButton) -- 带粘性的线性菜单，动画效果与KYGooeyMenu类似
	* [BTNavigationDropdownMenu](https://github.com/PhamBaTho/BTNavigationDropdownMenu) -- 导航条上的下拉菜单，iOS8+，Swift

* 日历
	* [FSCalendar](https://github.com/WenchaoD/FSCalendar) -- 
	* [CVCalendar](https://github.com/Mozharovsky/CVCalendar) -- 基于Swift 2.0，支持iOS8+
	* [JTCalendar](https://github.com/jonathantribouharet/JTCalendar) -- 
	* [PDTSimpleCalendar](https://github.com/jivesoftware/PDTSimpleCalendar) -- 传说是最棒的日历组件

* 图像浏览
	* [ImagePickerSheetController](https://github.com/larcus94/ImagePickerSheetController) -- action sheet风格的图片选择，基于Swift，支持iOS8+
	* [MWPhotoBrowser](https://github.com/mwaterfall/MWPhotoBrowser) -- 一个基于网格视图的照片和视频选择器

* 图像处理
	* [GPUImage](https://github.com/BradLarson/GPUImage) -- 它是一个基于GPU的图像和视频处理框架，提供各种各样的图像处理滤镜，并且支持照相机和摄像机的实时滤镜，还支持自定义滤镜。[Swift版本](https://github.com/BradLarson/GPUImage2)
		* [GPUImage简单滤镜使用（一）](http://www.cnblogs.com/salam/p/4980992.html)
		* [GPUImage简单滤镜使用（二）](http://www.cnblogs.com/salam/p/4981276.html)

* badge
	* [RKNotificationHub](https://github.com/cwRichardKim/RKNotificationHub) -- 快速给任何UIView添加badge
	* [WZLBadge](https://github.com/weng1250/WZLBadge) -- 支持红点、数字、new三种风格的badge

* 主题管理
	* [DKNightVersion](https://github.com/Draveness/DKNightVersion) -- 支持应用主题切换

* 步进引导
	* [Instructions](https://github.com/ephread/Instructions) -- 基于Swift，支持iOS8+

* 控件
	* [BEMCheckBox](https://github.com/Boris-Em/BEMCheckBox) -- 支持多种不同风格动画效果的复选框
	* [DGRunkeeperSwitch](https://github.com/gontovnik/DGRunkeeperSwitch) -- 带动画效果的segment control，基于Swift

* 圆角
	* [HYBImageCliped](https://github.com/CoderJackyHuang/HYBImageCliped)

* 动画
	* [JazzHands](https://github.com/IFTTT/JazzHands) -- 基于关键帧的动画框架
	* [awesome-ios-animation](https://github.com/sxyx2008/awesome-ios-animation) -- 各种动画库的集合

* 其他
	* [AsyncDisplayKit](https://github.com/facebook/AsyncDisplayKit) -- facebook出品的一个基于Swift的框架，用于确保用户界面的流畅与快速，即使是很复杂的用户界面。
	* [BeeFramework](https://github.com/gavinkwoe/BeeFramework) -- 一个半混合框架，允许你使用Objective-C和XML/CSS来创建移动应用。


<br>
***
<br>


### 四. 优质技术资料

* [iOS技术概览中文版](./resource/iOS技术概览.pdf)
* [iOS Provisioning Profile(Certificate)与Code Signing详解](http://blog.csdn.net/phunxm/article/details/42685597)
* [漫谈iOS程序的证书和签名机制](http://www.pchou.info/ios/2015/12/14/ios-certification-and-code-sign.html)
* [Cocoa编码规范](http://www.cocoachina.com/ios/20150908/13335.html)
* [如何使用TestFlight进行Beta测试](http://www.cocoachina.com/ios/20141022/10009.html)
* [细说 iOS 消息推送](http://www.cocoachina.com/industry/20140528/8582.html)
* [iOS如何创建推送证书](http://jingyan.baidu.com/article/7082dc1c6bb86de40a89bd1a.html)
* [Quartz 2D的坐标系和UIKit的坐标系对比以及相互转换](https://www.ganlvji.com/quartz_2d_coordinate_uikit/)
* [IOS Xcode开发中的文件后缀名区别m,mm,cpp,h](http://www.xuebuyuan.com/2106036.html)


<br>
***
<br>


### 五. 好工具

* [appetize.io](https://appetize.io/) -- 一个为iOS和Android提供APP在线演示的网站，只要将你的demo程序上传到appetize.io，就可以直接在网页上运行你的demo。
* [Cocoa Controls](https://www.cocoacontrols.com/) -- 你可以在这里找到大量针对iOS和Mac OS X开发的GUI控件，并且大部分资源是免费使用的。


<br>
***
<br>


### 六. 其他优质资源

* [apistore](http://apistore.baidu.com/astore/index) -- 各种开放API的聚集地
