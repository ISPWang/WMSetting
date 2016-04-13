//
//  WMSettingGroup.h
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WMSettingGroup : NSObject
/** tableView的头部 */
@property (copy, nonatomic) NSString *header;
/** tableView的尾部 */
@property (copy, nonatomic) NSString *footer;
/** tableView分组成员 */
@property (strong, nonatomic) NSArray *items;

+ (instancetype)group;
@end
