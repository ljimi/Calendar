//
//  YY_Cell.m
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "YMonthCell.h"


@implementation YMonthCell

+(instancetype)cellWithTableview:(UICollectionView *)collectionView Identifier:(NSString *)index cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YMonthCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:index forIndexPath:indexPath];
    if (!cell) {
        cell = [[YMonthCell alloc] init];
    }
    return cell;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
        
    }
    return self;
}


-(void)setUp{
    
    
     NSArray *weakArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    
    _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, AdapterY(13.5))];
    _titleLab.font = AdapterFontSize(15);
    [self.contentView addSubview:_titleLab];
    
    _weakView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLab.frame) + AdapterY(5), self.contentView.width, AdapterY(10))];
    [self.contentView addSubview:_weakView];
    
    CGFloat labW = _weakView.width/7;
    CGFloat labH = _weakView.height;
    
    for (int i = 0 ; i < 7 ; i ++) {
        
        
        UILabel *lab = [UILabel new];
        CGFloat labX = labW * i;
        lab.frame = CGRectMake(labX, 0, labW, labH);
        lab.text = weakArray[i];
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = AdapterFontSize(9);
        [_weakView addSubview:lab];
    }
    
}



-(NSMutableArray *)monthArray{
    if (!_monthArray) {
        _monthArray = [NSMutableArray array];
    }
    
    return _monthArray;
}

-(void)setDate:(NSDate *)date{
    
    _date = date;
    
    
    [_view removeFromSuperview];
    //[self.monthArray removeAllObjects];
    
    //NSLog(@"!!!!!!!!!!!!!!!!!!!!!%@",_date);
    
    //获取返回日期信息
    //NSDate *date = [RLTool strToDateWothStrYear:_year strMonth:_month];
    //isCurrentYear = [RLTool isCurrentYear:year];
    //isCurrentMonth = [RLTool isCurrentMonth:month];
    

    
    NSInteger monthCount = [RLTool getNumberOfDaysInMonth:_date];
    int fristDayInMonthIsWeak = [[RLTool getweekDayWithDate:_date] intValue];
    
    
    NSInteger startEmpty = fristDayInMonthIsWeak - 1;
    NSInteger trueEndEmpty = 41 - monthCount - fristDayInMonthIsWeak;
    
    
    
    //空白
    for (int i = 0; i < startEmpty; i ++) {
        [self.monthArray addObject:@""];
        
        //NSLog(@"==================%ld",(long)startEmpty);
    }
    
    //当前月份（天）数据
    for (int i = 1; i <= monthCount; i ++) {
        
        [self.monthArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    //空白
    for (int i = 0; i <= trueEndEmpty; i ++) {
        [self.monthArray addObject:@""];
    }
    
    
    _view = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_weakView.frame)+AdapterY(3), self.contentView.width, self.contentView.height - _titleLab.height - _weakView.height)];
    [self.contentView addSubview:_view];
    
    CGFloat labCW = (self.contentView.width - AdapterX(6))/7;
    CGFloat labCH = (self.contentView.width - AdapterX(6))/7;
    for (int i = 0 ; i < _monthArray.count ; i ++) {
        
     
          //  UILabel *lab = [UILabel addLabWithFontSize:AdapterFontSize(9) color:[UIColor blackColor] textAlignment:NSTextAlignmentCenter];
        
            UILabel *lab = [UILabel new];
            lab.font = AdapterFontSize(9);
            lab.textColor = [UIColor blackColor];
            lab.textAlignment = NSTextAlignmentCenter;
                       
            int ih = i/7;
            int iL = i%7;
            CGFloat labX = (labCW + AdapterX(1)) * iL;
            lab.frame = CGRectMake(labX, (labCH + AdapterY(1))* ih, labCW, labCH);
            lab.text = _monthArray[i];
            [_view addSubview:lab];
            
        
    }
    
}

@end
