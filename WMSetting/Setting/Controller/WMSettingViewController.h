//
//  WMSettingViewController.h
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

//#import "WMBaseTableViewController.h"
#import "WMSettingCheckGroup.h"
#import "WMSettingGroup.h"
#import "WMSettingCell.h"
#import "WMSettingArrowItem.h"
#import "WMSettingCheckItem.h"
#import "WMSettingLabelItem.h"

//@class WMSettingGroup;
@interface WMSettingViewController : UIViewController
@property (strong, nonatomic) NSMutableArray *groups;

@property (nonatomic, weak) UITableView *settingTableView;
/**
 *  添加一组数据
 */
- (WMSettingGroup *)addGroup;
@end
