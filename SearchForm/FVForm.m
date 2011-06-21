//
//  FVForm.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVForm.h"


@implementation FVForm

- (id)init
{
    self = [super init];
    if(self)
    {
        sections = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [sections release];
    sections = nil;
    
    [super dealloc];
}

- (void)addSection:(FVSection*)section
{
    [sections addObject:section];
}

- (FVSection*)sectionAtIndex:(NSUInteger)sectionIndex
{
    return [sections objectAtIndex:sectionIndex];
}

- (NSUInteger)sectionCount
{
    return [sections count];
}

@end
