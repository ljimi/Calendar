//
//  RL_Cell.m
//  日历test
//
//  Created by Mac on 17/4/17.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "CurrentMonthCell.h"

@implementation CurrentMonthCell



+(instancetype)cellWithTableview:(UICollectionView *)collectionView Identifier:(NSString *)index cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CurrentMonthCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:index forIndexPath:indexPath];
    if (!cell) {
        cell = [[CurrentMonthCell alloc] init];
    }
    return cell;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setUp];
        
    }
    return self;
}


-(void)setUp{

    self.contentView.layer.borderWidth = 0.27;
    self.contentView.layer.borderColor = [UIColor grayColor].CGColor;
   
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    _cellBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cellBtn.frame = CGRectMake(self.contentView.width/2-AdapterX(11), self.contentView.height/2-AdapterX(11), AdapterX(22), AdapterX(22));
    _cellBtn.layer.masksToBounds = YES;
    _cellBtn.layer.cornerRadius = AdapterX(11);
    _cellBtn.titleLabel.font = AdapterFontSize(12);
    [_cellBtn setTitleColor:ZCColor(42, 50, 69, 1) forState:UIControlStateNormal];
    [_cellBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_cellBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_cellBtn];
    
    [ZCNotificationCenter addObserver:self selector:@selector(notifica:) name:RLReturnRefreshRCNotification object:nil];
}

-(void)notifica:(NSNotification *)notification{
    
    _cellBtn.enabled = YES;
    _cellBtn.selected = NO;
    _cellBtn.backgroundColor = [UIColor whiteColor];
    
}

-(void)dealloc{
    
    [ZCNotificationCenter removeObserver:self];
    
}

-(void)click:(UIButton *)sender{
    sender.selected = !sender.selected;
    
    if (sender.selected == YES && sender.backgroundColor != [UIColor redColor]) {
        sender.titleLabel.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        sender.backgroundColor = [UIColor blueColor];
    }else if(sender.selected == NO && sender.backgroundColor != [UIColor redColor]){
        sender.titleLabel.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0];
        sender.backgroundColor = [UIColor whiteColor];
    }
}
@end
