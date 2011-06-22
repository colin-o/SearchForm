//
//  FVMultipleChoiceFieldCell.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVMultipleChoiceFieldCell.h"
#import "FVField.h"

@implementation FVMultipleChoiceFieldCell
@synthesize cell;
@synthesize label;
@synthesize selectedItemsLabel;

- (id)initWithField:(FVField*)aField
{
    self = [super init];
    if (self) {
        field = [aField retain];
        [[UINib nibWithNibName:@"MultipleChoiceFieldCell" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil];
        
        label.text = field.caption;
        selectedItemsLabel.text = @"item 1, item 2";
    }
    
    return self;
}

- (UITableViewCell*)cell
{
    return cell;
}

- (void)dealloc
{
    [field release];
    [cell release];
    [label release];
    [selectedItemsLabel release];
    [super dealloc];
}

@end
