//
//  DIGITouchView.m
//  Digitized
//
//  Created by Steven Hepting on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DIGITouchView.h"

@implementation DIGITouchView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView:self];
    
    CGRect newFrame = CGRectMake(location.x - 5, location.y - 5, 10, 10);
    UIView *newView = [[UIView alloc] initWithFrame:newFrame];
    newView.backgroundColor = [UIColor blueColor];
    
    NSLog(@"%@", NSStringFromCGPoint(location));
        
    [self addSubview:newView];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
