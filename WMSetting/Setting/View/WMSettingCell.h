//
//  WMSettingCell.h
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@class WMSettingItem;
@interface WMSettingCell : UITableViewCell

@property (strong, nonatomic) WMSettingItem *item;
@property (nonatomic, strong) NSIndexPath *indexPath;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end