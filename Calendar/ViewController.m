//
//  ViewController.m
//  Calendar
//
//  Created by Mac on 17/8/9.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "ViewController.h"

//#import "Calendar.h"

@interface ViewController ()
@property(nonatomic, strong) Calendar *calendar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.calendar.collection];
}



-(Calendar *)calendar{
    if (!_calendar) {
        _calendar = [[Calendar alloc] init];
        _calendar.layout.itemSize = CGSizeMake(CELLW, CELLH);
        _calendar.collection = [[CalendarView alloc] initWithFrame: CGRectMake(0, 100, SCREENWIDTH, CELLH * _calendar.collection.collectionRows + AdapterY(30)) collectionViewLayout:_calendar.layout];
        _calendar.collection.dataSource = self.calendar;//-------
        _calendar.collection.delegate = self.calendar;//-------
        [_calendar.collection setting];//设置
        [_calendar.collection setMonthDate];//加载数据
    }
    return _calendar;
}

@end
