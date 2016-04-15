//
//  WMCheckSettingViewController.m
//  WMSetting
//
//  Created by auto on 16/4/15.
//  Copyright © 2016年 Beijing TianyingJiuzhou Network Technology Co. Ltd. All rights reserved.
//

#import "WMCheckSettingViewController.h"
#import "WMSettingCheckGroup.h"
#import "WMSettingItem.h"

@interface WMCheckSettingViewController ()

@end

@implementation WMCheckSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:1.000 green:0.969 blue:0.877 alpha:1.000];
    
    // 添加组
    WMSettingCheckGroup *group = [WMSettingCheckGroup group];
    [self.groups addObject:group];
    // 设置数据
    WMSettingCheckItem *qqItem = [WMSettingCheckItem itemWithIcon:@"personal_btn_qq" title:@"QQ"];//itemWithTitle:@"QQ"];
    WMSettingCheckItem *weiChatItem = [WMSettingCheckItem itemWithIcon:@"photo_icon_wechat" title:@"微信"];
    WMSettingCheckItem *weiboItem = [WMSettingCheckItem itemWithIcon:@"photo_icon_weibo" title:@"微博"];
    group.items = @[qqItem, weiChatItem, weiboItem];
    
    // 设置来源
    group.sourceItem = self.sourceItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
