//
//  ViewController.m
//  BannerDemo
//
//  Created by Suramire on 2020/5/27.
//  Copyright © 2020 Suramire. All rights reserved.
//

#import "ViewController.h"
#import "BannerX.h"
@interface ViewController () <BannerDeleagate>

@property (weak, nonatomic) IBOutlet BannerX *banner;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = [NSArray arrayWithObjects:@"img_01",@"img_02", @"img_03", @"img_04", @"img_05", nil];
    [self.banner bannerArraywithString: array];
    self.banner.delegate = self;

    
    
}

- (void)bannerDidSelectedatIndex:(NSInteger)index{
    NSLog(@"banner点击位置 %d",index);
}

@end
