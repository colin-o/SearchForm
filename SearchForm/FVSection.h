//
//  FVSection.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FVField;

@interface FVSection : NSObject {
    NSMutableArray *fields;
}

@property(copy, nonatomic) NSString *title;

- (id) initWithTitle:(NSString*)aTitle;

- (void)addField:(FVField*)field;

- (FVField*)fieldAtIndex:(NSUInteger)fieldIndex;

- (NSUInteger)fieldCount;

@end
