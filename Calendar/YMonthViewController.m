//
//  YYRLViewController.m
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "YMonthViewController.h"
#import "YMonthCell.h"
#import "YMonthReusableView.h"
#define sectionH AdapterY(45)

@interface YMonthViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *YMonthArray;
    UICollectionView *collection;
}

@end

@implementation YMonthViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"日历";
    
    YMonthArray = @[@"2017年",@"2018年",@"2019年"];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UICollectionViewFlowLayout *serverLayout=[[UICollectionViewFlowLayout alloc]init];
    serverLayout.itemSize = CGSizeMake((SCREENWIDTH - AdapterX(20))/3, (SCREENWIDTH)/3 + AdapterX(10));
    serverLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    collection = [[UICollectionView alloc] initWithFrame: CGRectMake(AdapterX(5), 0, SCREENWIDTH-AdapterX(10), SCREENHEIGHT) collectionViewLayout:serverLayout];
    collection.backgroundColor = [UIColor whiteColor];
    collection.dataSource = self;
    collection.delegate = self;
    collection.bounces = NO;
    collection.showsVerticalScrollIndicator = NO;
    [self.view addSubview:collection];
    

    [collection registerClass:[YMonthCell class] forCellWithReuseIdentifier:@"stringgID"];
    
    [collection registerClass:[YMonthReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeader"];
   
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController  setNavigationBarHidden:NO animated:YES];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  YMonthArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    YMonthCell *cell = [YMonthCell cellWithTableview:collectionView Identifier:@"stringgID" cellForItemAtIndexPath:indexPath];

    //如果日期是当月
    NSString *strYear = [YMonthArray[indexPath.section] substringToIndex:4];
    NSString *strMonth = [NSString stringWithFormat:@"%ld",(long)indexPath.row + 1];
    if ([RLTool isCurrentYear:strYear] && [RLTool isCurrentMonth:strMonth]) {
        cell.titleLab.textColor = ZCColor(139, 195, 74, 1);
    }else{
        cell.titleLab.textColor = ZCColor(29, 137, 207, 1);
        
    }
    
    [cell.monthArray removeAllObjects];
    cell.titleLab.text = [NSString stringWithFormat:@"%ld月",(long)indexPath.row + 1];
    cell.date = [RLTool strToDateWothStrYear:strYear strMonth:strMonth];
    
    return cell;
    
}

// 如果不写这个方法 加载view时也不会走设置头部的方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(SCREENWIDTH, sectionH);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    
    YMonthReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"collectionViewHeader"
                                                                                       forIndexPath:indexPath];
    headView.titleLab.text = YMonthArray[indexPath.section];
    
    return headView;
}

-(void)backYYMM:(YYMMblock)block{
    if (block) {
        self.yyddBlock = block;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger MM = indexPath.row + 1;
    NSString *strMonth = [NSString stringWithFormat:@"%ld",(long)MM];
    NSString *strYear = [YMonthArray[indexPath.section] substringToIndex:4];
    
    self.yyddBlock(strYear,strMonth);
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return AdapterX(10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return AdapterY(5);
}



@end
