//
//  DIGIWebViewController.m
//  Digitized
//
//  Created by James Sapara on 12-04-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DIGIWebViewController.h"

@interface DIGIWebViewController ()

@end

@implementation DIGIWebViewController

@synthesize webView = _webView;
@synthesize activityIndicator = _activityIndicator;

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

- (void)viewWillAppear:(BOOL)animated {
    if ( self.webView.loading == NO ) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://digitized.tumblr.com/"]]];
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark - UI

- (IBAction)refreshButtonClick:(id)sender {
   if ( self.webView.loading == NO ) {
       // resubmit the url again, incase we nagivated off the page"
       [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://digitized.tumblr.com/"]]];
   }
}

#pragma mark -
#pragma mark - UIWebViewDelegate

- (void) webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating];
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating];
}

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"Looks like we could not load the website" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark -

@end
