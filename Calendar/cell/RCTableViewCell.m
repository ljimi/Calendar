//
//  RCTableViewCell.m
//  ZhiChuangGC
//
//  Created by Mac on 17/4/19.
//  Copyright © 2017年 ZC. All rights reserved.
//

#import "RCTableViewCell.h"

@implementation RCTableViewCell

+(instancetype)cellWithTableview:(UITableView *)tableview{
    
    RCTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:@"RCTableViewCell"];
    if (!cell) {
        cell = [[RCTableViewCell alloc] init];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)setUp{
    
    self.contentView.layer.borderWidth = 0.27;
    self.contentView.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    
    UILabel *toplineLab = [UILabel new];
    toplineLab.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:toplineLab];
    
    _titleLab = [UILabel addLabWithFontSize:AdapterFontSize(14) color:ZCColor(42, 50, 69, 1) textAlignment:NSTextAlignmentCenter];
    _titleLab.text = @"三天";
    [self.contentView addSubview:_titleLab];
    
    _lineLab = [UILabel new];
    _lineLab.backgroundColor = ZCColor(237, 113, 97, 1);
    [self.contentView addSubview:_lineLab];
    
    _detailLab = [UILabel addLabWithFontSize:AdapterFontSize(12) color:ZCColor(42, 50, 69, 1)];
    _detailLab.text = @"三天施工活动检查";
    [self.contentView addSubview:_detailLab];
    
    UILabel *bolineLab = [UILabel new];
    bolineLab.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:bolineLab];
    
    
    
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.width.mas_equalTo(CELLW-1);
        make.height.mas_equalTo(CELLH);
        make.bottom.equalTo(bolineLab.mas_top).priorityLow();
        
    }];
    
    [_lineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(_titleLab.mas_height);
        make.width.mas_equalTo(2);
        make.left.equalTo(_titleLab.mas_right);
        make.centerY.equalTo(_titleLab.mas_centerY);
    }];
    
    [_detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.left.equalTo(_lineLab.mas_right).offset(AdapterX(5));
        make.centerY.equalTo(_titleLab.mas_centerY);
    }];
    
    [bolineLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.left.equalTo(@0);
        make.height.mas_equalTo(0.5);
    }];
 
    
    
}

@end
