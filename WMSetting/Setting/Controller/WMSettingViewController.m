//
//  WMSettingViewController.m
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingViewController.h"

//#import "WMThirdAccountViewController.h"
//#import "WMMineUserInfoModel.h"
@interface WMSettingViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation WMSettingViewController
- (NSMutableArray *)groups {
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (WMSettingGroup *)addGroup {
    WMSettingGroup *group = [WMSettingGroup group];
    [self.groups addObject:group];
    return group;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITableView *settingTableView        =[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    settingTableView.separatorStyle      = UITableViewCellSeparatorStyleNone;
    //    settingTableView.sectionHeaderHeight = 10;
    settingTableView.sectionFooterHeight = 0;
    settingTableView.delegate            = self;
    settingTableView.dataSource          = self;
    self.settingTableView                = settingTableView;
    self.settingTableView.rowHeight = 44;
    [self.view addSubview:settingTableView];
    //    UIEdgeInsets distance = UIEdgeInsetsMake(64, 0, 0, 0);
    [settingTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.view).insets(distance);
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.bottom.equalTo(self.view.mas_bottom);//.offset(- 49);
    }];
    self.settingTableView.backgroundColor = [UIColor clearColor];
    
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    WMSettingGroup *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WMSettingCell *cell = [WMSettingCell cellWithTableView:tableView];
    WMSettingGroup *group = self.groups[indexPath.section];
    cell.item = group.items[indexPath.row];
//    WMLog(@"----ce%@",cell.item.title);
    cell.indexPath = indexPath;
    return cell;
}

#pragma mark - 代理
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    WMSettingGroup *group = self.groups[section];
    return group.footer;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    WMSettingGroup *group = self.groups[section];
    return group.header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 1.取出模型
    WMSettingGroup *group = self.groups[indexPath.section];
    WMSettingItem *item = group.items[indexPath.row];
    
    // 2.操作
    if (item.operation) {
        item.operation();
    }
    
    // 3.跳转
    if ([item isKindOfClass:[WMSettingArrowItem class]]) {
        WMSettingArrowItem *arrowItem = (WMSettingArrowItem *)item;
        if (arrowItem.destVcClass) {
            UIViewController *destVc = [[arrowItem.destVcClass alloc] init];
            destVc.title = [arrowItem.title stringByReplacingOccurrencesOfString:@":" withString:@""];
            if (arrowItem.readyForDestVc) { // 控制器的准备工作
                arrowItem.readyForDestVc(arrowItem, destVc);
            }
//            if ([destVc isKindOfClass:[WMThirdAccountViewController class]]) {
////                WMLog(@"---");
//                WMThirdAccountViewController *account = (WMThirdAccountViewController *)destVc;
//                account.qqStatus = arrowItem.userModel.qqStatus;
//                account.weiboStatus = arrowItem.userModel.weiboStatus;
//                account.weixinStatus = arrowItem.userModel.weixinStatus;
//            }
            [self.navigationController pushViewController:destVc animated:YES];
        }
    }
    // 4.check 打钩
    if ([item isKindOfClass:[WMSettingCheckItem class]]) {
        WMSettingCheckGroup *checkGroup = (WMSettingCheckGroup *)group;
        checkGroup.checkedIndex = (int)indexPath.row;
        
        // 刷新
        [tableView reloadData];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
