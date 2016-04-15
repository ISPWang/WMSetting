//
//  WMSettingItem.h
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ WMSettingItemOperation)();

typedef void (^ WMSettingArrowItemReadyForDestVc)(id item, id destVc);

@interface WMSettingItem : NSObject

@property (nonatomic, copy  ) NSString               *icon;
@property (nonatomic, copy  ) NSString               *title;
@property (nonatomic, copy  ) NSString               *subtitle;
@property (nonatomic, copy  ) NSString               *badgeValue;
@property (nonatomic, strong) UIColor                *cellColor;
@property (nonatomic, copy  ) WMSettingItemOperation operation;
/**
 *  创建个item 对象 传入图标 和 title
 *
 *  @param icon  图标字符串
 *  @param title 文字
 *
 *  @return 返回对象
 */
+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title;
+ (instancetype)itemWithTitle:(NSString *)title;
+ (instancetype)item;
@end


@interface WMSettingArrowItem : WMSettingItem


/**
 *  目标控制器
 */
@property (assign, nonatomic) Class destVcClass;


@property (copy, nonatomic) WMSettingArrowItemReadyForDestVc readyForDestVc;

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title destVcClass:(Class)destVcClass;
+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;

@end

@interface WMSettingValueItem : WMSettingArrowItem
@property (nonatomic, copy) NSString *key;
@end

@interface WMSettingLabelItem : WMSettingValueItem

@property (copy, nonatomic) NSString *text;

@property (copy, nonatomic) NSString *defaultText;

@end

@interface WMSettingSwitchItem : WMSettingValueItem

@property (nonatomic, copy) NSString *text; /**< swit text */
@property (assign, nonatomic, getter = isOn) BOOL on;
@property (assign, nonatomic, getter = isDefaultOn) BOOL defaultOn;
@end

@interface WMSettingCheckItem : WMSettingItem
@property (assign, nonatomic, getter = isChecked) BOOL checked;
@end



extern  NSString *const WMSwitchDidNotificationChange;