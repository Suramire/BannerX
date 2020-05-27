//
//  ViewController.m
//  BannerDemo
//
//  Created by Suramire on 2020/5/27.
//  Copyright © 2020 Suramire. All rights reserved.
//

#import "ViewController.h"
#import "BannerX.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //采用代码加载方式
    BannerX *banner = [BannerX new];
    banner.frame = CGRectMake(0, 0, self.view.frame.size.width, 0);
    [self.view addSubview:banner];
    NSArray *array = [NSArray arrayWithObjects:@"a", @"b", nil];
    [banner bannerArraywithString: array];
}


@end
