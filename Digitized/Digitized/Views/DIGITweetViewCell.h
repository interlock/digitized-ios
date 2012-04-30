//
//  DIGITweetViewCell.h
//  Digitized
//
//  Created by James Sapara on 12-04-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCImageView.h"

@interface DIGITweetViewCell : UITableViewCell

@property (nonatomic,strong) IBOutlet TCImageView *profileImageView;
@property (nonatomic,strong) IBOutlet UILabel *textLabel;

@end
