//
//  Header.h
//  Calendar
//
//  Created by Sunror on 2018/5/31.
//  Copyright © 2018年 MXL. All rights reserved.
//

#ifndef Header_h
#define Header_h


#import <UIKit/UIKit.h>

//#define WeakSelf __weak typeof(self) weakSelf = self;

#define weakArray @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"]

#define CELLW SCREENWIDTH/7
#define CELLH (SCREENWIDTH/7 - AdapterX(20))

#define ZCNotificationCenter [NSNotificationCenter defaultCenter]

static NSString *const RLReturnRefreshRCNotification = @"RLReturnRefreshRCNotification";

#import "RLTool.h"
#import "Adapter.h"
#import "UIView+Extension.h"
#import "NSObject+CurrentViewController.h"

#import "Calendar.h"
#import "CalendarView.h"

//rgb颜色
#define ZCColor(r,g,b,al) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:al]
//随机色
#define ZCRandomColor ZCColor((arc4random_uniform(255)),(arc4random_uniform(255)),(arc4random_uniform(255)),1)



#endif /* Header_h */
