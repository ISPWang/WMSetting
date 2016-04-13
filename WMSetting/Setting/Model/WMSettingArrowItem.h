//
//  WMSettingArrowItem.h
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingItem.h"

@class WMSettingItem, WMMineUserInfoModel;

typedef void (^WMSettingArrowItemReadyForDestVc)(id item, id destVc);

@interface WMSettingArrowItem : WMSettingItem
/**
 *  目标控制器
 */
@property (assign, nonatomic) Class destVcClass;

@property (strong, nonatomic) WMMineUserInfoModel *userModel;

@property (copy, nonatomic) WMSettingArrowItemReadyForDestVc readyForDestVc;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;
@end
