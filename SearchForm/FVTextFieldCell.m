//
//  FVTextFieldCell.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVTextFieldCell.h"
#import "FVField.h"

@implementation FVTextFieldCell
@synthesize cell;
@synthesize label;
@synthesize editor;

- (id)initWithField:(FVField*)aField
{
    self = [super init];
    if (self) {
        field = [aField retain];
        [[UINib nibWithNibName:@"TextFieldCell" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil];
        
        label.text = field.caption;
        editor.placeholder = @"Required";
        editor.delegate = self;
        editor.returnKeyType = UIReturnKeyDone;
    }
    
    return self;
}

- (void)dealloc
{
    [field release];
    [label release];
    [editor release];
    [cell release];
    [super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [editor resignFirstResponder];
    return YES;
}
@end
