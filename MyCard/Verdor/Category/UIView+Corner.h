//
//  UIView+Corner.h
//  ZQB
//
//  Created by YangXu on 14-7-22.
//
//  设置圆角

#import <UIKit/UIKit.h>

@interface UIView (Corner)

- (void)setRoundingCornerWithCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

@end
