//
//  CalendarView.m
//  Calendar
//
//  Created by Sunror on 2018/5/31.
//  Copyright © 2018年 MXL. All rights reserved.
//

#import "CalendarView.h"
#import "CurrentMonthTitleReusableView.h"
#import "CurrentMonthCell.h"

@interface CalendarView ()
@end

@implementation CalendarView

-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

-(void)setting{
    
    self.backgroundColor = [UIColor whiteColor];
    self.bounces = NO;
    self.showsVerticalScrollIndicator = NO;
    
    //默认本月为当前月份
    _isCurrentYear = YES;
    _isCurrentMonth = YES;
    _currentDate = [RLTool getDate];//获得当前日期
    _monthCount = [RLTool getNumberOfDaysInMonth:[NSDate date]];//获得当月的天数
    _fristDayInMonthIsWeak = [[RLTool getweekDayWithDate:[NSDate date]] intValue];//获得当月第一天是周几
    for (NSInteger i = 0; i < 50 ; i++) {
        [self registerClass:[CurrentMonthCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"CookingEquipmentCellId%ld",i]];
    }
    
    [self registerClass:[CurrentMonthTitleReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([CurrentMonthTitleReusableView class])];
}


#pragma 日程的数据加载

-(void)setMonthDate{
    
    NSInteger startEmpty = self.fristDayInMonthIsWeak - 1;
    NSInteger supposeEndEmpty = 48 - self.monthCount - 6 - self.fristDayInMonthIsWeak;
//    NSInteger trueEndEmpty;
    
    if (supposeEndEmpty < 6 && supposeEndEmpty >= 0) {
//        trueEndEmpty = supposeEndEmpty;
        self.collectionRows = 7;
    }else{
//        trueEndEmpty = 41 - self.monthCount - 6 - self.fristDayInMonthIsWeak;
        self.collectionRows = 6;
    }
    //星期行数据
    [self.monthArray addObjectsFromArray:weakArray];
    //空白
    for (int i = 0; i < startEmpty; i ++) {
        [self.monthArray addObject:@""];
    }
    //当前月份（天）数据
    for (int i = 1; i <= self.monthCount; i ++) {
        [self.monthArray addObject:((i <= 9))?[NSString stringWithFormat:@"0%d",i]:[NSString stringWithFormat:@"%d",i]];
    }
    //空白
//    for (int i = 0; i <= trueEndEmpty; i ++) {
//        [self.monthArray addObject:@""];
//    }
    
    self.height = CELLH * self.collectionRows + AdapterY(30);
    [self reloadData];
}

-(void)setIsCurrentMonth:(BOOL)isCurrentMonth{
    _isCurrentMonth = isCurrentMonth;
}

-(void)setIsCurrentYear:(BOOL)isCurrentYear{
    _isCurrentYear = isCurrentYear;
}

-(void)setCurrentDate:(NSString *)currentDate{
    _currentDate = currentDate;
}

-(void)setMonthCount:(NSInteger)monthCount{
    _monthCount = monthCount;
}

-(void)setFristDayInMonthIsWeak:(int)fristDayInMonthIsWeak{
    _fristDayInMonthIsWeak = fristDayInMonthIsWeak;
}

-(void)setCollectionRows:(NSInteger)collectionRows{
    _collectionRows = collectionRows;
}

-(NSMutableArray *)monthArray{
    if (!_monthArray) {
        _monthArray = [NSMutableArray array];
    }
    return _monthArray;
}


@end
