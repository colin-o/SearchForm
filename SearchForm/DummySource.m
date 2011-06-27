//
//  DummySource.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DummySource.h"
#import "FVIndexedCollection.h"


@implementation DummySource

- (id)init
{
    self = [super init];
    if(self)
    {
        NSMutableArray *items = [[NSMutableArray alloc] init];
        
        for(NSUInteger i=0; i<100;i++)
        {
            NSNumber *number = [NSNumber numberWithUnsignedInteger:i];
            NSString *name = [NSString stringWithFormat:@"%c%c", (i%26)+'A', ((i*i)%26)+'a'];
            
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:number, @"value", name, @"name", NULL];
            [items addObject:dict];
        }
        
        
        data = [[FVIndexedCollection alloc] initWithItems:items indexedByProperty:^ NSString* (id obj)
        {
            return [obj objectForKey:@"name"];
        }];
    }
    return self;
}

- (void)dealloc
{
    [data release];
    [super dealloc];
}

- (NSUInteger)countOfSections
{
    return [data countOfSections];
}

- (NSString*)titleOfSection:(NSUInteger)section
{
    return [data titleOfSection:section];
}

- (NSUInteger)countOfItemsInSection:(NSUInteger)section
{
    return [data countOfItemsInSection:section];
}

- (NSString*)displayValueForItemInSection:(NSUInteger)section index:(NSUInteger)index
{
    return [[data itemInSection:section index:index] objectForKey:@"name"];
}

- (NSString*)identifierForItemInSection:(NSUInteger)section index:(NSUInteger)index
{
    return [[data itemInSection:section index:index] objectForKey:@"value"];    
}

@end
