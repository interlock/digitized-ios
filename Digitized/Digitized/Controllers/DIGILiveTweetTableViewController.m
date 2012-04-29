//
//  DIGILiveTweetTableViewController.m
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DIGILiveTweetTableViewController.h"
#import "DIGITweetViewCell.h"
#import "DIGISearch.h"
#import "DIGIStatus.h"

@interface DIGILiveTweetTableViewController ()

@end

@implementation DIGILiveTweetTableViewController

@synthesize statuses = _statuses;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)refreshClick:(id)sender {
    [self loadTimeline];
}

- (void)loadTimeline {
    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    
    [objectManager loadObjectsAtResourcePath:@"search.json?q=#yxe" usingBlock:^(RKObjectLoader *loader) {
        loader.delegate = self;
        loader.objectMapping = [DIGISearch getMapping];
    }];
}

- (void)loadView {
    [super loadView];
	
	// Setup View and Table View	
	self.tableView.backgroundColor = [UIColor clearColor];
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	[self loadTimeline];
}

#pragma mark RKObjectLoaderDelegate methods

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    NSLog(@"Loaded payload: %@", [response bodyAsString]);
}
     

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObject:(id)object {
    NSLog(@"Loaded statuses: %@", object);
    DIGISearch *searchResult = (DIGISearch*)object;
    
    [self setStatuses:searchResult.results];
	[self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
	UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	NSLog(@"Hit error: %@", error);
}

#pragma mark UITableViewDelegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	CGSize size = [[[_statuses objectAtIndex:indexPath.row] text] sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(300, 9000)];
	return size.height + 10;
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [_statuses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString* reuseIdentifier = @"TWEET_CELL";
	DIGITweetViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	if (nil == cell) {
        cell = [[DIGITweetViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	}
    // setup tweet
    DIGIStatus *status = (DIGIStatus*)[_statuses objectAtIndex:indexPath.row];
    NSURL *url = [NSURL URLWithString: [status profileImageUrlString]];
    UIImage *image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    [cell.imageView setImage:image];
	cell.textLabel.text = [status text];
    cell.timestampLabel.text = [status text];
	return cell;
}

@end
