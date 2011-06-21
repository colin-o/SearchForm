//
//  FVSection.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVSection.h"


@implementation FVSection

@synthesize title;

- (id)init
{
    return [self initWithTitle:@"Blank Section"];
}

- (id) initWithTitle:(NSString*)aTitle
{
    self = [super init];
    if(self)
    {
        title = aTitle;
        fields = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [title release];
    title = nil;
    
    [fields release];
    fields = nil;
    
    [super dealloc];
}

- (void)addField:(FVField*)field
{
    [fields addObject:field];
}

- (FVField*)fieldAtIndex:(NSUInteger)fieldIndex
{
    return [fields objectAtIndex:fieldIndex];
}

- (NSUInteger)fieldCount
{
    return [fields count];
}

@end
