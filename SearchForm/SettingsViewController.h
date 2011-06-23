//
//  SettingsViewController.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FVFormViewController;

@interface SettingsViewController : UINavigationController {

    FVFormViewController *formController;
}

@property (nonatomic, retain) IBOutlet FVFormViewController *formController;


@end
