//
//  SearchFormAppDelegate.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SearchFormAppDelegate.h"
#import "SettingsViewController.h"

@implementation SearchFormAppDelegate


@synthesize window=_window;
@synthesize rootViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SearchView" bundle:[NSBundle mainBundle]];
    
    [self.window makeKeyAndVisible];
    [self.window addSubview:rootViewController.view];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [settingsViewController release];
    [_window release];
    [rootViewController release];
    [super dealloc];
}

- (IBAction)showForm:(id)sender {
    settingsViewController.modalPresentationStyle = UIModalPresentationFormSheet;
    [rootViewController presentModalViewController:settingsViewController animated:YES];
}
@end