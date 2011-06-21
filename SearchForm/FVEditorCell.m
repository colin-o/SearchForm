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
- (void)setUpEditor;
@end

@implementation FVEditorCell

@synthesize labelWidth;

- (id)initWithField:(FVField*)aField
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:aField.identifier];
    if(self)
    {
        field = [aField retain];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setUpEditor];
    }
    return self;
}

- (void)dealloc
{
    [field release];
    field = nil;
    
    [super dealloc];
}

- (FVField*)field
{
    return field;
}

- (void)setUpEditor;
{
    self.labelWidth = 200;
    
    // Label
    CGRect labelRect = self.bounds;
    labelRect.size.width = self.labelWidth;
    labelView = [[FVLabelView alloc] initWithFrame:labelRect];
    labelView.text = field.caption;
    [self.contentView addSubview:labelView];
    [labelView release];

    // Editor
    CGRect myFrame = CGRectMake(0, 0, self.labelWidth, 25);
    editorField = [[UITextField alloc] initWithFrame:myFrame];
    editorField.placeholder = @"Required";
    self.accessoryView = editorField;
    [editorField release];
}

- (void)layoutSubviews
{
    CGRect frame = self.frame;
    CGFloat cellWidth = frame.size.width - 100; // Outline view has 50px of margin on each side.

    CGRect editorRect = CGRectMake(0, 0, cellWidth - self.labelWidth, 25);
    [editorField setFrame:editorRect];
    
    [super layoutSubviews];
}

@end
