//
//  FVTextFieldCell.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FVEditorCellFactory.h"

@interface FVTextFieldCell : FVEditorCellManager {
@private
    FVField *field;
    UILabel *label;
    UITextField *editor;
    UITableViewCell *cell;
}

@property (nonatomic, retain) IBOutlet UITableViewCell *cell;

@property (nonatomic, retain) IBOutlet UILabel *label;

@property (nonatomic, retain) IBOutlet UITextField *editor;

- (id)initWithField:(FVField*)aField;

@end
