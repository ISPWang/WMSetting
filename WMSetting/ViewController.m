//
//  ViewController.m
//  WMSetting
//
//  Created by auto on 16/4/13.
//  Copyright © 2016年 Beijing TianyingJiuzhou Network Technology Co. Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
    self.view.backgroundColor = [UIColor yellowColor];
}
- (void)setupGroup0 {
    WMSettingGroup *group = [self addGroup];
    WMSettingArrowItem *thirdAccount = [WMSettingArrowItem itemWithTitle:@"绑定账号:" destVcClass:nil];
    thirdAccount.badgeValue =@"10";
    group.items = @[thirdAccount];
}

- (void)setupGroup1 {
    WMSettingGroup *group = [self addGroup];
    
    WMSettingLabelItem *uploadQueue = [WMSettingLabelItem itemWithTitle:@"上传队列:" destVcClass:nil];
    //    self.uploadQueue = uploadQueue;
    group.items = @[uploadQueue];
}

- (void)setupGroup2 {
    WMSettingGroup *group = [self addGroup];
    
    WMSettingArrowItem *notice = [WMSettingArrowItem itemWithTitle:@"推送通知设置:" destVcClass:nil]; // item 0
    WMSettingLabelItem *diskCaches = [WMSettingLabelItem itemWithTitle:@"清理缓存:" destVcClass:nil]; // 清理缓存
    //    self.diskCaches = diskCaches;
    diskCaches.defaultText =@"多少";
    diskCaches.operation = ^{
        //        [weakSelf cleakDiskForCaches];
    };
    
    group.items = @[notice, diskCaches];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
