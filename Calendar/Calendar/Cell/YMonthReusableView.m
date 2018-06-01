//
//  ServerCollectionReusableView.m
//  Entrepreneurs
//
//  Created by MXL on 2017/3/2.
//  Copyright © 2017年 MXL. All rights reserved.
//

#import "YMonthReusableView.h"

@implementation YMonthReusableView
-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.titleLab];
    }
    return self;
}

-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, AdapterY(5), SCREENWIDTH, self.height-AdapterY(10))];
        _titleLab.font = AdapterFontSize(20);
        [_titleLab setTextColor:ZCColor(42, 50, 69, 1)];
        _titleLab.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLab;
}

@end
