//
//  ViewController.m
//  Calendar
//
//  Created by Mac on 17/8/9.
//  Copyright © 2017年 MXL. All rights reserved.
//




#import "ViewController.h"
#import "CurrentMonthTitleView.h"
#import "YMonthViewController.h"
#import "CurrentMonthCell.h"
#import "RCTableViewCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,CurrentMonthTitleViewDelegate>
{
    UICollectionView *collection;
    CurrentMonthTitleView *currentMonthTitleView;
    NSMutableArray *monthArray;//日程数据
    int fristDayInMonthIsWeak;//当前月份的第一天是周几？
    NSInteger monthCount;//当前月份的天数
    BOOL isCurrentYear;//当前年份是否是今年
    BOOL isCurrentMonth;//当前月份是否是本月，配合isCurrentYear使用
    NSInteger collectionRows;//显示多少行来计算collection，RClist的高度
    UITableView *RClistTableView;
    UILabel *lineLab;
}

@property(nonatomic, strong) UIScrollView *dateView;//日程
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //=======================日====程==========================
    
    _dateView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, SCREENWIDTH, SCREENHEIGHT)];
    _dateView.backgroundColor = [UIColor whiteColor];
    _dateView.showsVerticalScrollIndicator = NO;
    _dateView.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT);
    //默认本月为当前月份
    NSDate * currentDate = [NSDate date];//获得当前日期
    isCurrentYear = YES;
    isCurrentMonth = YES;
    monthCount = [RLTool getNumberOfDaysInMonth:currentDate];//获得当月的天数
    fristDayInMonthIsWeak = [[RLTool getweekDayWithDate:currentDate] intValue];//获得当月第一天是周几
    [self.view addSubview:_dateView];
    //加载数据
    [self setMonthDate];
    
    currentMonthTitleView = [[CurrentMonthTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, AdapterY(30))];
    currentMonthTitleView.delegate = self;
    [currentMonthTitleView.titleBtn setTitle:[RLTool getDate] forState:UIControlStateNormal];
    [_dateView addSubview:currentMonthTitleView];
    
    
    UICollectionViewFlowLayout *serverLayout=[[UICollectionViewFlowLayout alloc]init];
    serverLayout.itemSize = CGSizeMake(CELLW, CELLH);
    serverLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collection = [[UICollectionView alloc] initWithFrame: CGRectMake(0, CGRectGetMaxY(currentMonthTitleView.frame), SCREENWIDTH, CELLH * collectionRows) collectionViewLayout:serverLayout];
    collection.dataSource = self;
    collection.delegate = self;
    collection.bounces = NO;
    collection.backgroundColor = [UIColor whiteColor];
    collection.showsVerticalScrollIndicator = NO;
    [_dateView addSubview:collection];
    
    lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(collection.frame), SCREENWIDTH, 0.27)];
    lineLab.backgroundColor = [UIColor grayColor];
    [_dateView addSubview:lineLab];
    
    for (NSInteger i = 0; i < monthArray.count ; i++) {
        
        NSString * stringID = [NSString stringWithFormat:@"CookingEquipmentCellId%ld",i];
        
        [collection registerClass:[CurrentMonthCell class] forCellWithReuseIdentifier:stringID];
        
    }
    
    RClistTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineLab.frame), SCREENWIDTH, SCREENHEIGHT - CGRectGetMaxY(lineLab.frame)) style:UITableViewStylePlain];
    RClistTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    RClistTableView.estimatedRowHeight = 150;
    RClistTableView.delegate = self;
    RClistTableView.dataSource = self;
    [_dateView addSubview:RClistTableView];
    
}


#pragma 日程的数据加载

-(void)setMonthDate{
    
    
    NSInteger startEmpty = fristDayInMonthIsWeak - 1;
    NSInteger supposeEndEmpty = 48 - monthCount - 6 - fristDayInMonthIsWeak;
    NSInteger trueEndEmpty;
    
    if (supposeEndEmpty < 6 && supposeEndEmpty >= 0) {
        trueEndEmpty = supposeEndEmpty;
        collectionRows = 7;
    }else{
        trueEndEmpty = 41 - monthCount - 6 - fristDayInMonthIsWeak;
        collectionRows = 6;
    }
    
    monthArray = [NSMutableArray array];
    
    NSArray *weakArray = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    //星期行数据
    [monthArray addObjectsFromArray:weakArray];
    
    //空白b
    for (int i = 0; i < startEmpty; i ++) {
        [monthArray addObject:@""];
        
        //NSLog(@"==================%ld",(long)startEmpty);
    }
    
    //当前月份（天）数据
    for (int i = 1; i <= monthCount; i ++) {
        
        if (i <= 9) {
            [monthArray addObject:[NSString stringWithFormat:@"0%d",i]];
        }else{
            [monthArray addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    
    //空白
    for (int i = 0; i <= trueEndEmpty; i ++) {
        [monthArray addObject:@""];
    }
    
    collection.height = CELLH * collectionRows;
    lineLab.y = CGRectGetMaxY(collection.frame);
    RClistTableView.y = CGRectGetMaxY(lineLab.frame);
}

#pragma UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return monthArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString * stringID = [NSString stringWithFormat:@"CookingEquipmentCellId%ld",indexPath.row];
    
    CurrentMonthCell *cell = [CurrentMonthCell cellWithTableview:collectionView Identifier:stringID cellForItemAtIndexPath:indexPath];
    
    [cell.cellBtn setTitle:monthArray[indexPath.row] forState:UIControlStateNormal];
    
    //如果日期是今天
    if (isCurrentYear == YES && isCurrentMonth == YES && [cell.cellBtn.titleLabel.text isEqualToString:[RLTool getToday]]) {
        cell.cellBtn.backgroundColor = ZCColor(237, 113, 97, 1);
    }
    
    
    
    
    //如果日期过期事务
    if (isCurrentYear == YES && isCurrentMonth == YES && [cell.cellBtn.titleLabel.text isEqualToString:@"12"] && 12 <
        [[RLTool getToday] intValue]) {
        cell.cellBtn.backgroundColor = ZCColor(0, 188, 212, 1);
    }
    
    
    //如果日期待办事务
    if (isCurrentYear == YES && isCurrentMonth == YES && [cell.cellBtn.titleLabel.text isEqualToString:@"30"] && 30 >
        [[RLTool getToday] intValue]) {
        cell.cellBtn.backgroundColor = ZCColor(139, 195, 74, 1);
    }
    
    
    
    
    
    
    //当前月份日期外区域不可点击
    if (indexPath.row <= 6 + fristDayInMonthIsWeak - 1 || indexPath.row >= monthCount + 6 + fristDayInMonthIsWeak) {
        cell.cellBtn.enabled = NO;
    }
    
    //周六周日显示的颜色
    if (indexPath.row % 7 == 0 || (indexPath.row + 1) % 7 == 0) {
        [cell.cellBtn setTitleColor:ZCColor(29, 137, 207, 1) forState:UIControlStateNormal];
    }
    
    
    return cell;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

#pragma currentMonthTitleViewDelegate

-(void)CurrentMonthTitleViewDelegate:(CurrentMonthTitleView *)currentMonthTitleView{
    
    YMonthViewController *yMonth = [[YMonthViewController alloc] init];
    
    __weak typeof(self) weakSelf = self;
    
    [yMonth backYYMM:^(NSString *year,NSString *month) {
        
        //改变题目年月份
        [currentMonthTitleView.titleBtn setTitle:[NSString stringWithFormat:@"%@年%@月",year,month] forState:UIControlStateNormal];
        
        //获取返回日期信息
        NSDate *date = [RLTool strToDateWothStrYear:year strMonth:month];
        isCurrentYear = [RLTool isCurrentYear:year];
        isCurrentMonth = [RLTool isCurrentMonth:month];
        monthCount = [RLTool getNumberOfDaysInMonth:date];
        fristDayInMonthIsWeak = [[RLTool getweekDayWithDate:date] intValue];
        
        //发出通知给CurrentMonthCell改变设置
        [ZCNotificationCenter postNotificationName:RLReturnRefreshRCNotification object:nil];
        
        //刷新数据
        [monthArray removeAllObjects];
        [weakSelf setMonthDate];
        [collection reloadData];
    }];
    
    
    [self.navigationController pushViewController:yMonth animated:YES];
}


#pragma UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 5;
   
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        RCTableViewCell *cell = [RCTableViewCell cellWithTableview:tableView];
        
        return cell;
  
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    }





@end
