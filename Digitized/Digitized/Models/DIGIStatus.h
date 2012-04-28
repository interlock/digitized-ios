//
//  DIGIStatus.h
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface DIGIStatus : NSObject {
	NSNumber* _statusID;
	NSDate* _createdAt;
	NSString* _text;
	NSString* _profileImageUrlString;
}

/**
 * The unique ID of this Status
 */
@property (nonatomic, retain) NSNumber* statusID;

/**
 * Timestamp the Status was sent
 */
@property (nonatomic, retain) NSDate* createdAt;

/**
 * Text of the Status
 */
@property (nonatomic, retain) NSString* text;

/**
 * String version of the URL associated with the Status
 */
@property (nonatomic, retain) NSString* profileImageUrlString;


+ (RKObjectMapping*)getMapping;

@end
