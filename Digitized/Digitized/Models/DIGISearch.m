//
//  DIGISearch.m
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DIGISearch.h"
#import "DIGIStatus.h"

@implementation DIGISearch

@synthesize maxID, results;

+ (RKObjectMapping*)getMapping {
    RKObjectMapping* searchMapping = [RKObjectMapping mappingForClass:[DIGISearch class]];
    [searchMapping mapKeyPathsToAttributes:@"max_id", @"maxID",nil];
    [searchMapping mapKeyPath:@"results" toRelationship:@"results" withMapping:[DIGIStatus getMapping]];
    return searchMapping;
}

@end
