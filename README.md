# BannerX
iOS 封装常用banner组件
## 简介
banner界面采用xib布局，目前仅支持使用图片名作为参数
支持纯代码与stroyBoard调用
## 使用
导入3个BannerX文件，在storyboard添加一个UIView并设置class为BannerX;

在viewCnotroller中添加代码

```objective-c
	//目前支持图片文件名的方式
	NSArray *array = [NSArray arrayWithObjects:@"img_01", @"img_03", nil];
	[self.banner bannerArraywithString: array];
```

#### delegate

BannerDeleagate

```objective-c
- (void)bannerDidSelectedatIndex:(NSInteger)index{
    NSLog(@"banner点击位置 %d",index);
}
```

### TODO

- [ ] 采用纯代码布局
- [ ] 加载网络图片
- [ ] 图片添加文字或其他信息