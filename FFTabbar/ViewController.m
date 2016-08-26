//
//  ViewController.m
//  FFTabbar
//
//  Created by ixiazer on 16/8/26.
//  Copyright © 2016年 FF. All rights reserved.
//

#import "ViewController.h"
#import "FFTabbarItem.h"
#import "FFHomeTabbar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -- override super class
- (void)createTabbar {
    NSArray *tabbarItems = @[[[FFTabbarItem alloc] initItemWith:@"首页" normalImageName:@"home" selectedImageName:@"homeSelect"],
                             [[FFTabbarItem alloc] initItemWith:@"分类" normalImageName:@"sortIconNormal" selectedImageName:@"sortIconSelect"],
                             [[FFTabbarItem alloc] initItemWith:@"发现" normalImageName:@"discover" selectedImageName:@"discoverSelect"],
                             [[FFTabbarItem alloc] initItemWith:@"两鲜团" normalImageName:@"groupon" selectedImageName:@"grouponSelect"],
                             [[FFTabbarItem alloc] initItemWith:@"我的两鲜" normalImageName:@"myFresh" selectedImageName:@"myFreshSelect"]];
    
    //    [[FFTabbarItem alloc] initItemWith:@"闪电送" normalImageName:@"flashbuy" selectedImageName:@"flashbuydidselect"],
    
    __weak typeof(self) this = self;
    self.tabBar = [[FFHomeTabbar alloc] initWithBar:49.0 barItems:tabbarItems tabbarItemSelectBlock:^(NSInteger selectedIndex) {
        this.selectedIndex = selectedIndex;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
