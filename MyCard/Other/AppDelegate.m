//
//  AppDelegate.m
//  MyCard
//
//  Created by xujiaqi on 15/4/28.
//  Copyright (c) 2015年 xujiaqi. All rights reserved.
//

#import "AppDelegate.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "GesturePasswordController.h"

#import "HomeViewController.h"

static NSString * const kCardStoreName = @"Card.sqlite";

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:kCardStoreName];
    [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelVerbose];

    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    HomeViewController *controller = (HomeViewController *)navigationController.topViewController;
    controller.managedObjectContext = [NSManagedObjectContext defaultContext];
    
    return YES;
}

- (void)copyDefaultStoreIfNeccessary
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *storeURL = [NSPersistentStore MR_urlForStoreName:kCardStoreName];
    
    if (![fileManager fileExistsAtPath:[storeURL path]]) {
        NSString *defaultStorePath = [[NSBundle mainBundle] pathForResource:[kCardStoreName stringByDeletingPathExtension] ofType:[kCardStoreName pathExtension]];
        
        if (defaultStorePath) {
            NSError *error;
            BOOL success = [fileManager copyItemAtPath:defaultStorePath toPath:[storeURL path] error:&error];
            if (!success) {
                DLog(@"file to install default store");
            }
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    self.coverView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.coverView.image = [UIImage imageScreenShotWithView:self.window imageSize:[UIScreen mainScreen].bounds.size];
    
    [self.window addSubview:self.coverView];
    
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    visualEffectView.frame = self.coverView.bounds;
    [self.coverView addSubview:visualEffectView];
}



- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
//      进入前台移除视图
    if (self.coverView)
    {
        [self.coverView removeFromSuperview];
        self.coverView = nil;
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
//    [MagicalRecord cleanUp];
}

#pragma mark - other 手势密码

/***************** 区分解锁和锁住 ******************/

//// call back
//static void displayStatusChanged(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
//{
//    // the "com.apple.springboard.lockcomplete" notification will always come after the "com.apple.springboard.lockstate" notification
//    CFStringRef nameCFString = (CFStringRef)name;
//    NSString *lockState = (__bridge NSString*)nameCFString;
//    
//    if ([lockState isEqualToString:@"com.apple.springboard.lockcomplete"])
//    {
//        //Locked
//    }
//    else
//    {
//        //Unlocked
//        [((AppDelegate *)[[UIApplication sharedApplication] delegate]) needGesUnlock];
//        
//        GetAPPDelegate.shouldlockStatus = YES;
//    }
//}
//
//- (void)registerforDeviceLockNotif
//{
//    //Screen lock notifications
//    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
//                                    NULL, // observer
//                                    displayStatusChanged, // callback
//                                    CFSTR("com.apple.springboard.lockcomplete"), // event name
//                                    NULL, // object
//                                    CFNotificationSuspensionBehaviorDeliverImmediately);
//    
//    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), //center
//                                    NULL, // observer
//                                    displayStatusChanged, // callback
//                                    CFSTR("com.apple.springboard.lockstate"), // event name
//                                    NULL, // object
//                                    CFNotificationSuspensionBehaviorDeliverImmediately);
//}

/**************** 区分解锁和锁住 *****************/

@end
