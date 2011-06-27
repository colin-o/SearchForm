//
//  FVMultipleChoiceDatasource.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol FVMultipleChoiceDatasource <NSObject>

- (NSUInteger)countOfSections;

- (NSString*)titleOfSection:(NSUInteger)section;

- (NSUInteger)countOfItemsInSection:(NSUInteger)section;

- (NSString*)displayValueForItemInSection:(NSUInteger)section index:(NSUInteger)index;

- (NSString*)identifierForItemInSection:(NSUInteger)section index:(NSUInteger)index;

@end