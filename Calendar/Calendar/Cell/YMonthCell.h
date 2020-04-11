//
//  YY_Cell.h
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMonthCell : UICollectionViewCell
@property(nonatomic, copy) NSString *strYear;
@property(nonatomic, strong) NSIndexPath *indexPath;

+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView Identifier:(NSString *)index cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
