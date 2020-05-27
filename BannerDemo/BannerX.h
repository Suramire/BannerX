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
- (void)bannerArray:(NSArray *)array;
@end



NS_ASSUME_NONNULL_END
