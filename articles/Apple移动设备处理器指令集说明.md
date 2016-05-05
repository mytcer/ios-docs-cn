# Apple移动设备处理器指令集

### 一. 指令集及其对应的设备

* **armv6**
	* iPhone
	* iPhone2
	* iPhone3G
	* 第一代和第二代iPod Touch

* **armv7**
	* iPhone4
	* iPhone4S

* **armv7s**
	* iPhone5
	* iPhone5C

* **arm64**
	* iPhone5S
	* iPhone6
	* iPhone6+


<br>
***
<br>


### 二. XCode中与指令集相关的选项（Build Settings 面板下 Architectures）

* **Architectures**

作用：指明选定Target要求被编译生成的二进制包所支持的指令集

说明：支持指令集是通过编译生成对应的二进制数据包实现的，如果支持的指令集数目有多个，就会编译出包含多个指令集代码的数据包，从而会造成最终编译生成的包很大。


<br>


* **Valid Architectures**

作用：限制被支持的指令集的范围，即`Valid Architectures`和`Architectures`列表的交集，才是XCode最终生成二进制包所支持的指令集。

例子：如将`Architectures`支持指令集设置为：`armv7,armv7s`，对应的`Valid Architectures`的支持的指令集设置为：`armv7s,arm64`，那么XCode生成二进制包所支持的指令集只有`armv7s`。


<br>


* **Build Active Architecture Only**

作用：指明是否只编译当前连接设备所支持的指令集

说明：该选项起作用的条件有两个，必须同时满足才会起作用：

	* 其值设置为YES

	* XCode成功连接调试设备