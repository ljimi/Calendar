//
//  RLTool.m
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "RLTool.h"

@implementation RLTool

// 获取当月的天数
+ (NSInteger)getNumberOfDaysInMonth:(NSDate *)currentDate{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    //NSDate * currentDate = [NSDate date]; // 这个日期可以你自己给定
    return [calendar rangeOfUnit:NSCalendarUnitDay inUnit: NSCalendarUnitMonth forDate:currentDate].length;
}

+ (NSInteger)getNumberOfDaysInNeedMonth:(NSString *)strDate{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    
    NSDate * currentDate = [NSDate date]; // 这个日期可以你自己给定
    return [calendar rangeOfUnit:NSCalendarUnitDay inUnit: NSCalendarUnitMonth forDate:currentDate].length;
}

+ (NSString *)dateToStr:(NSDate *)date{
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM,dd"]; //只获取月和日的数据
   
    return [formatter stringFromDate:date];
}


+ (NSDate *)strToDate:(NSString *)cDate{
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];

    return [formatter dateFromString:cDate];
}

+ (NSDate *)strToDateWothStrYear:(NSString *)strYear strMonth:(NSString *)strMonth{
    
    NSString *strDate = ([strMonth intValue] <= 9)?[[strYear stringByAppendingString:[NSString stringWithFormat:@"0%@",strMonth]] stringByAppendingString:@"01"]:[[strYear stringByAppendingString:strMonth] stringByAppendingString:@"01"];

    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];

    return  [formatter dateFromString:strDate];
}




+ (NSNumber *)getweekDayWithDate:(NSDate *)date{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    
    NSString * dateString = [formatter stringFromDate:date];
    NSString *dateStr = [NSString stringWithFormat:@"%@-01",dateString];
    NSDate *Rdate = [RLTool strToDate:dateStr];
    
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:Rdate];
    
    return @([comps weekday]);
}


+ (NSString *)getDate{
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月"];
    
    return [formatter stringFromDate:date];
}


+ (BOOL)isCurrentYear:(NSString *)year{
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];

    return [[formatter stringFromDate:date] isEqualToString:year]?YES:NO;
}


+ (BOOL)isCurrentMonth:(NSString *)month{
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM"];
    
    NSString *strMonthDate = ([month intValue] <= 9)?[NSString stringWithFormat:@"0%@",month]:month;
    return [[formatter stringFromDate:date] isEqualToString:strMonthDate]?YES:NO;
}

+ (NSString *)getToday{
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];

    return [formatter stringFromDate:date];
}
@end
