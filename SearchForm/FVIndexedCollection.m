//
//  FVIndexedCollection.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVIndexedCollection.h"

@implementation FVIndexedCollection

- (id)initWithItems:(NSArray*)items indexedByProperty:(StringPropertyFunc)property
{
    self = [super init];
    if(self)
    {
        NSArray *sortedItems = [items sortedArrayUsingComparator:^NSComparisonResult (id obj1, id obj2)
                                {
                                    NSString *string1 = property(obj1);
                                    NSString *string2 = property(obj2);
                                    
                                    return [string1 compare:string2];
                                }];
        
        sections = [[NSMutableArray alloc] initWithCapacity:26];
        
        for(NSInteger i=0;i<26;i++)
        {
            NSDictionary *section = [NSDictionary dictionaryWithObjectsAndKeys:
                                     [NSString stringWithFormat:@"%c", 'A' + i], @"sectionTitle",
                                     [[[NSMutableArray alloc] init] autorelease], @"sectionObjects", NULL];
            [sections addObject:section];
        }
        
        for (id item in sortedItems) {
            NSString *value = property(item);
            unichar firstLetter = [value characterAtIndex:0];
            NSUInteger index = firstLetter - 'A';
            [[[sections objectAtIndex:index] objectForKey:@"sectionObjects"] addObject:item];
        }
    }
    return self;
}

- (void)dealloc
{
    [sections release];
    [super dealloc];
}

- (NSUInteger)countOfSections
{
    return [sections count];    
}

- (NSString*)titleOfSection:(NSUInteger)section
{
    return [[sections objectAtIndex:section] objectForKey:@"sectionTitle"];
}

- (NSUInteger)countOfItemsInSection:(NSUInteger)section
{
    return [[[sections objectAtIndex:section] objectForKey:@"sectionObjects"] count];    
}

- (id)itemInSection:(NSUInteger)section index:(NSUInteger)index;
{
    return [[[sections objectAtIndex:section] objectForKey:@"sectionObjects"] objectAtIndex:index];    
}

@end
