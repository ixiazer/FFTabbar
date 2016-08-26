//
//  FFhomeTabbarVC.m
//  FreshFresh
//
//  Created by ixiazer on 16/3/30.
//  Copyright © 2016年 com.freshfresh. All rights reserved.
//

#import "FFNextTabbarController.h"

@implementation FFNextTabbarController

- (instancetype)initWithViewController:(NSArray *)viewControllers {
    if (self = [super init]) {
        self.tabBarVCs = [NSArray arrayWithArray:viewControllers];
        
        if (self.tabBarVCs.count > 0) {
            self.selectedViewController = [self.tabBarVCs objectAtIndex:0];
            self.selectedIndex = 0;
        }
    }
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createTabbar];
    [self.view addSubview:self.tabBar];
    
    // 初始化第一个selectedViewController
    [self addChildViewController:self.selectedViewController];
    [self.view insertSubview:self.selectedViewController.view belowSubview:self.tabBar];
    [self.selectedViewController didMoveToParentViewController:self];
}

- (void)createTabbar {
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (selectedIndex == _selectedIndex) {
        // 重复选中当前vc，返回
        return;
    }
    
    if (selectedIndex > self.tabBarVCs.count-1) {
        return;
    }
    
    UIViewController *fromViewController = self.selectedViewController;
    UIViewController *toViewController = [self.tabBarVCs objectAtIndex:selectedIndex];
    // 视图控制
    [self addChildViewController:toViewController];
    [fromViewController willMoveToParentViewController:nil];
    
    if (self.transitionDuration > 0 && self.vcTransitionBlock) {
        [self.view insertSubview:toViewController.view belowSubview:toViewController.view];
        
        [UIView animateWithDuration:self.transitionDuration animations:^{
            self.vcTransitionBlock(fromViewController, toViewController);
        } completion:^(BOOL finished) {
            [toViewController didMoveToParentViewController:self];
            [fromViewController removeFromParentViewController];
            [fromViewController.view removeFromSuperview];
            
            self.selectedViewController = toViewController;
            _selectedIndex = selectedIndex;
            [self.tabBar changeTabbarUI:_selectedIndex];
        }];
    } else {
        [toViewController didMoveToParentViewController:self];
        [self.view insertSubview:toViewController.view belowSubview:self.tabBar];
        
        [fromViewController removeFromParentViewController];
        [fromViewController.view removeFromSuperview];
        
        self.selectedViewController = toViewController;
        _selectedIndex = selectedIndex;
        [self.tabBar changeTabbarUI:_selectedIndex];
    }
}

- (void)setViewControllers:(NSArray *)newViewController {
    for (UIViewController *vc in self.tabBarVCs) {
        [vc removeFromParentViewController];
    }

    self.tabBarVCs = newViewController;
    
    if (self.tabBarVCs.count > 0) {
        self.selectedViewController = [self.tabBarVCs firstObject];
    }
    
    self.selectedIndex = 0;
    [self addChildViewController:self.selectedViewController];
    [self.view insertSubview:self.selectedViewController.view belowSubview:self.tabBar];
    [self.selectedViewController didMoveToParentViewController:self];
}


@end
