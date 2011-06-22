//
//  FVField.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVField.h"
#import "FVFieldEditor.h"


@implementation FVField

@synthesize caption, editors;

- (id)initWithCaption:(NSString*)aCaption;
{
    self = [super init];
    if(self)
    {
        caption = aCaption;
        editors = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [caption release];
    caption = nil;
    
    [editors release];
    editors = nil;
    
    [_identifier release];
    _identifier = nil;
    
    [super dealloc];
}

- (void)addEditor:(FVFieldEditor*)editor
{
    [editors addObject:editor];
    [_identifier release];
    _identifier = nil;
}

- (void)addTextEditor:(NSString*)identifier
{
    FVFieldEditor *editor = [[FVFieldEditor alloc] initWithType:FVTextField identifier:identifier];
    [self addEditor:editor];
    [editor release];
}

- (void)addBooleanEditor:(NSString*)identifier
{
    FVFieldEditor *editor = [[FVFieldEditor alloc] initWithType:FVBooleanField identifier:identifier];
    [self addEditor:editor];
    [editor release];    
}

- (void)addMultipleChoiceEditor:(NSString*)identifier
{
    FVFieldEditor *editor = [[FVFieldEditor alloc] initWithType:FVMultipleChoiceField identifier:identifier];
    [self addEditor:editor];
    [editor release];        
}

- (NSString*)identifier
{
    if(_identifier == nil)
    {
        NSMutableArray *editorIdentifiers = [[NSMutableArray alloc] init];
        for(FVFieldEditor *editor in editors)
        {
            [editorIdentifiers addObject:editor.identifier];
        }
        _identifier = [[editorIdentifiers componentsJoinedByString:@"_"] retain];
        [editorIdentifiers release];
        editorIdentifiers = nil;
    }
    
    return _identifier;
}

@end

