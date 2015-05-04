//
//  UIView+Addition.m
//  WEIBO-X
//
//  Created by Mctu on 14-1-8.
//  Copyright (c) 2014年 XIAO. All rights reserved.
//

#import "UIView+Addition.h"

@implementation UIView (Addition)

- (UIViewController *)viewController
{
    // 下一
   UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    
    return (UIViewController *)next;
}
@end
