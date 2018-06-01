//
//  AdaptiveFrame.m
//  frame
//
//  Created by mal on 2017/1/17.
//  Copyright © 2017年 mal. All rights reserved.
//

#import "Adapter.h"

//以iPhone6为适配基础
#define HEIGHTSCALE [UIScreen mainScreen].bounds.size.height/667
#define WIDTHSCALE [UIScreen mainScreen].bounds.size.width/375
@implementation Adapter

+ (UIFont *) setFontSize:(int)fontSize {
    UIFont * newFont = [UIFont systemFontOfSize:fontSize * WIDTHSCALE];
    return newFont;
}

+ (CGRect) setFrame:(CGRect)rect {
    CGRect newRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width * WIDTHSCALE, rect.size.height * HEIGHTSCALE);
    return newRect;
}

+ (CGSize) setSize:(CGSize)size{
    CGSize newSize = CGSizeMake(size.width * WIDTHSCALE,size.height * HEIGHTSCALE);
    return newSize;
}


+ (CGFloat) setFloatX:(CGFloat)floatX{
   CGFloat newFloatX = WIDTHSCALE * floatX;
    return newFloatX;
}

+ (CGFloat) setFloatY:(CGFloat)floatY{
    CGFloat newFloatY = HEIGHTSCALE * floatY;
    return newFloatY;
}
@end
