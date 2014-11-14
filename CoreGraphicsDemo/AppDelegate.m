//
//  AppDelegate.m
//  CoreGraphicsDemo
//
//  Created by Henry on 14-7-15.
//  Copyright (c) 2014年 Surwin. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#include <sys/sysctl.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    BaseViewController *baseViewController = [[BaseViewController alloc]init];
    self.window.rootViewController = baseViewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    NSLog(@"name : %@ model :%@ localizedModel:%@",     [[UIDevice currentDevice] name], [[UIDevice currentDevice] model], [[UIDevice currentDevice] localizedModel]);
    NSLog(@"hostName:%@ \n operatingSystem:%d\noperatingSystemName:%@\noperatingSystemVersionString:%@\nprocessorCount:%d", [NSProcessInfo processInfo].hostName, [NSProcessInfo processInfo].operatingSystem,[NSProcessInfo processInfo].operatingSystemName,[NSProcessInfo processInfo].operatingSystemVersionString,[NSProcessInfo processInfo].activeProcessorCount);
    for (NSInteger i = 0; i < 1; i++) {
        NSTimeInterval time = [NSProcessInfo processInfo].systemUptime;
        NSLog(@"开机运行时间:%f", time);
    }

    
    char *s1="acc";
    char *s2="abc";
    int r=memcmp(s1,s2,3);
    NSLog(@"r=%d",r);
    
    NSString *str1 = @"acc";
    NSString *str2 = @"axc";
    int r1=memcmp([str1 UTF8String],[str2 UTF8String],3);
    NSLog(@"r1=%d",r1);
    
    char dest[] = "67890";
    char src[] = "12345";
    memcpy(src, dest, strlen(dest));
    NSLog(@"%s",src);
    
    
    
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
