//
//  WMSettingLabelItem.m
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingLabelItem.h"

@implementation WMSettingLabelItem
- (NSString *)text
{
    id value = [[NSUserDefaults standardUserDefaults] objectForKey:self.key];
    if (value == nil) {
        return self.defaultText;
    } else {
        return value;
    }
}

- (void)setText:(NSString *)text
{
    [[NSUserDefaults standardUserDefaults] setObject:text forKey:self.key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
//+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle destVcClass:(Class)destVcClass {
//    WMSettingLabelItem *item = [self itemWithIcon:icon title:title];
//    item.destVcClass = destVcClass;
//    item.subtitle = subTitle;
//    return item;
//}
//+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle destVcClass:(Class)destVcClass {
//    return [self itemWithIcon:nil title:title subTitle:subTitle destVcClass:destVcClass];
//}
@end