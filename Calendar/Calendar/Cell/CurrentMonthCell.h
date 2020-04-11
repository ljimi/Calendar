//
//  RL_Cell.h
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentMonthCell : UICollectionViewCell

@property(copy, nonatomic) NSString *title;
@property(assign, nonatomic) NSInteger row;

@property(nonatomic, assign) int fristDayInMonthIsWeak;//当前月份的第一天是周几
@property(nonatomic, assign) NSInteger monthCount;//当前月份的天数
@property(nonatomic, assign) BOOL isCurrentYear;//当前年份是否是今年
@property(nonatomic, assign) BOOL isCurrentMonth;//当前月份是否是本月，配合isCurrentYear使用

@property(nonatomic, copy) void(^isSelectedBlock)(BOOL isSelected);

+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)index cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
