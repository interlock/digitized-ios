//
//  DIGIStatus.m
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DIGIStatus.h"

@implementation DIGIStatus

@synthesize statusID = _statusID;
@synthesize createdAt = _createdAt;
@synthesize text = _text;
@synthesize profileImageUrlString = _profileImageUrlString;


- (NSString*)description {
	return [NSString stringWithFormat:@"%@ (ID: %@)", self.text, self.statusID];
}

+ (RKObjectMapping*)getMapping {
    RKObjectMapping* statusMapping = [RKObjectMapping mappingForClass:[DIGIStatus class]];
    [statusMapping mapKeyPathsToAttributes:
     @"id", @"statusID",
     @"created_at", @"createdAt",
     @"text", @"text",
     @"profile_image_url", @"profileImageUrlString",
     nil];
    return statusMapping;
}

@end
