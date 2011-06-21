//
//  FVFormViewController.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FVForm;

@interface FVFormViewController : UITableViewController {
    FVForm *form;
    NSMutableDictionary *cells;
}

@property(retain, nonatomic) FVForm *form;

@end
