//
//  WMSettingLabelItem.h
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingValueItem.h"

@interface WMSettingLabelItem : WMSettingValueItem
@property (copy, nonatomic) NSString *text;
@property (copy, nonatomic) NSString *defaultText;

//+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title subTitle:(NSString *)subTitle destVcClass:(Class)destVcClass;
//+ (instancetype)itemWithTitle:(NSString *)title subTitle:(NSString *)subTitle destVcClass:(Class)destVcClass;
@end
