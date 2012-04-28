//
//  DIGILiveTweetTableViewController.h
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface DIGILiveTweetTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource,RKObjectLoaderDelegate>

@property (nonatomic,strong) NSArray *statuses;

- (void)loadTimeline;

- (IBAction)refreshClick:(id)sender;

@end