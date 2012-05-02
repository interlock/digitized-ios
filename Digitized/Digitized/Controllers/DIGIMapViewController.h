//
//  DIGIMapViewController.h
//  Digitized
//
//  Created by James Sapara on 12-04-29.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DIGIMapViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)locateUser:(id)sender;

@end
