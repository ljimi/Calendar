//
//  RL_Cell.m
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "CurrentMonthCell.h"

#define todayColor ZCColor(237, 113, 97, 1)//当天的背景色
#define guoqidayColor ZCColor(0, 188, 212, 1)//过期的背景色
#define daibandayColor ZCColor(139, 195, 74, 1)//待办的背景色
#define shuangxiudayColor ZCColor(29, 137, 207, 1)//周六周日的文字颜色
#define normaldayColor ZCColor(42, 50, 69, 1)//默认1-5文字颜色

@implementation CurrentMonthCell

+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)index cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CurrentMonthCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:index forIndexPath:indexPath];
    if (!cell) {
        cell = [[CurrentMonthCell alloc] init];
    }
    return cell;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
        [ZCNotificationCenter addObserver:self selector:@selector(notifica:) name:RLReturnRefreshRCNotification object:nil];
    }
    return self;
}

-(void)setTitle:(NSString *)title{
    _title = title;
    
    [_cellBtn setTitle:_title forState:UIControlStateNormal];
    
//    (_title.length == 0)?(_cellBtn.hidden = YES):[_cellBtn setTitle:_title forState:UIControlStateNormal];
    
    NSString *todayStr = [RLTool getToday];
    
    self.normalColor = [UIColor whiteColor];
    
    //如果日期是今天
    if (_isCurrentYear == YES && _isCurrentMonth == YES && [_title isEqualToString:todayStr]) {
        self.normalColor = todayColor;
    }
    
    //如果日期过期事务
    if (_isCurrentYear == YES && _isCurrentMonth == YES && [_title isEqualToString:@"12"] && 12 <
        [todayStr intValue]) {
        self.normalColor = guoqidayColor;
    }
    
    //如果日期待办事务
    if (_isCurrentYear == YES && _isCurrentMonth == YES && [_title isEqualToString:@"30"] && 30 >
        [todayStr intValue]) {
        self.normalColor = daibandayColor;
    }
    
    _cellBtn.backgroundColor = self.normalColor;
    
    
    //当前月份日期外区域不可点击
    if (_row <= 6 + _fristDayInMonthIsWeak - 1 || _row >= _monthCount + 6 + _fristDayInMonthIsWeak) {
        _cellBtn.enabled = NO;
    }
}


-(void)setRow:(NSInteger)row{
    _row = row;
    //周六周日显示的颜色
    if (_row % 7 == 0 || (_row + 1) % 7 == 0) {
        [_cellBtn setTitleColor:shuangxiudayColor forState:UIControlStateNormal];
    }
}


-(void)notifica:(NSNotification *)notification{
    _cellBtn.enabled = YES;
    _cellBtn.selected = NO;
    _cellBtn.backgroundColor = [UIColor whiteColor];
}

-(void)dealloc{
    [ZCNotificationCenter removeObserver:self];
}

-(void)click:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected == YES && sender.backgroundColor != [UIColor redColor]) {
        sender.titleLabel.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        sender.backgroundColor = [UIColor blueColor];
        self.isSelectedBlock(YES);
    }else if(sender.selected == NO && sender.backgroundColor != [UIColor redColor]){
        sender.titleLabel.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        sender.backgroundColor = self.normalColor;
        self.isSelectedBlock(NO);
    }
}

#pragma marn initUI

-(void)setUp{
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.cellBtn];
}

-(UIButton *)cellBtn{
    if (!_cellBtn) {
        _cellBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cellBtn.frame = CGRectMake(self.contentView.width/2-AdapterX(11), self.contentView.height/2-AdapterX(11), AdapterX(22), AdapterX(22));
        _cellBtn.layer.masksToBounds = YES;
        _cellBtn.layer.cornerRadius = AdapterX(11);
        _cellBtn.titleLabel.font = AdapterFontSize(12);
        [_cellBtn setTitleColor:normaldayColor forState:UIControlStateNormal];
        [_cellBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [_cellBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cellBtn;
}


-(void)setIsCurrentMonth:(BOOL)isCurrentMonth{
    _isCurrentMonth = isCurrentMonth;
}

-(void)setIsCurrentYear:(BOOL)isCurrentYear{
    _isCurrentYear = isCurrentYear;
}

-(void)setMonthCount:(NSInteger)monthCount{
    _monthCount = monthCount;
}

-(void)setFristDayInMonthIsWeak:(int)fristDayInMonthIsWeak{
    _fristDayInMonthIsWeak = fristDayInMonthIsWeak;
}

-(void)setNormalColor:(UIColor *)normalColor{
    _normalColor = normalColor;
}


@end
