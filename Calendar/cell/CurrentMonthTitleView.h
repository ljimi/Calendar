//
//  CurrentMonthTitleView.h
//  日历test
//
//  Created by Mac on 17/4/18.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CurrentMonthTitleView;
@protocol CurrentMonthTitleViewDelegate <NSObject>

-(void)CurrentMonthTitleViewDelegate:(CurrentMonthTitleView *)currentMonthTitleView;

@end


@interface CurrentMonthTitleView : UIView
@property(nonatomic ,strong) UIButton *titleBtn;
@property(nonatomic ,weak) id<CurrentMonthTitleViewDelegate> delegate;
@end
