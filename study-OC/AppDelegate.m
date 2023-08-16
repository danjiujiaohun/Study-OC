//
//  AppDelegate.m
//  study-OC
//
//  Created by 梁江斌 on 2023/7/27.
//

#import "AppDelegate.h"
#import "mainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
//    self.window.backgroundColor = UIColor.whiteColor;
    [self.window setBackgroundColor:UIColor.whiteColor];
    
//    RootViewController *rootVC = [[RootViewController alloc] init];
    mainViewController *mainVC = [[mainViewController alloc] init];
    UINavigationController *naviVC = [[UINavigationController alloc] initWithRootViewController: mainVC];
    
    
//    self.window.rootViewController = rootVC;
    [self.window setRootViewController:naviVC];
    
//    self.window.makeKeyAndVisible;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
