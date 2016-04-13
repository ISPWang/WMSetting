//
//  WMSettingItem.m
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingItem.h"

@implementation WMSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    WMSettingItem *item = [self item];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title {
    return [self itemWithIcon:nil title:title];
}

+ (instancetype)item {
    return [[self alloc] init];
}
@end
