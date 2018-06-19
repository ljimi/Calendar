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

@interface YMonthViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong) UICollectionView *collection;
@property(nonatomic, strong) NSMutableArray *YMonthArray;
@end

@implementation YMonthViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController  setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"日历";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collection];
    
    [self setOffset];
}

-(void)setOffset{
    
    //年份日历四行cell加head的高
    CGFloat Yheight = (((SCREENWIDTH)/3 + AdapterX(10)) * 4 + AdapterY(45));
    
    self.collection.contentSize = CGSizeMake(SCREENWIDTH, Yheight * self.YMonthArray.count);
    
    for (int i = 0; i < self.YMonthArray.count; i ++) {
        if ([self.insetYear isEqualToString:self.YMonthArray[i]]) {
            self.collection.contentOffset = CGPointMake(0, Yheight * i);
        }
    }
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  self.YMonthArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 12;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YMonthCell *cell = [YMonthCell cellWithCollectionView:collectionView Identifier:NSStringFromClass([YMonthCell class]) cellForItemAtIndexPath:indexPath];
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    YMonthCell *rcell = (YMonthCell *)cell;
    rcell.strYear = [self.YMonthArray[indexPath.section] substringToIndex:4];
    rcell.indexPath = indexPath;
}

// 如果不写这个方法 加载view时也不会走设置头部的方法
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SCREENWIDTH, AdapterY(45));
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader){
        YMonthReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([YMonthReusableView class])forIndexPath:indexPath];
        headView.titleLab.text = self.YMonthArray[indexPath.section];
        return headView;
    }
    return nil;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger MM = indexPath.row + 1;
    NSString *strMonth = [NSString stringWithFormat:@"%ld",(long)MM];
    NSString *strYear = [self.YMonthArray[indexPath.section] substringToIndex:4];
    self.yyddBlock(strYear,strMonth);
    [self.navigationController popViewControllerAnimated:YES];

}
//设置每组的cell的边界
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(UICollectionView *)collection{
    if (!_collection) {
        UICollectionViewFlowLayout *serverLayout=[[UICollectionViewFlowLayout alloc]init];
        serverLayout.itemSize = CGSizeMake((SCREENWIDTH - AdapterX(40))/3, (SCREENWIDTH)/3 + AdapterX(10));
        serverLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collection = [[UICollectionView alloc] initWithFrame: CGRectMake(AdapterX(5), 0, SCREENWIDTH-AdapterX(10), SCREENHEIGHT) collectionViewLayout:serverLayout];
        _collection.backgroundColor = [UIColor whiteColor];
        _collection.dataSource = self;
        _collection.delegate = self;
        _collection.bounces = NO;
        _collection.showsVerticalScrollIndicator = NO;
        [_collection registerClass:[YMonthCell class] forCellWithReuseIdentifier:NSStringFromClass([YMonthCell class])];
        [_collection registerClass:[YMonthReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([YMonthReusableView class])];
    }
    return _collection;
}

-(NSMutableArray *)YMonthArray{
    if (!_YMonthArray) {
        _YMonthArray = [NSMutableArray array];
        
       int year = [[[RLTool getDate] substringToIndex:4] intValue] - 1;
        for (int i = 0; i < 9; i ++) {
            NSString *yearStr = [NSString stringWithFormat:@"%d%@",year,@"年"];
            [_YMonthArray addObject:yearStr];
            year ++;
        }
    }
    return _YMonthArray;
}

@end
