//
//  DummySource.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FVMultipleChoiceDatasource.h"

@class FVIndexedCollection;

@interface DummySource : NSObject<FVMultipleChoiceDatasource> {
    FVIndexedCollection *data;
}

@end
