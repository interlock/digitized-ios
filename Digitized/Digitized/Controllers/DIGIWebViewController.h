//
//  DIGIWebViewController.h
//  Digitized
//
//  Created by James Sapara on 12-04-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DIGIWebViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic,strong) IBOutlet UIWebView *webView;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)refreshButtonClick:(id)sender;

@end
