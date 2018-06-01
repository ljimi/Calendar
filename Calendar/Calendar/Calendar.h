//
//  Calendar.h
//  Calendar
//
//  Created by Sunror on 2018/5/31.
//  Copyright © 2018年 MXL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarView.h"

@interface Calendar : NSObject<UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property(nonatomic, strong) CalendarView *collection;
@property(nonatomic, strong) UICollectionViewFlowLayout *layout;
@end
