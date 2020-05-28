//
//  BannerX.h
//  BannerDemo
//
//  Created by Suramire on 2020/5/27.
//  Copyright © 2020 Suramire. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BannerDeleagate <NSObject>

@optional

- (void)bannerDidSelectedatIndex:(NSInteger) index;

@end

@interface BannerX : UIView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) id<BannerDeleagate> delegate;
@property (copy, nonatomic) NSArray *imgArray;
- (void)bannerArraywithString:(NSArray *)array;//以图片文件名的方式加载
@end



NS_ASSUME_NONNULL_END
