//
//  FFTabbar.m
//  FreshFresh
//
//  Created by ixiazer on 16/3/30.
//  Copyright © 2016年 com.freshfresh. All rights reserved.
//

#import "FFTabbar.h"

// 屏幕宽度
#define FFScreenWidth [UIScreen mainScreen].bounds.size.width
// 屏幕高度
#define FFScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation FFTabbar

- (instancetype)initWithBar:(CGFloat)tabbarHeight barItems:(NSArray *)barItems tabbarItemSelectBlock:(void(^)(NSInteger selectedIndex))tabbarItemSelectBlock {
    CGRect frame = CGRectMake(0, FFScreenHeight-tabbarHeight, FFScreenWidth, tabbarHeight);
    
    if (self = [super initWithFrame:frame]) {
        self.barItems = [NSArray arrayWithArray:barItems];
        self.currentItemsBtns = [NSMutableArray new];
        self.currentItemsTitles = [NSMutableArray new];

        self.tabbarItemSelectBlock = tabbarItemSelectBlock;
        [self createUI];
    }
    
    return self;
}


- (void)createUI {

}

- (void)changeTabbarUI:(NSInteger)selectedIndex {
    for (NSInteger i = 0; i < self.barItems.count; i++) {
        UIButton *btn = (UIButton *)self.currentItemsBtns[i];
        UILabel *titleLab = (UILabel *)self.currentItemsTitles[i];
        
        FFTabbarItem *tabbarItem = (FFTabbarItem *)self.barItems[i];
        if (i == selectedIndex) {
            [btn setImage:[UIImage imageNamed:tabbarItem.selectedImageName] forState:UIControlStateNormal];
            titleLab.textColor = [UIColor blackColor];
        } else {
            [btn setImage:[UIImage imageNamed:tabbarItem.normalImageName] forState:UIControlStateNormal];
            titleLab.textColor = [UIColor blackColor];
        }
    }
}

@end
