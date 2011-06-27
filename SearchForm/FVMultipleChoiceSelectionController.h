//
//  FVMultipleChoiceSelectionController.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FVMultipleChoiceEditor;
@protocol FVMultipleChoiceDatasource;

@interface FVMultipleChoiceSelectionController : UIViewController {
    FVMultipleChoiceEditor *editor;
    id<FVMultipleChoiceDatasource> dataSource;
    NSMutableDictionary *selections;
    UITableView *choicesTable;
    UITableViewCell *searchCell;
    NSMutableArray *sectionTitles;
}
@property (nonatomic, retain) IBOutlet UITableView *choicesTable;
@property (nonatomic, retain) IBOutlet UITableViewCell *searchCell;

- (id)initWithFieldEditor:(FVMultipleChoiceEditor*)editor;

- (IBAction)selectNone:(id)sender;

- (IBAction)selectAll:(id)sender;

@end
