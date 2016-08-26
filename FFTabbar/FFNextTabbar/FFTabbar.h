//
//  FFTabbar.h
//  FreshFresh
//
//  Created by ixiazer on 16/3/30.
//  Copyright © 2016年 com.freshfresh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFTabbarItem.h"

typedef void(^tabbarItemSelectBlock)(NSInteger selectedIndex);

@interface FFTabbar : UIView
@property (nonatomic, copy) tabbarItemSelectBlock tabbarItemSelectBlock;
@property (nonatomic, strong) NSMutableArray *currentItemsBtns;
@property (nonatomic, strong) NSMutableArray *currentItemsTitles;
@property (nonatomic, strong) NSArray *barItems;


- (instancetype)initWithBar:(CGFloat)tabbarHeight barItems:(NSArray *)barItems tabbarItemSelectBlock:(void(^)(NSInteger selectedIndex))tabbarItemSelectBlock;

- (void)createUI;
- (void)changeTabbarUI:(NSInteger)selectedIndex;
@end
