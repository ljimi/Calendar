//
//  RL_Cell.h
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CurrentMonthCell : UICollectionViewCell

@property (strong, nonatomic) UIButton *cellBtn;
@property (strong, nonatomic) UIView *border;
+(instancetype)cellWithTableview:(UICollectionView *)collectionView Identifier:(NSString *)index cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
