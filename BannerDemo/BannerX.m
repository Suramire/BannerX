//
//  BannerX.m
//  BannerDemo
//
//  Created by Suramire on 2020/5/27.
//  Copyright © 2020 Suramire. All rights reserved.
//

#import "BannerX.h"
#define width self.imageSize.width
#define height self.imageSize.height
@interface BannerX ()<UIScrollViewDelegate,UIPageViewControllerDelegate>
@property CGSize imageSize;//单张图片大小，取决于scrollview大小
@property (strong,nonatomic) NSTimer *scrollTimer;
@end

@implementation BannerX



- (void)bannerArray:(NSArray *)array{
    self.imgArray = array;
    [self initView];
}

- (void)initView{
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"BannerX" owner:self options:nil] firstObject];
    [self setupScrollView];
    [self addSubview:view];
}



- (void)setupScrollView{
    self.imageSize = self.scrollView.frame.size;
    NSInteger count = [self.imgArray count];
    for (int i = 0; i< count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"img_0%d",i+1]]];
        imageView.frame = CGRectMake(width * i, 0, width, height);
        [self.scrollView addSubview:imageView];
    }
    //设置scrollview的内容按一整页滚动
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = count;
    self.scrollView.contentSize = CGSizeMake(width * count, 0);
    if(count > 0){
        self.hidden = NO;
        [self setupTimer];
    }else{
        //没有图片时隐藏banner
        self.hidden = YES;
    }
}


- (void)setupTimer{
    NSLog(@"setupTimer");
    if(!self.scrollTimer){
        self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    }
    [[NSRunLoop currentRunLoop] addTimer:self.scrollTimer forMode:NSRunLoopCommonModes];
}

//todo 卸载组件时销毁
- (void)removeTimer{
    [self.scrollTimer invalidate];
    self.scrollTimer = nil;
}
//轮播
- (void)nextImage{
    NSInteger currentPage = [self.pageControl currentPage];
    NSInteger page = 0;
    if(currentPage >= [self.imgArray count] - 1){
        page = 0;
    }else{
        page = currentPage +1;
    }
    [self.scrollView setContentOffset: CGPointMake(width * page, 0) animated:YES ];
}

#pragma mark scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pageControl.currentPage = (int)(scrollView.contentOffset.x/width);
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //手动滑动时停止timer
    [self removeTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self setupTimer];
}

@end
