//
//  FVIndexedCollection.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSString* (^StringPropertyFunc)(id obj);

@interface FVIndexedCollection : NSObject {
    NSMutableArray *sections;
}

- (id)initWithItems:(NSArray*)items indexedByProperty:(StringPropertyFunc)property;

- (NSUInteger)countOfSections;

- (NSString*)titleOfSection:(NSUInteger)section;

- (NSUInteger)countOfItemsInSection:(NSUInteger)section;

- (id)itemInSection:(NSUInteger)section index:(NSUInteger)index;

@end
