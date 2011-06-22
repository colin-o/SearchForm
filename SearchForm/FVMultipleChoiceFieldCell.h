//
//  FVMultipleChoiceFieldCell.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FVEditorCellFactory.h"

@interface FVMultipleChoiceFieldCell : FVEditorCellManager {
@private
    FVField *field;
    UITableViewCell *cell;
    UILabel *label;
    UILabel *selectedItemsLabel;
}

@property (nonatomic, retain) IBOutlet UITableViewCell *cell;

@property (nonatomic, retain) IBOutlet UILabel *label;

@property (nonatomic, retain) IBOutlet UILabel *selectedItemsLabel;

- (id)initWithField:(FVField*)aField;

- (UITableViewCell*)cell;

@end
