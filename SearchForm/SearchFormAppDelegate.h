//
//  SearchFormAppDelegate.h
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingsViewController;

@interface SearchFormAppDelegate : NSObject <UIApplicationDelegate> {
    UIViewController *rootViewController;
    SettingsViewController *settingsViewController;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UIViewController *rootViewController;

- (IBAction)showForm:(id)sender;

@end
