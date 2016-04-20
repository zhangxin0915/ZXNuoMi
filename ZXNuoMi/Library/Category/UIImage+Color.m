//
//  UIImage+Color.m
//  ZXNuoMi
//
//  Created by macmini on 16/4/20.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}
@end
