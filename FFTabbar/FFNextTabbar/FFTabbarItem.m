//
//  FFTabbarItem.m
//  FreshFresh
//
//  Created by ixiazer on 16/3/30.
//  Copyright © 2016年 com.freshfresh. All rights reserved.
//

#import "FFTabbarItem.h"

@implementation FFTabbarItem

- (instancetype)initItemWith:(NSString *)itemTitle normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName {
    if (self = [super init]) {
        _itemTitle = itemTitle;
        _normalImageName = normalImageName;
        _selectedImageName = selectedImageName;
    }
    
    return self;
}


@end
