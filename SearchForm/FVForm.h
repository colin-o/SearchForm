//
//  FVForm.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FVSection;

@interface FVForm : NSObject {
    NSMutableArray *sections;
}

- (void)addSection:(FVSection*)section;

- (FVSection*)sectionAtIndex:(NSUInteger)sectionIndex;

- (NSUInteger)sectionCount;

@end
