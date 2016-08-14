# WKWebView

### 简介

用于替代`UIWebView`，从iOS8开始可用。


<br>
***
<br>


### API

**- initWithFrame:configuration:**

说明：初始化方法

<br>

**configuration**

说明：属性，只读，它是调用初始化方法时传入的配置。

<br>

**scrollView**

说明：属性，只读，与webview关联的scrollView

<br>

**title**

说明：属性，只读，页面标题

<br>

**URL**

说明：属性，只读，当前加载的页面url

<br>

**customUserAgent**

说明：属性，自定义UA

<br>

**navigationDelegate**

说明：属性，webview的导航代理。

<br>

**UIDelegate**

说明：属性，webview的UI代理。

<br>

**estimatedProgress**

说明：属性，只读，估计的页面加载进度，值为0.0 ~ 1.0，支持KVO。

<br>

**hasOnlySecureContent**

说明：属性，只读，布尔值，表示页面上的资源是否通过安全的加密协议加载。

<br>

**- loadHTMLString:baseURL:**

说明：设置网页内容和基准url（注：基准url用于解析网页中的相对url）

<br>

**loading**

说明：属性，只读，布尔值，表示webview是否正在加载内容。

<br>

**- reload**

说明：重载当前页面

<br>

**- reloadFromOrigin**

说明：重载当前页面，如果可能的话，使用缓存验证条件进行端到端的验证。

<br>

**- stopLoading**

说明：停止当前页面的所有资源加载

<br>

**- loadData:MIMEType:characterEncodingName:baseURL:**

说明：设置网页内容和基准url

<br>

**- loadFileURL:allowingReadAccessToURL:**

说明：在文件系统上导航到目标url

<br>

**allowsMagnification**

说明：属性，布尔值，表示是否允许通过放大手势来缩放网页，默认值为NO。

<br>

**magnification**

说明：属性，表示当前页面的缩放值，默认为1.0。

<br>

**- setMagnification:centeredAtPoint:**

说明：按照指定的值来缩放页面，并让缩放后的页面在指定的点居中。

<br>

**allowsBackForwardNavigationGestures**

说明：属性，布尔值，表示是否允许水平侧滑返回，默认值为NO。

<br>

**backForwardList**

说明：属性，只读，表示webview的返回列表。

<br>

**canGoBack**

说明：属性，只读，布尔值，表示是否可以返回到前一个web页面（即`backForwardList`中的前一项）。

<br>

**canGoForward**

说明：属性，只读，布尔值，表示是否可以前进到下一页。

<br>

**allowsLinkPreview**

说明：属性，布尔值，表示是否允许按住链接时显示其内容预览。

<br>

**- goBack**

说明：返回前一页

<br>

**- goForward**

说明：前往下一页

<br>

**- goToBackForwardListItem:**

说明：返回到指定页面（该页面已存在于`backForwardList`）

<br>

**- loadRequest:**

说明：导航到一个URL

<br>

**- evaluateJavaScript:completionHandler:**

说明：执行一段JS字符串