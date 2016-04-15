//
//  WMSettingCheckGroup.m
//  iFreeTravel
//
//  Created by auto on 15/9/9.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingCheckGroup.h"

#import "WMSettingItem.h"

@implementation WMSettingCheckGroup
- (WMSettingCheckItem *)checkedItem {
    for (WMSettingCheckItem *item in self.items) {
        if (item.isChecked) return item;
    }
    return nil;
}

- (void)setCheckedItem:(WMSettingCheckItem *)checkedItem {
    for (WMSettingCheckItem *item in self.items) {
        item.checked = (item == checkedItem);
    }
    self.sourceItem.text = checkedItem.title;
}

- (int)checkedIndex {
    WMSettingCheckItem *item = self.checkedItem;
    return item ? (int)[self.items indexOfObject:item] : -1;
}

- (void)setCheckedIndex:(int)checkedIndex {
    if (checkedIndex <0 || checkedIndex >= self.items.count) return;
    
    self.checkedItem = self.items[checkedIndex];
}

- (void)setItems:(NSArray *)items {
    [super setItems:items];
    
    self.checkedIndex = self.checkedIndex;
    self.checkedItem = self.checkedItem;
    self.sourceItem = self.sourceItem;
}

- (void)setSourceItem:(WMSettingLabelItem *)sourceItem {
    _sourceItem = sourceItem;
    
    for (WMSettingCheckItem *item in self.items) {
        item.checked = [item.title isEqualToString:sourceItem.text];
    }
}
@end
