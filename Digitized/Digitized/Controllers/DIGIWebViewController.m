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
    
    // Try changing the URL
    defaultURL = @"http://digitized.tumblr.com/";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

// This method will load or refresh the page everytime we switch to this tab
- (void)viewWillAppear:(BOOL)animated {
    if ( self.webView.loading == NO ) {

        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:defaultURL]]];
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
       [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:defaultURL]]];
   }
}

#pragma mark -
#pragma mark - UIWebViewDelegate

// UIWebView will call this when it starts loading a URL
- (void) webViewDidStartLoad:(UIWebView *)webView {
    [self.activityIndicator startAnimating]; // Show our spinner
}

// UIWebView will call thi when it finishs loading the URL
- (void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityIndicator stopAnimating]; // hide our spinner
}

// If UIWebView has a problem, it calls this so we can handle it
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.activityIndicator stopAnimating];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:@"Looks like we could not load the website" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"Ok" 
                                          otherButtonTitles:nil];
    [alert show];
}

#pragma mark -

@end
