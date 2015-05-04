//
//  AppDelegate.h
//  MyCard
//
//  Created by xujiaqi on 15/4/28.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class HomeViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIImageView *coverView;
@property (strong, nonatomic) HomeViewController *homeViewController;

@end

