# OnceLoadingView


## 安装
#### CocoaPods
在 Podfile 中添加 pod 'OnceLoadingView'。
执行 pod install 或 pod update。
导入 <OnceLoadingView.h>。

## 手动安装
1.下载 OnceLoadingView 文件夹内的所有内容。

2.将 OnceLoadingView 内的OnceLoadingView.h/.m源文件添加(拖放)到你的工程。

##使用
####模拟加载
```
[OnceLoadingView showNoNetwork:self.view];
```

####拟加载失败，重新加载回调
```
[OnceLoadingView showLoadingFailed:self.view event:^(UIButton *sender) {
	[OnceLoadingView showLoading:self.view];
}];
//数据加载完成后消失
[self performSelector:@selector(dis) withObject:self afterDelay:4];
```
```
-(void)dis{
    需要执行的操作
}
```

####模拟数据没找得到
```
[OnceLoadingView showNullWithinView:self.view];
```

####模拟无网络
```
[OnceLoadingView showNoNetwork:self.view];
```

## 系统要求
该项目最低支持 iOS 8.0 和 Xcode 8.0。

## 许可证
OnceKit 使用 MIT 许可证，详情见 LICENSE 文件。