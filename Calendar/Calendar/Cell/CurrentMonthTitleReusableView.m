//
//  CurrentMonthTitleReusableView.m
//  Calendar
//
//  Created by Sunror on 2018/5/31.
//  Copyright © 2018年 MXL. All rights reserved.
//

#import "CurrentMonthTitleReusableView.h"

@implementation CurrentMonthTitleReusableView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUI];
    }
    return self;
}

-(void)setUI{
    [self addSubview:self.titleBtn];
}

-(UIButton *)titleBtn{
    if (!_titleBtn) {
        _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _titleBtn.frame = CGRectMake(SCREENWIDTH/4, 0, SCREENWIDTH/2, self.height);
        [_titleBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleBtn;
}


@end
