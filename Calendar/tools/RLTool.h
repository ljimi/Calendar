//
//  RLTool.h
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RLTool : NSObject
// 年-月-日 时:分:秒
// 这个格式可以随便定义,比如：@"yyyy,MM,dd,HH,mm,ss"

// 获取当月的天数
+ (NSInteger)getNumberOfDaysInMonth:(NSDate *)currentDate;

// 日期和字符串之间的转换

//MM,dd
+ (NSString *) dateToStr:(NSDate *)date;

//yyyy-MM-dd
+ (NSDate *) strToDate:(NSString *)cDate;

//yyyyMMdd
+ (NSDate *)strToDateWothStrYear:(NSString *)strYear strMonth:(NSString *)strMonth;

// 获得这个月第一天是星期几  1 是周日，2是周一 3.以此类推
+ (NSNumber *) getweekDayWithDate:(NSDate *)date;

//yyyy年MM月
+ (NSString *) getDate;

//yyyy
+ (BOOL) isCurrentYear:(NSString *)year;

//MM
+ (BOOL) isCurrentMonth:(NSString *)month;

//dd
+ (NSString *) getToday;

@end
