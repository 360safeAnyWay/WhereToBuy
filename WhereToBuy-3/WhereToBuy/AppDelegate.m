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
#import "LeafNotification.h"
#import "WeiboSDK.h"
#define kCurrentPattern						    @"KeyForCurrentPatternToUnlock"
#define kCurrentPatternTemp						@"KeyForCurrentPatternToUnlockTemp"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [application setStatusBarHidden:NO];
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
        MainViewController *circleMenuViewController = [[MainViewController alloc] init];
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
    [APService setAlias:@"yangwenjun1" callbackSelector:nil object:nil];
    [APService setupWithOption:launchOptions];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    [defaultCenter addObserver:self selector:@selector(networkDidReceiveMessage:) name:kJPFNetworkDidReceiveMessageNotification object:nil];
    [UIView setAnimationDuration:0.0f];
    //做开机启动动画
    _imageView = [[UIImageView alloc] initWithFrame:self.window.bounds];
    [_imageView setImage:[UIImage imageNamed:@"initAnimate.png"]];
    [self.window addSubview:_imageView];
    [self.window bringSubviewToFront:_imageView];
    //logo动画
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(0, 220, 193, 53)];
    [logo setImage:[UIImage imageNamed:@"initLogo.png"]];
    [logo setCenter:CGPointMake(self.window.center.x, logo.center.y)];
    [logo setAlpha:0.0f];
    [_imageView addSubview:logo];
    //那一行字
    UIImageView *serve = [[UIImageView alloc] initWithFrame:CGRectMake(0, 568, 169, 15)];
    [serve setImage:[UIImage imageNamed:@"initLogoName.png"]];
    [serve setCenter:CGPointMake(self.window.center.x, serve.center.y)];
    [_imageView addSubview:serve];
    
    //开始动画
    [UIView animateWithDuration:1.0f animations:^{
        [logo setAlpha:1.0f];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            [serve setCenter:CGPointMake(logo.center.x, logo.center.y + logo.frame.size.height /2 + 20)];
        } completion:^(BOOL finished) {
            [NSThread sleepForTimeInterval:1.0f];
            [UIView animateWithDuration:1.0f animations:^{
                [_imageView setAlpha:0.0f];
                [logo setAlpha:0.0f];
                [serve setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [_imageView removeFromSuperview];
                
            }];
        }];
    }];
    [ShareSDK registerApp:@"64dbbd6e67b6"];//字符串api20为您的ShareSDK的AppKey
    
    [ShareSDK connectSinaWeiboWithAppKey:@"4118636406"appSecret:@"3a78cbfcf7a5555a3070ab3ff2187bce"
                             redirectUri:@"http://www.mainaer.net"];

    [ShareSDK connectWeChatSessionWithAppId: @"wx2136f96bda0598c6"
                                  appSecret: @"e61745800e5887253e6af842ec575d3f"
                                  wechatCls: [WXApi class]];
    
    [ShareSDK connectWeChatTimelineWithAppId: @"wx2136f96bda0598c6"
                                   appSecret: @"e61745800e5887253e6af842ec575d3f"
                                   wechatCls: [WXApi class]];
    NSLog(@"--------%d",[self validateNumber:@"15239870768"]);
    
//        UIImage * image = [[UIImage alloc]init];
//        image = [UIImage imageNamed:@"leftBack.png"];
//        NSData *data = UIImageJPEGRepresentation(image, 0.7);

    return YES;
}
- (BOOL)application:(UIApplication *)application
      handleOpenURL:(NSURL *)url
{
    return [ShareSDK handleOpenURL:url
            wxDelegate:self];
}

- (BOOL)application:(UIApplication *)application
openURL:(NSURL *)url
sourceApplication:(NSString *)sourceApplication
annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url
            sourceApplication:sourceApplication
            annotation:annotation
            wxDelegate:self];
}
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    return YES;
}

- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    NSString *content = [userInfo valueForKey:@"content"]; //推送显示的内容
    NSLog(@"获取到的内容是%@",content);
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
    
    [APService handleRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    //ios7 required
    // 取得 APNs 标准信息内容
    NSDictionary *aps = [userInfo valueForKey:@"aps"];
    NSString *content = [aps valueForKey:@"alert"]; //推送显示的内容
    NSInteger badge = [[aps valueForKey:@"badge"] integerValue]; //badge数量
    NSString *sound = [aps valueForKey:@"sound"]; //播放的声音
    // 取得自定义字段内容
    NSString *customizeField1 = [userInfo valueForKey:@"customizeField1"]; //自定义参数，key是自己定义的
    NSLog(@"content =[%@], badge=[%ld], sound=[%@], customize field  =[%@]",content,(long)badge,sound,customizeField1);
    [APService handleRemoteNotification:userInfo];
    [LeafNotification showInController:self.window.rootViewController withText:content type:LeafNotificationTypeWarrning];
    completionHandler(UIBackgroundFetchResultNewData);
}
-(BOOL)validateNumber:(NSString *)textString
{
    NSString * number = @"^1|3|4|5|7|8|[0-9]\\d{8}$";
    NSPredicate * numberPre = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",number];
    return [numberPre evaluateWithObject:textString];
}

@end
