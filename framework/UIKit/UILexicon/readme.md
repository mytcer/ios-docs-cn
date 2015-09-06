# UILexicon

**简介**

一个字典包含一个词对数组，用于自定义键盘。可以通过`UIInputViewController`类的`requestSupplementaryLexiconWithCompletion:`方法获取字典，但这个方法只能在自定义键盘的应用扩展中调用。一个字典包含的单词有如下几个来源：

* 来自用户通讯录数据库的未配对的名字和姓氏。
* 设置 》通用 》键盘 》用户字典 中定义的快捷文本。
* 常用单词词典。