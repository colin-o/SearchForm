//
//  FVField.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FVFieldEditor;
@class FVMultipleChoiceEditor;

@interface FVField : NSObject {
    NSMutableArray *editors;
    NSString *_identifier;
}

@property(copy, nonatomic) NSString *caption;

@property(readonly, nonatomic) NSArray *editors;

- (id)initWithCaption:(NSString*)aCaption;

- (void)addEditor:(FVFieldEditor*)editor;

- (void)addTextEditor:(NSString*)identifier;

- (void)addBooleanEditor:(NSString*)identifier;

- (void)addMultipleChoiceEditor:(FVMultipleChoiceEditor*)editor;

- (NSString*)identifier;

@end
