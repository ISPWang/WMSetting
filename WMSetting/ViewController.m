//
//  ViewController.m
//  WMSetting
//
//  Created by auto on 16/4/13.
//  Copyright © 2016年 Beijing TianyingJiuzhou Network Technology Co. Ltd. All rights reserved.
//

#import "ViewController.h"
#import "WMCheckSettingViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    self.view.backgroundColor = [UIColor colorWithRed:1.000 green:0.874 blue:0.851 alpha:1.000];
}
- (void)setupGroup0 {
    WMSettingGroup *group = [self addGroup];
    WMSettingArrowItem *thirdAccount = [WMSettingArrowItem itemWithIcon:@"personal_btn_set" title:@"设置" destVcClass:nil];
    [UIImage imageNamed:@"photo_icon_wechat"];
    group.items = @[thirdAccount];
}

- (void)setupGroup1 {
    WMSettingGroup *group = [self addGroup];
    
    WMSettingLabelItem *qq = [WMSettingLabelItem
                              itemWithIcon:@"personal_btn_qq"
                              title:@"qq"
                          destVcClass:NSClassFromString(@"WMCheckSettingViewController")];
     WMSettingLabelItem *weiChat = [WMSettingLabelItem
                                    itemWithIcon:@"photo_icon_wechat"
                                    title:@"weiChat"
                                destVcClass:NSClassFromString(@"WMCheckSettingViewController")];
     WMSettingLabelItem *weibo = [WMSettingLabelItem
                                  itemWithIcon:@"photo_icon_weibo"
                                  title:@"weiBo"
                              destVcClass:NSClassFromString(@"WMCheckSettingViewController")];
    weiChat.defaultText = @"微信";
    qq.defaultText      = @"QQ";
    weibo.defaultText   = @"微博";
    
    qq.readyForDestVc = ^(WMSettingLabelItem *item, WMCheckSettingViewController *descVC) {
        descVC.sourceItem = item;
    };
    weiChat.readyForDestVc = ^(WMSettingLabelItem *item, WMCheckSettingViewController *descVC) {
        descVC.sourceItem = item;
    };
    weibo.readyForDestVc = ^(WMSettingLabelItem *item, WMCheckSettingViewController *descVC) {
        descVC.sourceItem = item;
    };
    
    group.items = @[qq, weiChat, weibo];
}

- (void)setupGroup2 {
    WMSettingGroup *group = [self addGroup];
    
    WMSettingSwitchItem *notice = [WMSettingSwitchItem itemWithTitle:@"推送通知设置:" destVcClass:nil]; // item 0
    WMSettingLabelItem *diskCaches = [WMSettingLabelItem itemWithTitle:@"清理缓存:" destVcClass:nil]; // 清理缓存
    diskCaches.defaultText =@"10M";
    
    group.items = @[notice, diskCaches];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
