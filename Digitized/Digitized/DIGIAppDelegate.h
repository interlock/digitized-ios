//
//  DIGIAppDelegate.h
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface DIGIAppDelegate : UIResponder <UIApplicationDelegate, RKOAuthClientDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
