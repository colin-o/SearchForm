//
//  FVMultipleChoiceSelectionController.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FVFieldEditor;

@interface FVMultipleChoiceSelectionController : UIViewController {
    FVFieldEditor *editor;
    UITableView *choicesTable;
    UITableView *toolbar;
    UITableViewCell *searchCell;
}
@property (nonatomic, retain) IBOutlet UITableView *choicesTable;
@property (nonatomic, retain) IBOutlet UITableView *toolbar;
@property (nonatomic, retain) IBOutlet UITableViewCell *searchCell;

- (id)initWithFieldEditor:(FVFieldEditor*)editor;

@end
