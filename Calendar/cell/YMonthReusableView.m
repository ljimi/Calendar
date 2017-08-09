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
        _titleLab = [UILabel addLabWithFontSize:AdapterFontSize(20) color:ZCColor(42, 50, 69, 1) textAlignment:NSTextAlignmentCenter];
        _titleLab.frame = CGRectMake(0, AdapterY(5), SCREENWIDTH, self.height-AdapterY(10));
        [self addSubview:_titleLab];
    }
    return self;
}
@end
