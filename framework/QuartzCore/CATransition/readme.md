# CATransition

### 注意

* CATransition并不作用于指定的图层属性，这就是说你可以在不能准确得知改变了什么的情况下对图层做动画，例如：在不知道UITableView哪一行被添加或者删除的情况下，直接就可以平滑地刷新它；在不知道UIViewController内部视图层级的情况下，对两个不同的实例做过渡动画。