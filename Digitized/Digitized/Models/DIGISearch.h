//
//  DIGISearch.h
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>


@interface DIGISearch : NSObject

@property (nonatomic,strong) NSString *maxID;

@property (nonatomic,strong) NSArray *results;

+ (RKObjectMapping*)getMapping;

@end
