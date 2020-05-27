# BannerX
iOS 封装常用banner组件
## 简介
banner界面采用xib布局，目前仅支持使用图片名作为参数
支持纯代码与stroyBoard调用
## 使用
导入3个BannerX文件


```objective-c
//纯代码
    BannerX *banner = [BannerX new];
    banner.frame = CGRectMake(0, 0, self.view.frame.size.width, 0);
    [self.view addSubview:banner];
    NSArray *array = [NSArray arrayWithObjects:@"img_1", @"img_2", nil];
    [banner bannerArray: array];
```

