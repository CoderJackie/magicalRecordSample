//
//  SuperVC.h
//  YueDian
//
//  Created by xiao on 15/3/5.
//  Copyright (c) 2015年 xiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperVC : UIViewController

@property (nonatomic, strong) NSMutableArray *networkOperations;

- (void)backToSuperView;//返回上一层
//自定义右边导航按钮
+ (UIBarButtonItem *)rightBarButtonWithName:(NSString *)name imageName:(NSString*)imageName titleColor:(UIColor *)color target:(id)target action:(SEL)action;
+ (UIBarButtonItem *)rightBarButtonWithName:(NSString *)name imageNormal:(NSString*)imageN imageHlight:(NSString*)imageH target:(id)target action:(SEL)action;

- (UIBarButtonItem *)barBackButton;
- (UIBarButtonItem *)barBackButtonNew;

- (UIBarButtonItem *)barLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)color;

/**
 *  隐藏导航栏
 */
- (void)hideNavigationBar:(BOOL)flag;

@end
