//
//  FVEditorCell.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FVField;
@class FVEditorCellManager;

@interface FVEditorCellFactory : NSObject {
    FVField *field;
}

+ (FVEditorCellManager*)cellManagerForField:(FVField*)aField;

@end

@interface FVEditorCellManager : NSObject

- (id)initWithField:(FVField*)aField;

- (UITableViewCell*)cell;
          
@end