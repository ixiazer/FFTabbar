//
//  FFHomeTabbar.m
//  FFTabbar
//
//  Created by ixiazer on 16/8/26.
//  Copyright © 2016年 FF. All rights reserved.
//

#import "FFHomeTabbar.h"

// 屏幕宽度
#define FFScreenWidth [UIScreen mainScreen].bounds.size.width


@implementation FFHomeTabbar

- (void)createUI {
    self.backgroundColor = [UIColor whiteColor];
    self.alpha = 0.95;
    
    if (self.barItems.count == 0) {
        return;
    }
    
    self.lastSelectIndex = 0;
    
    CGFloat witdh = FFScreenWidth/self.barItems.count;
    
    for (NSInteger i = 0; i < self.barItems.count; i++) {
        FFTabbarItem *item = [self.barItems objectAtIndex:i];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(witdh*i, 1, witdh, self.frame.size.height-1);
        btn.backgroundColor = [UIColor clearColor];
        btn.tag = i;
        if (i == 0) {
            [btn setImage:[UIImage imageNamed:item.selectedImageName] forState:UIControlStateNormal];
        } else {
            [btn setImage:[UIImage imageNamed:item.normalImageName] forState:UIControlStateNormal];
        }
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 10, 0)];
        [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(witdh*i, self.frame.size.height-12, witdh, 10)];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:9];
        if (i == 0) {
            lab.textColor = [UIColor blackColor];
        } else {
            lab.textColor = [UIColor blackColor];
        }
        
        lab.text = item.itemTitle;
        [self addSubview:lab];
        
        [self.currentItemsBtns addObject:btn];
        [self.currentItemsTitles addObject:lab];
    }
    
    UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
    lineLab.layer.backgroundColor = [UIColor blackColor].CGColor;
    [self addSubview:lineLab];
}

#pragma mark - method
- (void)itemClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    NSInteger tag = btn.tag;
    if (self.tabbarItemSelectBlock) {
        self.tabbarItemSelectBlock(tag);
        
        if (tag != 3) {
            [self changeTabbarUI:tag];
        }
        self.lastSelectIndex = tag;
    }
}


@end
