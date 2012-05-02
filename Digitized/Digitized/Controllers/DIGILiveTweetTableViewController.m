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
@synthesize placeHolderImageView;

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
    
    [objectManager loadObjectsAtResourcePath:@"search.json?q=#Digitized2012" usingBlock:^(RKObjectLoader *loader) {
        loader.delegate = self;
        loader.objectMapping = [DIGISearch getMapping];
    }];
}

- (void)loadView {
    [super loadView];
	
	// Setup View and Table View	
	self.tableView.backgroundColor = [UIColor whiteColor];
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
    NSString *cellText = [[_statuses objectAtIndex:indexPath.row] text];
    UIFont *cellFont = [UIFont fontWithName:@"Helvetica" size:14.0];
    CGSize constraintSize = CGSizeMake(219.0f, MAXFLOAT);
    CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    return labelSize.height + 20;
}

#pragma mark UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
	return [_statuses count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString* reuseIdentifier = @"TWEET_CELL";
	DIGITweetViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
	if (nil == cell) {
        //cell = [[DIGITweetViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        cell = [self.tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
        [cell.textLabel setLineBreakMode:UILineBreakModeWordWrap];
        [cell.textLabel setNumberOfLines:0];
        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica" size:14.0]];
	}
    // setup tweet
    DIGIStatus *status = (DIGIStatus*)[_statuses objectAtIndex:indexPath.row];
    TCImageView *imageView = [[TCImageView alloc] initWithURL:[NSURL URLWithString:[status profileImageUrlString]]
                                             placeholderImage:nil];
    [imageView setFrame:cell.profileImageView.frame];
    [cell.profileImageView removeFromSuperview];
    [cell setProfileImageView: imageView];
    [cell addSubview:imageView];
    [imageView loadImage];
    CGRect newFrame = cell.textLabel.frame;
    newFrame.size.height = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    [cell.textLabel setText:[status text]];
    [cell.textLabel setFrame:newFrame];

    
	return cell;
}

@end
