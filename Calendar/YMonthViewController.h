//
//  YYRLViewController.h
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YYMMblock)(NSString *year,NSString *month);

@interface YMonthViewController : UIViewController


@property (nonatomic, copy) YYMMblock yyddBlock;
-(void)backYYMM:(YYMMblock)block;

@end
