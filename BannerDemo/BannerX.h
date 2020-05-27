//
//  BannerX.h
//  BannerDemo
//
//  Created by Suramire on 2020/5/27.
//  Copyright © 2020 Suramire. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BannerX : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (copy, nonatomic) NSArray *imgArray;
- (void)bannerArraywithString:(NSArray *)array;//以图片文件名的方式加载
@end



NS_ASSUME_NONNULL_END
