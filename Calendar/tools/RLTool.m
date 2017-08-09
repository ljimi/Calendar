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
+ (NSInteger)getNumberOfDaysInMonth:(NSDate *)currentDate
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    //NSDate * currentDate = [NSDate date]; // 这个日期可以你自己给定
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit: NSCalendarUnitMonth forDate:currentDate];
    
    
    return range.length;
}

+ (NSInteger)getNumberOfDaysInNeedMonth:(NSString *)strDate
{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]; // 指定日历的算法
    
    
    NSDate * currentDate = [NSDate date]; // 这个日期可以你自己给定
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit: NSCalendarUnitMonth forDate:currentDate];
    
    
    return range.length;
}

+ (NSString *) dateToStr:(NSDate *)date
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM,dd"]; //只获取月和日的数据
   
    NSString * dateString = [formatter stringFromDate:date];
    return dateString;
}


+ (NSDate *) strToDate:(NSString *)cDate
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate * date = [formatter dateFromString:cDate];
   
    return date;
}

+ (NSDate *)strToDateWothStrYear:(NSString *)strYear strMonth:(NSString *)strMonth{
    
    NSString *strDate;
    
    if ([strMonth intValue] <= 9) {
        strDate = [[strYear stringByAppendingString:[NSString stringWithFormat:@"0%@",strMonth]] stringByAppendingString:@"01"];
        
    }else{
        strDate = [[strYear stringByAppendingString:strMonth] stringByAppendingString:@"01"];
        
    }
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSDate * date = [formatter dateFromString:strDate];
    
    return  date;

}




+ (NSNumber *) getweekDayWithDate:(NSDate *)date{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    
    NSString * dateString = [formatter stringFromDate:date];
    NSString *dateStr = [NSString stringWithFormat:@"%@-01",dateString];
    NSDate *Rdate = [RLTool strToDate:dateStr];
    
    
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:Rdate];
    
   
    return @([comps weekday]);
    
}


+ (NSString *) getDate{
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月"];
    
    NSString * dateString = [formatter stringFromDate:date];

    return dateString;
    
}

+ (BOOL) isCurrentYear:(NSString *)year{
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString * dateString = [formatter stringFromDate:date];
    
  
    if ([dateString isEqualToString:year]) {
        return YES;
    }else{
        return NO;
    }
    
}

+ (BOOL) isCurrentMonth:(NSString *)month{
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM"];
    NSString * dateString = [formatter stringFromDate:date];
    
    NSString *strMonthDate;
    
    if ([month intValue] <= 9) {
        strMonthDate = [NSString stringWithFormat:@"0%@",month];
        
    }else{
        strMonthDate = month;
        
    }
    if ([dateString isEqualToString:strMonthDate]) {
        return YES;
    }else{
       return NO;
    }
    
}

+ (NSString *) getToday{
    
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    
    NSString * dateString = [formatter stringFromDate:date];
    
    return dateString;
    
}
@end
