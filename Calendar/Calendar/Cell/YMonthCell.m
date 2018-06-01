//
//  YY_Cell.m
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "YMonthCell.h"

@implementation YMonthCell

+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)index cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YMonthCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:index forIndexPath:indexPath];
    if (!cell) {
        cell = [[YMonthCell alloc] init];
    }
    return cell;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setStrYear:(NSString *)strYear{
    _strYear = strYear;
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    
    NSString *strMonth = [NSString stringWithFormat:@"%ld",(long)_indexPath.row + 1];
    _titleLab.text = [strMonth stringByAppendingString:@"月"];
    _titleLab.textColor = ([RLTool isCurrentYear:self.strYear] && [RLTool isCurrentMonth:strMonth])?ZCColor(139, 195, 74, 1): ZCColor(29, 137, 207, 1);
    
    
    [_view removeFromSuperview];
    _view = nil;
    [self.contentView addSubview:self.view];
    [self.monthArray removeAllObjects];
    
    
    NSDate *date = [RLTool strToDateWothStrYear:self.strYear strMonth:strMonth];
    NSInteger monthCount = [RLTool getNumberOfDaysInMonth:date];
    int fristDayInMonthIsWeak = [[RLTool getweekDayWithDate:date] intValue] - 1;
    
    //空白
    for (int i = 0; i < fristDayInMonthIsWeak; i ++) {
        [self.monthArray addObject:@""];
    }
    
    //当前月份（天）数据
    for (int i = 1; i <= monthCount; i ++) {
        [self.monthArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    
    CGFloat labCW = (self.contentView.width - AdapterX(6))/7;
    CGFloat labCH = (self.contentView.width - AdapterX(6))/7;
    
    for (int i = 0 ; i < _monthArray.count ; i ++) {
        if (i >= fristDayInMonthIsWeak && i < _monthArray.count) {
            CGFloat labX = (labCW + AdapterX(1)) * (i % 7);
            CGFloat LabY = (labCH + AdapterY(1)) * (i / 7);
            [self addDayLabWithFrame:CGRectMake(labX, LabY, labCW, labCH) index:i];
        }
    }
    
}




#pragma mark initUI

-(void)setUp{
    [self.contentView addSubview:self.titleLab];
    [self getWeekLabs];
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, AdapterY(13.5))];
        _titleLab.font = AdapterFontSize(15);
    }
    return _titleLab;
}

-(void)getWeekLabs{
    
    CGFloat labY = CGRectGetMaxY(_titleLab.frame) + AdapterY(5);
    CGFloat labW = self.contentView.width/7;
    CGFloat labH = AdapterY(10);
    
    for (int i = 0 ; i < 7 ; i ++) {
        [self addWeekLabWithFrame:CGRectMake(labW * i, labY, labW, labH) index:i];
    }
}

-(void)addWeekLabWithFrame:(CGRect)frame index:(int)index{
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.text = weakArray[index];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = AdapterFontSize(9);
    [self.contentView addSubview:lab];
}

-(UIView *)view{
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLab.frame) + AdapterY(8) + AdapterY(10), self.contentView.width, self.contentView.height - _titleLab.height - AdapterY(10) - AdapterY(8))];
    return _view;
}


-(void)addDayLabWithFrame:(CGRect)frame index:(int)index{
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.font = AdapterFontSize(9);
    lab.textColor = [UIColor blackColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.text = _monthArray[index];
    [_view addSubview:lab];
}


-(NSMutableArray *)monthArray{
    if (!_monthArray) {
        _monthArray = [NSMutableArray array];
    }
    return _monthArray;
}

@end
