//
//  DIGIUser.h
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIGIUser : NSObject {
    NSNumber* _userID;
    NSString* _name;
    NSString* _screenName;
}

@property (nonatomic, retain) NSNumber* userID;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* screenName;

@end
