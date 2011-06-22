//
//  FVBooleanCell.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FVEditorCellFactory.h"

@interface FVBooleanFieldCell : FVEditorCellManager {
@private
    FVField *field;
    UITableViewCell *cell;
    UISwitch *switchEditor;
    UILabel *label;
}
@property (nonatomic, retain) IBOutlet UILabel *label;

@property (nonatomic, retain) IBOutlet UITableViewCell *cell;

@property (nonatomic, retain) IBOutlet UISwitch *switchEditor;

- (id)initWithField:(FVField*)aField;

- (UITableViewCell*)cell;

@end
