//
//  FVMultipleChoiceEditor.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FVFieldEditor.h"
#import "FVMultipleChoiceDatasource.h"

@interface FVMultipleChoiceEditor : FVFieldEditor {

}

@property (retain, nonatomic) id<FVMultipleChoiceDatasource> dataSource;

- (id)initWithIdentifier:(NSString*)identifier dataSource:(id<FVMultipleChoiceDatasource>)dataSource;

@end