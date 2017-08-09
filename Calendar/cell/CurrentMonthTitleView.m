//
//  CurrentMonthTitleView.m
//  日历test
//
//  Created by Mac on 17/4/18.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "CurrentMonthTitleView.h"

@implementation CurrentMonthTitleView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setUI];
    }
    return self;
}

-(void)setUI{
    
    _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _titleBtn.frame = CGRectMake(SCREENWIDTH/4, 0, SCREENWIDTH/2, self.height);
    [_titleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    _titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [_titleBtn addTarget:self action:@selector(goToYearly:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_titleBtn];
    
}

-(void)goToYearly:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(CurrentMonthTitleViewDelegate:)]) {
        [self.delegate CurrentMonthTitleViewDelegate:self];
    }
    
}
@end
