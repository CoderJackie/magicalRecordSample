//
//  UIButton+EnlargeEdge.h
//  PinMall
//
//  Created by xujiaqi on 14/12/26.
//  Copyright (c) 2014年 365sji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIButton (EnlargeEdge)
- (void)setEnlargeEdge:(CGFloat) size;
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;
@end
