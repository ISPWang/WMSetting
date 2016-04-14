//
//  WMSettingCell.m
//  iFreeTravel
//
//  Created by auto on 15/9/7.
//  Copyright (c) 2015年 auto. All rights reserved.
//

#import "WMSettingCell.h"
#import "WMSettingItem.h"
#import "WMSettingArrowItem.h"
#import "WMSettingSwitchItem.h"
#import "WMSettingLabelItem.h"
#import "WMSettingValueItem.h"
#import "WMSettingCheckItem.h"

//#import "WMMineUserInfoModel.h"
@interface WMSettingCell()
/**
 *  箭头
 */
@property (nonatomic, strong) UIImageView *arrowView;
/**
 *  打钩的箭头
 */
@property (nonatomic, strong) UIImageView *checkView;
/**
 *  开关
 */
@property (nonatomic, strong) UISwitch *switchView;
/**
 *  是否授权QQ
 */
@property (nonatomic, strong) UIImageView *qqImageView;
/**
 *  是否绑定微信
 */
@property (nonatomic, strong) UIImageView *weChatImageView;
/**
 *  是否绑定微博
 */
@property (nonatomic, strong) UIImageView *weiBoImageView;
/**
 *  提醒数字
 */
//@property (strong, nonatomic) WMBadgeButton *badgeButton;
/**
 *  子标题
 */
@property (nonatomic, weak) UILabel *subtitleLabel;

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, weak) UIImageView *bgView;
@property (nonatomic, weak) UIImageView *selectedBgView;
@property (nonatomic, strong) UIView *bView;
@property (nonatomic, strong) UILabel *switchTextLabel;
@property (nonatomic, strong) UIView *labelView;
@end
@implementation WMSettingCell
- (UISwitch *)switchView {
    if (_switchView == nil) {
        _switchView = [[UISwitch alloc] init];
//        _switchView.onTintColor = colorWith699FF;
        [_switchView addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}
- (void)switchChange {
    // 存储数据
    WMSettingSwitchItem *switchItem = (WMSettingSwitchItem *)self.item;

    [[NSNotificationCenter defaultCenter] postNotificationName:WMSwitchDidNotificationChange object:self userInfo:nil];
    
    switchItem.on = self.switchView.isOn;
}
- (UILabel *)switchTextLabel {
    if (_switchTextLabel == nil) {
        _switchTextLabel =[[UILabel alloc] init];
//        _subLabel.backgroundColor =[UIColor orangeColor];
        _switchTextLabel.font =[UIFont systemFontOfSize:14];
        _switchTextLabel.textColor = [UIColor colorWithWhite:0.600 alpha:1.000];
    }
    return _switchTextLabel;
}
- (UIView *)labelView {
    if (!_labelView) {
        _labelView =[[UIView alloc] init];
    }
    return _labelView;
}
- (UIView *)bView {
    if (_bView == nil) {
        _bView = [[UIView alloc] init];
    }
    return _bView;
}
- (UIImageView *)checkView
{
    if (_checkView == nil) {
        
        _checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo_icon_right"]];
    }
    return _checkView;
}
- (UIImageView *)qqImageView {
    if (_qqImageView == nil) {
        _qqImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"personal_btn_qq"]];
    }
    return _qqImageView;
}
- (UIImageView *)weChatImageView {
    if (_weChatImageView == nil) {
        _weChatImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo_icon_wechat"]];
    }
    return _weChatImageView;
}
- (UIImageView *)weiBoImageView
{
    if (_weiBoImageView == nil) {
        _weiBoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo_icon_weibo"]];
    }
    return _weiBoImageView;
}
- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_arrow_normal"]];
    }
    return _arrowView;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"setting";
    WMSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[WMSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
        cell.tableView = tableView;
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        // 子标题
        UILabel *subtitleLabel = [[UILabel alloc] init];
        subtitleLabel.backgroundColor = [UIColor clearColor];
        subtitleLabel.textColor = [UIColor lightGrayColor];
        subtitleLabel.highlightedTextColor = subtitleLabel.textColor;
        subtitleLabel.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:subtitleLabel];
        self.subtitleLabel = subtitleLabel;
        // 标题
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor colorWithWhite:0.200 alpha:1.000];//[UIColor blackColor];
        self.textLabel.highlightedTextColor = self.textLabel.textColor;
        self.textLabel.font = [UIFont systemFontOfSize:14];
        
        // 最右边的详情文字
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.textColor = [UIColor colorWithWhite:0.600 alpha:1.000];
        self.detailTextLabel.highlightedTextColor = self.detailTextLabel.textColor;
        self.detailTextLabel.font = [UIFont systemFontOfSize:14];//[UIFont systemFontOfSize:13];
        // 创建背景
        UIImageView *bgView = [[UIImageView alloc] init];
        self.backgroundView = bgView;
        self.bgView = bgView;
        
        UIImageView *selectedBgView = [[UIImageView alloc] init];
        self.selectedBackgroundView = selectedBgView;
        self.selectedBgView = selectedBgView;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.item.subtitle == nil) return;
    // 设置子标题
//    CGSize subtitleSize = [self.item.subtitle sizeWithFont:self.subtitleLabel.font];
   CGSize subtitleSize =  [self.item.subtitle sizeWithAttributes:@{NSFontAttributeName :self.subtitleLabel.font}];
    
    CGFloat subtitleW = subtitleSize.width;
    CGFloat subtitleH = subtitleSize.height;
    CGFloat subtitleX = CGRectGetMaxX(self.textLabel.frame) + 5;
    CGFloat subtitleY = (self.contentView.frame.size.height - subtitleH) * 0.5;
    self.subtitleLabel.frame = CGRectMake(subtitleX, subtitleY, subtitleW, subtitleH);
    [self.detailTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.switchView.mas_left).offset(-100);
    }];
}
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
    
    // 设置背景的图片
    NSUInteger totalRows = [self.tableView numberOfRowsInSection:indexPath.section];
    NSString *bgName = nil;
    if (totalRows == 1) { // 这组就1行
//                bgName = @"activity_icon_normal";
    } else if (indexPath.row == 0) { // 首行
//                bgName = @"activity_icon_normal";
        [self makeLineViewAddToSuperView:self.contentView];
    } else if (indexPath.row == totalRows - 1) { // 尾行
//                bgName = @"activity_icon_normal";
    } else { // 中行
//                bgName = @"activity_icon_normal";
        [self makeLineViewAddToSuperView:self.contentView];
    }
//    self.bgView.image = [UIImage resizedImageWithName:bgName];
//    self.selectedBgView.image = [UIImage imageFromContextWithColor:hexColor(f7f8f9)];
}
- (void)makeLineViewAddToSuperView:(UIView *)superView{
    UIView * lineView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ifree_line"]];
    [lineView sizeToFit];
    [superView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(superView.mas_bottom);
        make.left.equalTo(superView.mas_left).offset(-10);
        make.right.equalTo(superView.mas_right).offset(100);
    }];
    
}
- (void)setItem:(WMSettingItem *)item {
    _item = item;
    if (item.cellColor) {
        self.backgroundColor = item.cellColor;
    }
    // 1.设置数据
    [self setupData];
    
    // 2.设置右边的控件
    [self setupRightView];
}
/**
 *  设置数据
 */
- (void)setupData {
    // 1.图标
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    // 2.标题
    self.textLabel.text = self.item.title;
    
//    self.subLabel.text =self.item.subtitle;
    // 3.子标题
    if (self.item.subtitle) {
        self.subtitleLabel.hidden = NO;
        self.subtitleLabel.text = self.item.subtitle;
    } else {
        self.subtitleLabel.hidden = YES;
    }
}
/**
 *  设置右边的控件
 */
- (void)setupRightView {
    
    if (self.item.badgeValue && [self.item isKindOfClass:[WMSettingArrowItem class]]) {
//        self.badgeButton.badgeValue = self.item.badgeValue;
        WMSettingArrowItem *checkItem = (WMSettingArrowItem *)self.item;
//        WMLog(@"--%@---%@",checkItem.userModel.weixinStatus, checkItem.userModel);
        [self.bView addSubview:self.arrowView];
        [self.arrowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.bView);
            make.centerY.equalTo(self.bView);
        }];
        
//        if([checkItem.userModel.qqStatus isEqualToString:@"0"]) {
//            [self.qqImageView setAlpha:0.3];
//        } else {
//            [self.qqImageView setAlpha:1.0];
//        }
//        [self.bView addSubview:self.qqImageView];
//        [self.qqImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.arrowView.mas_left).offset(-13);
//            make.centerY.equalTo(self.bView);
//        }];
//        
//        if([checkItem.userModel.weixinStatus isEqualToString:@"0"]) {
//            [self.weChatImageView setAlpha:0.3];
//        } else {
//            [self.weChatImageView setAlpha:1.0];
//        }
//        [self.bView addSubview:self.weChatImageView];
//        [self.weChatImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.qqImageView.mas_left).offset(-11);
//            make.centerY.equalTo(self.bView);
//        }];
//        
//        if([checkItem.userModel.weiboStatus isEqualToString:@"0"]) {
//            [self.weiBoImageView setAlpha:0.3];
//        } else {
//            [self.weiBoImageView setAlpha:1.0];
//        }
//        [self.bView addSubview:self.weiBoImageView];
//        [self.weiBoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.weChatImageView.mas_left).offset(-11);
//            make.centerY.equalTo(self.bView);
//        }];
//        self.accessoryView = self.bView;//self.badgeButton;
    } else if ([self.item isKindOfClass:[WMSettingLabelItem class]]) { // 右边箭头加label
        self.accessoryView = self.arrowView;
//        [self.accessoryView addSubview:self.subLabel];
//        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(self.arrowView.mas_left).offset(-13);
//            make.centerY.equalTo(self.accessoryView.mas_centerY);
//        }];
        WMSettingLabelItem *labelItem = (WMSettingLabelItem *)self.item;
        self.detailTextLabel.text = labelItem.text;
    } else if ([self.item isKindOfClass:[WMSettingSwitchItem class]]) { // 右边是开关
        WMSettingSwitchItem *switchItem = (WMSettingSwitchItem *)self.item;
        self.switchView.on = switchItem.isOn;
        self.accessoryView = self.switchView;
        if (switchItem.text) { // 如果开关需要文字
            [self.accessoryView addSubview:self.switchTextLabel];
            self.switchTextLabel.text = switchItem.text;
            [self.switchTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(self.switchView.mas_left).offset(-11);
                make.centerY.equalTo(self.switchView.mas_centerY);
            }];
        }
    } else if ([self.item isKindOfClass:[WMSettingArrowItem class]]) { // 右边是箭头
            self.accessoryView = self.arrowView;
    } else if ([self.item isKindOfClass:[WMSettingCheckItem class]])
    { // 右边是打钩
        WMSettingCheckItem *checkItem = (WMSettingCheckItem *)self.item;
        self.accessoryView = checkItem.isChecked ? self.checkView : nil;
    } else { // 右边没有东西
        self.accessoryView = nil;
    }
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
