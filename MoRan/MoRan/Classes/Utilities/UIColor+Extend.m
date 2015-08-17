//
//  UIColor+Extend.m
//  MoRan
//
//  Created by 王祖康 on 15/8/14.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "UIColor+Extend.h"

@implementation UIColor(Extend)

//16进制颜色值转RGB
+(UIColor *)getColor:(NSString *)hexColor
{
    unsigned int red;
    unsigned int green;
    unsigned int blue;
    
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}

@end
