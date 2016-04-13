//
//  WMSettingValueItem.m
//  iFreeTravel
//
//  Created by auto on 15/9/8.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingValueItem.h"

@implementation WMSettingValueItem
- (NSString *)key
{
    return _key ? _key : self.title;
}
@end
