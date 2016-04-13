//
//  WMSettingSwitchItem.h
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingValueItem.h"

@interface WMSettingSwitchItem : WMSettingValueItem
/**
 *  开关左边的文字
 */
@property (nonatomic, copy) NSString *text;
@property (assign, nonatomic, getter = isOn) BOOL on;
@property (assign, nonatomic, getter = isDefaultOn) BOOL defaultOn;
@end
