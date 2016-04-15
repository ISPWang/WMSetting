//
//  WMSettingItem.m
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingItem.h"
NSString *const WMSwitchDidNotificationChange = @"WMSwitchDidNotificationChange";

@implementation WMSettingItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    WMSettingItem *item = [self item];
    item.icon           = icon;
    item.title          = title;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title {
    return [self itemWithIcon:nil title:title];
}

+ (instancetype)item {
    return [[self alloc] init];
}
@end

@implementation WMSettingArrowItem

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass {
    WMSettingArrowItem *item = [self itemWithIcon:icon title:title];
    item.destVcClass         = destVcClass;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass {
    return [self itemWithIcon:nil title:title destVcClass:destVcClass];
}
@end

@implementation WMSettingValueItem
- (NSString *)key {
    return _key ? _key : self.title;
}
@end


@implementation WMSettingLabelItem

- (NSString *)text {
    id value = [[NSUserDefaults standardUserDefaults] objectForKey:self.key];
    if (value == nil) {
        return self.defaultText;
    } else {
        return value;
    }
}

- (void)setText:(NSString *)text {
    [[NSUserDefaults standardUserDefaults] setObject:text forKey:self.key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

@implementation WMSettingSwitchItem
- (id)init {
    if (self = [super init]) {
        self.defaultOn = YES;
    }
    return self;
}

- (BOOL)isOn {
    id value = [[NSUserDefaults standardUserDefaults] objectForKey:self.key];
    if (value == nil) {
        return self.isDefaultOn;
    } else {
        return [value boolValue];
    }
}

- (void)setOn:(BOOL)on {
    [[NSUserDefaults standardUserDefaults] setBool:on forKey:self.key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end

@implementation WMSettingCheckItem

@end

