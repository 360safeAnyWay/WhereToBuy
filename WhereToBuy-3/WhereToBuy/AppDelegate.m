//
//  AppDelegate.m
//  WhereToBuy
//
//  Created by JingMo 04 on 15-1-4.
//  Copyright (c) 2015年 JingMo. All rights reserved.
//

#import "AppDelegate.h"
#import "SelectCityViewController.h"
#import "MainViewController.h"
#import "Constants.h"
#import "PatternViewController.h"
#import <math.h>
#import "APService.h"

#define kCurrentPattern												@"KeyForCurrentPatternToUnlock"
#define kCurrentPatternTemp										@"KeyForCurrentPatternToUnlockTemp"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setBackgroundColor:[UIColor blackColor]];
    NSString *firstTime = [[NSUserDefaults standardUserDefaults] objectForKey:@"firstTime"];//是否第一次进入软件
    if (firstTime == nil) {
        SelectCityViewController *selectCity = [[SelectCityViewController alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:selectCity];
        self.window.rootViewController = nav;
    }else
    {
        
        // Circle Menu
        MainViewController *circleMenuViewController = [[MainViewController alloc] initWithButtonCount:kKYCCircleMenuButtonsCount
                                                                                              menuSize:kKYCircleMenuSize
                                                                                            buttonSize:kKYCircleMenuButtonSize
                                                                                 buttonImageNameFormat:kKYICircleMenuButtonImageNameFormat
                                                                                      centerButtonSize:kKYCircleMenuCenterButtonSize
                                                                                 centerButtonImageName:kKYICircleMenuCenterButton
                                                                       centerButtonBackgroundImageName:kKYICircleMenuCenterButtonBackground];
        // Set navigation controller as the root vc
        [self.window setRootViewController:circleMenuViewController];
    }
    [self.window makeKeyAndVisible];
    
    // Required
    #if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
            //categories
            [APService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                 UIUserNotificationTypeSound |
                                                 UIUserNotificationTypeAlert)
             categories:nil];
        } else {
            //categories nil
            [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                 UIRemoteNotificationTypeSound |
                                                 UIRemoteNotificationTypeAlert)
#else
             //categories nil
             categories:nil];
            [APService
             registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                 UIRemoteNotificationTypeSound |
                                                 UIRemoteNotificationTypeAlert)
#endif
             // Required
             categories:nil];
        }
    [APService setupWithOption:launchOptions];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    BOOL isPatternSet = ([[NSUserDefaults standardUserDefaults] valueForKey:kCurrentPattern]) ? YES: NO;
//    if(self.window.rootViewController.presentingViewController == nil){
//        PatternViewController *lockVc = [[PatternViewController alloc]init];
//        if (isPatternSet) {
//            lockVc.infoLabelStatus = InfoStatusNormal;
//        }else
//        {
//            lockVc.infoLabelStatus = InfoStatusFirstTimeSetting;
//        }
//        [self.window.rootViewController presentViewController:lockVc animated:YES completion:^{
//            
//        }];
//    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Required
    [APService registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Required
    NSLog(@"传递得信息%@",userInfo);
    [APService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    //ios7 required
    [APService handleRemoteNotification:userInfo];
    completionHandler(UIBackgroundFetchResultNewData);
}

@end
