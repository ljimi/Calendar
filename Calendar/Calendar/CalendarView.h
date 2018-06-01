//
//  CalendarView.h
//  Calendar
//
//  Created by Sunror on 2018/5/31.
//  Copyright © 2018年 MXL. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface CalendarView : UICollectionView
@property(nonatomic, assign) int fristDayInMonthIsWeak;//当前月份的第一天是周几
@property(nonatomic, assign) NSInteger monthCount;//当前月份的天数
@property(nonatomic, assign) BOOL isCurrentYear;//当前年份是否是今年
@property(nonatomic,assign) BOOL isCurrentMonth;//当前月份是否是本月，配合isCurrentYear使用
@property(nonatomic, assign) NSInteger collectionRows;//显示多少行来计算_collection，RClist的高度
@property(nonatomic, strong) NSString *currentDate;
@property(nonatomic, strong) NSMutableArray *monthArray;//日程数据
@property(nonatomic, strong) NSArray *weakArray;
-(void)setting;
-(void)setMonthDate;
@end
