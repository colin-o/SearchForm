//
//  FVLabelView.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVLabelView.h"

@implementation FVLabelView

@synthesize text;

- (BOOL)isOpaque
{
    return NO;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [[UIColor clearColor] set];
    [[UIBezierPath bezierPathWithRect:self.bounds] fill];
    
    [[UIColor colorWithHue:0.60 saturation:0.46 brightness:0.56 alpha:1.0]set];
    UIFont *font = [UIFont boldSystemFontOfSize:14];    

    CGRect textRect = self.bounds;
    
    textRect.origin.y = textRect.size.height / 2 - [font lineHeight] / 2;
    textRect.size.width -= 10;
    
    [text drawInRect:textRect withFont:font lineBreakMode:UILineBreakModeTailTruncation alignment:UITextAlignmentRight];
    
    [[UIColor lightGrayColor] set];
    CGRect lineRect = self.bounds;
    lineRect.origin.x += lineRect.size.width - 0.5;
    lineRect.size.width = 1;
    [[UIBezierPath bezierPathWithRect:lineRect] stroke];

}

@end
