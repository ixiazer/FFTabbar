//
//  FFhomeTabbarVC.h
//  FreshFresh
//
//  Created by ixiazer on 16/3/30.
//  Copyright © 2016年 com.freshfresh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFTabbar.h"
#import "FFTabbarItem.h"

typedef void(^vcTransitionBlock) (UIViewController *fromVC, UIViewController *toVC);

@interface FFNextTabbarController : UIViewController
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) NSArray *tabBarVCs;

@property (nonatomic, strong) FFTabbar *tabBar;
@property (nonatomic, weak) UIViewController *selectedViewController;
@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, copy) vcTransitionBlock vcTransitionBlock;
@property (nonatomic) NSTimeInterval transitionDuration;

- (instancetype)initWithViewController:(NSArray *)viewControllers;
- (void)createTabbar;

// 替换UITab
- (void)setViewControllers:(NSArray *)newViewController;
@end
