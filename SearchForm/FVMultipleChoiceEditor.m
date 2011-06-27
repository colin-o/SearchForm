//
//  FVMultipleChoiceEditor.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVMultipleChoiceEditor.h"

@implementation FVMultipleChoiceEditor

@synthesize dataSource;

- (id)initWithIdentifier:(NSString*)anIdentifier dataSource:(id<FVMultipleChoiceDatasource>)aDataSource;
{
    self = [super initWithType:FVMultipleChoiceField identifier:anIdentifier];
    if(self)
    {
        self.dataSource = aDataSource;
    }
    return self;
}

@end
