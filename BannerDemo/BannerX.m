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


- (void)bannerArraywithString:(NSArray *)array{
    self.imgArray = array;
    [self setupScrollView];
}

- (void)initView{
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"BannerX" owner:self options:nil] firstObject];
//    [self setupScrollView];
    [self addSubview:view];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        NSLog(@"initWithCoder");
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"initWithFrame");
        [self initView];
    }
    return self;
}






- (void)setupScrollView{
    self.imageSize = self.scrollView.frame.size;
    NSInteger count = [self.imgArray count];
    for (int i = 0; i< count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.imgArray objectAtIndex:i]]];
        imageView.tag = i;
        imageView.frame = CGRectMake(width * i, 0, width, height);
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)]];
//        UILabel *label = [UILabel new];
//        label.frame = CGRectMake(width * i, height - 40, width, 40);
//        label.text = @"文字";
        [self.scrollView addSubview:imageView];
//        [self.scrollView addSubview:label];
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

- (void)imageClick:(UITapGestureRecognizer *)sender {
    if([self.delegate respondsToSelector:@selector(bannerDidSelectedatIndex:)]){
        [self.delegate bannerDidSelectedatIndex:sender.view.tag];
    }
}


- (void)setupTimer{
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
    //手动滑动时停止
    [self removeTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //停止手动滑动后开始定时播放
    [self setupTimer];
}

@end
