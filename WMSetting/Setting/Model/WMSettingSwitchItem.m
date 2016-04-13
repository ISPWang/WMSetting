//
//  WMSettingSwitchItem.m
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingSwitchItem.h"

@implementation WMSettingSwitchItem
- (id)init
{
    if (self = [super init]) {
        self.defaultOn = YES;
    }
    return self;
}

- (BOOL)isOn
{
    id value = [[NSUserDefaults standardUserDefaults] objectForKey:self.key];
    if (value == nil) {
        return self.isDefaultOn;
    } else {
        return [value boolValue];
    }
}

- (void)setOn:(BOOL)on
{
    [[NSUserDefaults standardUserDefaults] setBool:on forKey:self.key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
