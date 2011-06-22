//
//  FVFieldEditor.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum 
{
    FVTextField = 1,
    FVBooleanField = 2,
    FVMultipleChoiceField = 3
} FVEditorType;

@interface FVFieldEditor : NSObject {
    FVEditorType type;
    NSString *identifier;
}

@property(copy, readonly, nonatomic) NSString *identifier;

@property(readonly, nonatomic) FVEditorType type;

- (id)initWithType:(FVEditorType)aType identifier:(NSString*)anIdentifier;

@end
