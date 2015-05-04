//
//  UIImage+Tool.m
//  MyCard
//
//  Created by xujiaqi on 15/4/29.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "UIImage+Tool.h"

@implementation UIImage (Tool)

// 使用上下文截图,并使用指定的区域裁剪,模板代码
+ (UIImage *)imageScreenShotWithView:(UIView *)view imageSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
