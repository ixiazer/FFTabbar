//
//  FFTabbarItem.h
//  FreshFresh
//
//  Created by ixiazer on 16/3/30.
//  Copyright © 2016年 com.freshfresh. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^tabbarItemSelected)(NSInteger selectIndex);

@interface FFTabbarItem : NSObject
@property (nonatomic, strong) NSString *itemTitle;
@property (nonatomic, strong) NSString *normalImageName;
@property (nonatomic, strong) NSString *selectedImageName;

- (instancetype)initItemWith:(NSString *)itemTitle normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName;
@end
