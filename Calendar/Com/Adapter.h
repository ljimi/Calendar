//
//  AdaptiveFrame.h
//  frame
//
//  Created by mxl on 2017/1/17.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Adapter : NSObject

/**
约束的时候不能对屏宽和屏高进行约束，因为二者是自适应的，二次约束冲突。
 */

//字体
+ (UIFont *) setFontSize:(int)fontSize;
//frame
+ (CGRect) setFrame:(CGRect)rect;
//size
+ (CGSize) setSize:(CGSize)size;
//纵轴尺寸
+ (CGFloat) setFloatY:(CGFloat)floatY;
//横轴尺寸
+ (CGFloat) setFloatX:(CGFloat)floatX;
    
@end
