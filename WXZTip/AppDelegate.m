//
//  AppDelegate.m
//  WXZTip
//
//  Created by wxz on 2017/8/31.
//  Copyright © 2017年 wxz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    self.window.rootViewController = nav;
    // Override point for customization after application launch.
    [self creatShortcutItem];
    [self actionOptions:launchOptions];
    

    return YES;
}
- (void)creatShortcutItem {
    //创建系统风格的icon
    NSMutableArray *items = [[NSMutableArray alloc]init];
    for (int i = 0; i < 6; i ++) {
        UIApplicationShortcutItem * item = [[UIApplicationShortcutItem alloc]initWithType:@"com.yang.share"
                                                                           localizedTitle:@"分享"
                                                                        localizedSubtitle:@"分享副标题"
                                                                                     icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare]
                                                                                 userInfo:nil];
        [items addObject:item];
    }
    
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = items;
}

-(void)actionOptions:(NSDictionary *)launchOptions{
    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (shortcutItem) {
        //判断设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if([shortcutItem.type isEqualToString:@"com.yang.one"]){
            NSLog(@"新启动APP-- 第一个按钮");
        } else if ([shortcutItem.type isEqualToString:@"com.yang.search"]) {
            //进入搜索界面
            NSLog(@"新启动APP-- 搜索");
        } else if ([shortcutItem.type isEqualToString:@"com.yang.add"]) {
            //进入分享界面
            NSLog(@"新启动APP-- 添加联系人");
        }else if ([shortcutItem.type isEqualToString:@"com.yang.share"]) {
            NSArray *arr = @[@"hello 3D Touch"];
            UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
            [self.window.rootViewController presentViewController:vc animated:YES completion:^{
            }];
            NSLog(@"新启动APP-- 分享");
        }
    }
}
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    if (shortcutItem) {
        //判断设置的快捷选项标签唯一标识，根据不同标识执行不同操作
        if([shortcutItem.type isEqualToString:@"com.yang.one"]){
            NSLog(@"APP没被杀死-- 第一个按钮");
        } else if ([shortcutItem.type isEqualToString:@"com.yang.search"]) {
            //进入搜索界面
            NSLog(@"APP没被杀死-- 搜索");
        } else if ([shortcutItem.type isEqualToString:@"com.yang.add"]) {
            //进入分享界面
            NSLog(@"APP没被杀死-- 添加联系人");
        }else if ([shortcutItem.type isEqualToString:@"com.yang.share"]) {
            NSArray *arr = @[@"hello 3D Touch"];
            UIActivityViewController *vc = [[UIActivityViewController alloc]initWithActivityItems:arr applicationActivities:nil];
            [self.window.rootViewController presentViewController:vc animated:YES completion:^{
            }];
            NSLog(@"APP没被杀死-- 分享");
        }
    }
    
    if (completionHandler) {
        completionHandler(YES);
    }
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


@end
