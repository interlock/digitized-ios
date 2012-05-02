//
//  DIGIAppDelegate.m
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DIGIAppDelegate.h"
#import <RestKit/RestKit.h>

#import "DIGIStatus.h"

@implementation DIGIAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[TestFlight takeOff:@"Insert your Team Token here"];
    
    RKObjectManager* objectManager = [RKObjectManager managerWithBaseURLString:@"http://search.twitter.com"];
    objectManager.client.requestQueue.showsNetworkActivityIndicatorWhenBusy = YES;

    // OAuth Setup
    objectManager.client.OAuth1AccessToken = @"565530410-Bf0aSJ3xm0iX8SvGFHbqu3HZpCWm0vnU4cEjdV4E";
    objectManager.client.OAuth1AccessTokenSecret = @"f8EOLVCF0lnnnvQJpGjTelWUgI1m2ovGhalCYF8c8";\
    objectManager.client.OAuth1ConsumerKey = @"jvEIluGkv1bZRQrQpG8g";
    objectManager.client.OAuth1ConsumerSecret = @"WTMMh7AYs4d1yksI0FaPst4OVkgWYTWWH9oLYrjgiY";
    objectManager.client.authenticationType = RKRequestAuthenticationTypeOAuth1;
    
    
    // Update date format so that we can parse Twitter dates properly
	// Wed Sep 29 15:31:08 +0000 2010
    [RKObjectMapping addDefaultDateFormatterForString:@"E MMM d HH:mm:ss Z y" inTimeZone:nil];

    
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
     
#pragma mark -
#pragma mark RKOAuthDelegate
     
- (void)OAuthClient:(RKOAuthClient *)client didFailWithError:(NSError *)error {
    NSLog(@"Failed to authenticate %@", error);
}

@end
