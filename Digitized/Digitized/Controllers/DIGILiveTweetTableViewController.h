//
//  DIGILiveTweetTableViewController.h
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface DIGILiveTweetTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource,RKObjectLoaderDelegate> {
    RKObjectLoader *_currentObjectLoader;
}

@property (nonatomic,strong) NSArray *statuses;
@property (nonatomic,strong) IBOutlet UIImageView *placeHolderImageView;
- (void)loadTimeline;

- (IBAction)refreshClick:(id)sender;

@end
