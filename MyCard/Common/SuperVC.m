//
//  SuperVC.m
//  YueDian
//
//  Created by xiao on 15/3/5.
//  Copyright (c) 2015年 xiao. All rights reserved.
//

#import "SuperVC.h"

@interface SuperVC ()

@end

@implementation SuperVC

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (void)viewWillAppear:(BOOL)animated{
    if (ISIOS7)
    {
        if ([UIApplication sharedApplication].statusBarStyle != UIStatusBarStyleLightContent)
        {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }
    }
    self.navigationItem.leftBarButtonItem.customView.userInteractionEnabled = NO;
    self.navigationItem.rightBarButtonItem.customView.userInteractionEnabled = NO;
}

- (void)viewDidAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = YES;
    
    self.navigationItem.leftBarButtonItem.customView.userInteractionEnabled = YES;
    self.navigationItem.rightBarButtonItem.customView.userInteractionEnabled = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.view endEditing:YES];
    if ([self isTabbarRoot]) {
        self.hidesBottomBarWhenPushed = NO;
    }else{
        self.hidesBottomBarWhenPushed = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadViewData];

}

- (void)loadViewData{
    self.view.backgroundColor = UIColorRGB(240, 240, 243);
    if (ISIOS7) {
        self.tabBarController.tabBar.translucent = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    self.navigationItem.leftBarButtonItem = [self isTabbarRoot] ? nil : [self barBackButton];

}

#pragma mark - Private Meathod
- (BOOL)isTabbarRoot
{
    for (UINavigationController* nc in self.tabBarController.viewControllers) {
        if (nc.viewControllers.firstObject == self) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - Creat View Meathod
- (UIBarButtonItem *)barBackButton
{
    UIImage *image = [UIImage imageNamed:@"bar_back_logo"];
    CGRect buttonFrame;
    if (ISIOS7) {
        buttonFrame = CGRectMake(0, 0, image.size.width, image.size.height);
    }else{
        buttonFrame = CGRectMake(0, 0, image.size.width+20, image.size.height);
    }
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(backToSuperView) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateSelected];
    [button setImage:image forState:UIControlStateHighlighted];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 12)];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

- (UIBarButtonItem *)barBackButtonNew
{
    UIImage *image = [UIImage imageNamed:@"chat_return"];
    CGRect buttonFrame;
    if (ISIOS7) {
        buttonFrame = CGRectMake(0, 0, image.size.width, image.size.height);
    }else{
        buttonFrame = CGRectMake(0, 0, image.size.width+20, image.size.height);
    }
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button addTarget:self action:@selector(backToSuperView) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:image forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 12)];
    button.accessibilityLabel = @"back";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}


- (UIBarButtonItem *)barLeftButtonWithTitle:(NSString *)title titleColor:(UIColor *)color;
{
    CGRect buttonFrame;
    if (ISIOS7) {
        buttonFrame = CGRectMake(0, 0, 60, 44);
    }else{
        buttonFrame = CGRectMake(0, 0, 60+20, 44);
    }
    UIButton *button = [[UIButton alloc] initWithFrame:buttonFrame];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [button addTarget:self action:@selector(backToSuperView) forControlEvents:UIControlEventTouchUpInside];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 12)];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 14)];
    button.accessibilityLabel = @"back";
    [button setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return item;
}

#define   IOS7_NAVI_SPACE   40
+ (UIBarButtonItem *)rightBarButtonWithName:(NSString *)name imageName:(NSString*)imageName titleColor:(UIColor *)color target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if (imageName && ![imageName isEqualToString:@""]) {
        UIImage *image = [UIImage imageNamed:imageName];
        [btn setImage:image forState:UIControlStateNormal];
        
        UIImage *imageSelected = [UIImage imageNamed:[NSString stringWithFormat:@"%@_s",imageName]];
        if (imageSelected)
            [btn setImage:imageSelected forState:UIControlStateSelected];
        if (ISIOS7) {
            btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        }else{
            btn.frame = CGRectMake(0, 0, image.size.width+20, image.size.height);
        }
    }else{
        float width = [DataHelper widthWithString:name font:[UIFont systemFontOfSize:18]];
        width = width < 50?50:width;
        btn.frame=CGRectMake(0, 0, width+15, 30);
    }
    
    if (name && ![name isEqualToString:@""]) {
        [btn setTitle:name forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        [btn setTitleColor:color forState:UIControlStateNormal];
        [btn setTitleColor:color forState:UIControlStateHighlighted];
        [btn setTitleColor:color forState:UIControlStateDisabled];
        //        return [[UIBarButtonItem alloc] initWithTitle:name style:UIBarButtonItemStyleDone target:target action:action];
    }
    if(ISIOS7) btn.titleEdgeInsets = UIEdgeInsetsMake(0, 25, 0, -14);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

// begin 张绍裕

// 自定义导航栏右按钮（图片自定义）
+ (UIBarButtonItem *)rightBarButtonWithName:(NSString *)name imageNormal:(NSString*)imageN imageHlight:(NSString*)imageH target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    if (imageN && ![imageN isEqualToString:@""])
    {
        UIImage *image = [UIImage imageNamed:imageN];
        [btn setImage:image forState:UIControlStateNormal];
        
        UIImage *imageSelected = [UIImage imageNamed:imageH];
        if (imageSelected)
        {
            [btn setImage:imageSelected forState:UIControlStateHighlighted];
        }
        
        btn.frame = CGRectMake(0, 0, (ISIOS7 ? image.size.width : image.size.width + 20.0), image.size.height);
    }
    else
    {
        btn.frame = CGRectMake(0, 0, 50, 30);
    }
    
    if (name && ![name isEqualToString:@""])
    {
        [btn setTitle:name forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:18];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.3] forState:UIControlStateDisabled];
    }
    
    if (ISIOS7)
    {
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 13, 0, 0);
    }
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithCustomView:btn];
    return item;
}

/**
 *  隐藏导航栏
 */
- (void)hideNavigationBar:(BOOL)flag
{
    [self.navigationController setNavigationBarHidden:flag];
}


@end
