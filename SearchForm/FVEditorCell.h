//
//  FVEditorCell.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FVField;
@class FVLabelView;

@interface FVEditorCell : NSObject {
    FVField *field;
    UITableViewCell *cell;
    UILabel *label;
    UITextField *editor;
}
@property (nonatomic, retain) IBOutlet UITableViewCell *cell;

@property (nonatomic, retain) IBOutlet UILabel *label;

@property (nonatomic, retain) IBOutlet UITextField *editor;

@property(readonly, nonatomic) FVField *field;

@property(assign, nonatomic) CGFloat labelWidth;

- (id)initWithField:(FVField*)aField;

@end
