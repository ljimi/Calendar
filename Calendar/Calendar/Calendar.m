//
//  Calendar.m
//  Calendar
//
//  Created by Sunror on 2018/5/31.
//  Copyright © 2018年 MXL. All rights reserved.
//

#import "Calendar.h"
#import "CurrentMonthTitleReusableView.h"
#import "CurrentMonthCell.h"
#import "YMonthViewController.h"

@implementation Calendar

-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

-(void)updata{
    //刷新数据
    [_collection.monthArray removeAllObjects];
    [_collection setMonthDate];
}

-(void)goToYearly:(UIButton *)sender{
    
    YMonthViewController *yMonth = [YMonthViewController new];
    yMonth.insetYear = [[self.collection.currentDate substringToIndex:4] stringByAppendingString:@"年"];
    
    WeakSelf
    yMonth.yyddBlock = ^(NSString *year, NSString *month) {
        
        //获取返回日期信息
        NSDate *date = [RLTool strToDateWothStrYear:year strMonth:month];
        
        weakSelf.collection.currentDate = [NSString stringWithFormat:@"%@年%@月",year,month];
        weakSelf.collection.isCurrentYear = [RLTool isCurrentYear:year];
        weakSelf.collection.isCurrentMonth = [RLTool isCurrentMonth:month];
        weakSelf.collection.monthCount = [RLTool getNumberOfDaysInMonth:date];
        weakSelf.collection.fristDayInMonthIsWeak = [[RLTool getweekDayWithDate:date] intValue];
        
        //发出通知给CurrentMonthCell改变设置
        [ZCNotificationCenter postNotificationName:RLReturnRefreshRCNotification object:nil];
        
        [weakSelf updata];
    };
    
    [[self getCurrentVC].navigationController pushViewController:yMonth animated:YES];
}



#pragma UI_collectionViewDelegate,UI_collectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _collection.monthArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CurrentMonthCell *cell = [CurrentMonthCell cellWithCollectionView:collectionView Identifier:[NSString stringWithFormat:@"CookingEquipmentCellId%ld",(long)indexPath.row] cellForItemAtIndexPath:indexPath];
    cell.isCurrentYear = _collection.isCurrentYear;
    cell.isCurrentMonth = _collection.isCurrentMonth;
    cell.monthCount = _collection.monthCount;
    cell.fristDayInMonthIsWeak = _collection.fristDayInMonthIsWeak;
    cell.row = indexPath.row;
    cell.title = _collection.monthArray[indexPath.row];
    WeakSelf
    cell.isSelectedBlock = ^(BOOL isSelected) {
        if (isSelected) {
       NSString *data =[NSString stringWithFormat:@"%@%@日",weakSelf.collection.currentDate,_collection.monthArray[indexPath.row]];
       weakSelf.backDataBlock(data);
        }else{
       weakSelf.backDataBlock(@"");
        }
    };
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREENWIDTH, AdapterY(30));
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader){
        CurrentMonthTitleReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([CurrentMonthTitleReusableView class])forIndexPath:indexPath];
        [headView.titleBtn addTarget:self action:@selector(goToYearly:) forControlEvents:UIControlEventTouchUpInside];
        [headView.titleBtn setTitle:_collection.currentDate forState:UIControlStateNormal];
        return headView;
    }
    return nil;
}

//设置每组的cell的边界
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionView*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _layout;
}


@end
