//
//  UILabel+Extension.h
//  ZhiChuangGC
//
//  Created by Mac on 17/4/20.
//  Copyright © 2017年 ZC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)


+(instancetype)addLabWithFontSize:(UIFont *)fontSize
                            color:(UIColor *)color
                    textAlignment:(NSTextAlignment)textAlignment;

+(instancetype)addLabWithText:(NSString *)text
                     fontSize:(UIFont *)fontSize
                        color:(UIColor *)color
                textAlignment:(NSTextAlignment)textAlignment;

+(instancetype)addLabWithFontSize:(UIFont *)fontSize
                            color:(UIColor *)color;
@end
