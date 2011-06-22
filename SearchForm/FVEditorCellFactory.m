//
//  FVEditorCell.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVEditorCellFactory.h"
#import "FVField.h"
#import "FVFieldEditor.h"
#import "FVTextFieldCell.h"
#import "FVBooleanFieldCell.h"
#import "FVMultipleChoiceFieldCell.h"

@implementation FVEditorCellFactory

+ (FVEditorCellManager*)cellManagerForField:(FVField*)field
{
    if([field.editors count] > 1)
        @throw [NSException exceptionWithName:@"FVEditorCell" reason:@"Editor cells can only have one editor currently."  userInfo:nil];
    
    FVFieldEditor *fieldEditor = [field.editors objectAtIndex:0];
    
    switch(fieldEditor.type)
    {
        case FVTextField:
            return [[[FVTextFieldCell alloc] initWithField:field] autorelease];
            
        case FVBooleanField:
            return [[[FVBooleanFieldCell alloc] initWithField:field] autorelease];
            
        case FVMultipleChoiceField:
            return [[[FVMultipleChoiceFieldCell alloc] initWithField:field] autorelease];
    }
    
    return nil;
}

@end

@implementation FVEditorCellManager

- (id)initWithField:(FVField*)aField
{
    self = [super init];
    return self;
}

- (UITableViewCell*)cell
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end