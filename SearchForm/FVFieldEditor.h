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
    FVTextField = 1
} FVEditorType;

@interface FVFieldEditor : NSObject {
    FVEditorType type;
    NSString *identifier;
}

@property(copy, readonly, nonatomic) NSString *identifier;

- (id)initWithType:(FVEditorType)aType identifier:(NSString*)anIdentifier;

@end
