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

@interface FVEditorCell : UITableViewCell {
    FVField *field;
    
    FVLabelView *labelView;
    UITextField *editorField;
}

@property(readonly, nonatomic) FVField *field;

@property(assign, nonatomic) CGFloat labelWidth;

- (id)initWithField:(FVField*)aField;

@end
