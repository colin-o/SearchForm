//
//  FVMultipleChoiceDatasource.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol FVMultipleChoiceDatasource <NSObject>

- (NSString*)displayValueForItem:(NSIndexPath*)indexPath;

- (NSArray*)identifiersForItems:(NSIndexSet*)indexSet;

@end
