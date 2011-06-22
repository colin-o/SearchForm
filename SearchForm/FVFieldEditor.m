//
//  FVFieldEditor.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVFieldEditor.h"


@implementation FVFieldEditor

@synthesize identifier, type;

- (id)initWithType:(FVEditorType)aType identifier:(NSString*)anIdentifier
{
    self = [super init];
    if(self)
    {
        type = aType;
        identifier = anIdentifier;
    }
    return self;
}

- (void)dealloc
{
    [identifier release];
    identifier = nil;
    
    [super dealloc];
}

@end
