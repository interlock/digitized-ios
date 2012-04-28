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
@synthesize urlString = _urlString;
@synthesize inReplyToScreenName = _inReplyToScreenName;
@synthesize isFavorited = _isFavorited;	
@synthesize user = _user;

- (NSString*)description {
	return [NSString stringWithFormat:@"%@ (ID: %@)", self.text, self.statusID];
}

@end
