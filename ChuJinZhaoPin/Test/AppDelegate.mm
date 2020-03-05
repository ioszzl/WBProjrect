//
//  AppDelegate.m
//  TestDemo
//
//  Created by 孙若淮 on 14/03/2018.
//  Copyright © 2018 Monster. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "BaseNavigationController.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "AFNetworkReachabilityManager.h"
#import <IQKeyboardManager.h>

#import <UMShare/UMSocialManager.h>
#import "AppDelegate+ThirdConfig.h"
@interface AppDelegate ()
@property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, assign) double lastTime;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) UILabel *fpsLab;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.netWorkState = YES;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
#if DEBUG
//    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
//    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
//    self.fpsLab = [UILabel ym_labelWithFrame:CGRectMake(10, kNavBarHeight+10, 40, 20) font:[UIFont systemFontOfSize:10] textColor:[UIColor greenColor] textAlignment:NSTextAlignmentCenter];
//    self.fpsLab.backgroundColor = RGBACOLOR(255, 0, 0, 0.5);
//    [self.window addSubview:self.fpsLab];
#endif
    
    [self thirdConfig];
    
    
    self.userModel = [UserModel mj_objectWithKeyValues:[DefaultsGetObject(KEY_USER_DATA) mj_keyValues]];
    self.token = DefaultsGetObject(KEY_TOKEN);
    
    MainTabBarController *vc = [MainTabBarController new];
    self.window.rootViewController = vc;
    
    
    
    
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    
    [self networkMonitoring];
    
    return YES;
}

-(void)tick:(CADisplayLink *)link{
    if (self.lastTime == 0) {
        self.lastTime = link.timestamp;
        return;
    }
    
    self.count += 1;
    NSTimeInterval delta = link.timestamp - self.lastTime;
    //NSLog(@"%lf---%lf",link.timestamp,self.lastTime);
    if (delta >= 1) {
        self.lastTime = link.timestamp;
        
        float fps = self.count/delta;
        self.count = 0;
        
        //NSLog(@"FPS：%f",fps);
        self.fpsLab.text = [NSString stringWithFormat:@"%.2f",fps];
        [self.window bringSubviewToFront:self.fpsLab];
    }
    
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSLog(@"--openURL-");
    
    //友盟
    BOOL flag = [[UMSocialManager defaultManager] handleOpenURL:url options:options];
    if (!flag) {
        // 其他如支付等SDK的回调
    }
    return flag;
    
    return YES;
}

#pragma mark - 网络监测
- (void)networkMonitoring
{
    
    AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
    [netManager startMonitoring];  //开始监听
    [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        
        if (status == AFNetworkReachabilityStatusNotReachable)
        {
            //showAlert
            self.netWorkState = NO;
            NSLog(@"没有网络");
            
            return;
            
        }else if (status == AFNetworkReachabilityStatusUnknown){
            self.netWorkState = YES;
            NSLog(@"未知网络");
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWWAN){
            self.netWorkState = YES;
            NSLog(@"WiFi");
            
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi){
            self.netWorkState = YES;
            NSLog(@"手机网络");
        }
        
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)closeAllPresentedViewControllers {
    
    
    
    if (![self.window.rootViewController isKindOfClass:[MainTabBarController class]]) {
        
        return;
        
    }
    
    MainTabBarController *mainVC = (MainTabBarController *)self.window.rootViewController;
    
    BaseNavigationController *currentNav = mainVC.viewControllers[mainVC.selectedIndex];
    
    UIViewController *currentVC = currentNav.topViewController;
    
    
    
    //第一部分 导航控制器的顶部控制器弹出的模态
    
    UIViewController *vcPresentVC = currentVC.presentedViewController;
    
    if (vcPresentVC) {
        
        while (vcPresentVC.presentedViewController)  {
            
            vcPresentVC = vcPresentVC.presentedViewController;
            
        }
        
        [vcPresentVC dismissViewControllerAnimated:NO completion:nil];
        
    }
    
    
    //第二部分 导航控制器弹出的模态
    
    UIViewController *navPresentVC = currentNav.presentedViewController;
    
    if (navPresentVC) {
        
        while (navPresentVC.presentedViewController)  {
            
            navPresentVC = navPresentVC.presentedViewController;
            
        }
        
        [navPresentVC dismissViewControllerAnimated:NO completion:nil];
        
    }
    
    
    //第三部分 tab控制器弹出的模态
    
    UIViewController *tabPresentVC = mainVC.presentedViewController;
    
    if (tabPresentVC) {
        
        while (tabPresentVC.presentedViewController)  {
            
            tabPresentVC = tabPresentVC.presentedViewController;
            
        }
        
        [tabPresentVC dismissViewControllerAnimated:NO completion:nil];
        
    }
    
}

@end
