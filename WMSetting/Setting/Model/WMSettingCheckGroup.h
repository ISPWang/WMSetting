//
//  WMSettingCheckGroup.h
//  iFreeTravel
//
//  Created by auto on 15/9/9.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingGroup.h"

@class WMSettingCheckItem, WMSettingLabelItem;

@interface WMSettingCheckGroup : WMSettingGroup

/**
 *  选中的索引
 */
@property (assign, nonatomic) int checkedIndex;

/**
 *  选中的item
 */
@property (strong, nonatomic) WMSettingCheckItem *checkedItem;

/**
 *  来源于哪个item
 */
@property (strong, nonatomic) WMSettingLabelItem *sourceItem;
@end
