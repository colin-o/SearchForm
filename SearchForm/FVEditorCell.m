//
//  FVEditorCell.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVEditorCell.h"
#import "FVField.h"
#import "FVFieldEditor.h"
#import "FVLabelView.h"

@interface FVEditorCell(Private)

@end

@implementation FVEditorCell
@synthesize cell;
@synthesize label;
@synthesize editor;

@synthesize labelWidth;

- (id)initWithField:(FVField*)aField
{
    self = [super init];
    if(self)
    {
        field = [aField retain];
        [[UINib nibWithNibName:@"EditorCell" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil];
        
        label.text = field.caption;
        editor.placeholder = @"Required";
    }
    return self;
}

- (void)dealloc
{
    [field release];
    [cell release];
    [label release];
    [editor release];
    [super dealloc];
}

- (FVField*)field
{
    return field;
}

@end
