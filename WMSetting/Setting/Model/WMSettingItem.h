//
//  WMSettingItem.h
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^WMSettingItemOperation)();

@interface WMSettingItem : NSObject

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *badgeValue;
@property (nonatomic, strong) UIColor *cellColor;
@property (nonatomic, copy) WMSettingItemOperation operation;
/**
 *  <#Description#>
 *
 *  @param icon  <#icon description#>
 *  @param title <#title description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)item;
@end

extern  NSString *const WMSwitchDidNotificationChange;