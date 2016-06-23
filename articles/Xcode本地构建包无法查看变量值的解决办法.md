# Xcode本地构建包无法查看变量值的解决办法

解决办法：在Project对应Target的`Build Settings`中，把`Optimization Level`设置成`None`即可。