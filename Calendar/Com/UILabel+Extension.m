//
//  UILabel+Extension.m
//  ZhiChuangGC
//
//  Created by Mac on 17/4/20.
//  Copyright © 2017年 ZC. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)


+(instancetype)addLabWithFontSize:(UIFont *)fontSize
                            color:(UIColor *)color
                    textAlignment:(NSTextAlignment)textAlignment{
    UILabel *lab = [[UILabel alloc] init];
    [lab setTextColor:color];
    lab.font = fontSize;
    lab.textAlignment = textAlignment;
    return lab;
}


+(instancetype)addLabWithText:(NSString *)text
                     fontSize:(UIFont *)fontSize
                        color:(UIColor *)color
                textAlignment:(NSTextAlignment)textAlignment{
    UILabel *lab = [[UILabel alloc] init];
    lab.text = text;
    [lab setTextColor:color];
    lab.font = fontSize;
    lab.textAlignment = textAlignment;
    return lab;
}


+(instancetype)addLabWithFontSize:(UIFont *)fontSize
                        color:(UIColor *)color{
    UILabel *lab = [[UILabel alloc] init];
    [lab setTextColor:color];
    lab.font = fontSize;
    return lab;
}


@end
