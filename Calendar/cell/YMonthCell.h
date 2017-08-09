//
//  YY_Cell.h
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMonthCell : UICollectionViewCell
@property(nonatomic, strong) NSMutableArray *monthArray;
@property(nonatomic, strong) NSDate *date;
@property(nonatomic, strong) UILabel *titleLab;
@property(nonatomic, strong) UIView *weakView;
@property(nonatomic, strong) UIView *view;
+(instancetype)cellWithTableview:(UICollectionView *)collectionView Identifier:(NSString *)index cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
