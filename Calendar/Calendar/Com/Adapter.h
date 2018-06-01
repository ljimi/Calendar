//
//  AdaptiveFrame.h
//  frame
//
//  Created by mxl on 2017/1/17.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//屏幕
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

//字体
#define AdapterFontSize(a) [Adapter setFontSize:a]

//适配
#define AdapterFrame(x,y,w,h)  [Adapter setFrame:CGRectMake(x,y,w,h)]
#define AdapterSize(w,h)  [Adapter setSize:CGSizeMake(w,h)]
#define AdapterX(x)  [Adapter setFloatX:x]
#define AdapterY(y)  [Adapter setFloatY:y]

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
