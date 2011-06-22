//
//  FVBooleanCell.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVBooleanFieldCell.h"
#import "FVField.h"

@implementation FVBooleanFieldCell
@synthesize label;
@synthesize cell;
@synthesize switchEditor;

- (id)initWithField:(FVField*)aField
{
    self = [super init];
    if (self) {
        field = [aField retain];
        [[UINib nibWithNibName:@"BooleanFieldCell" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil];
        
        label.text = field.caption;
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
    [switchEditor release];
    [label release];
    [super dealloc];
}

@end
