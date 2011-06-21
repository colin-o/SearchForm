//
//  SettingsViewController.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "FVFormView.h"


@implementation SettingsViewController
@synthesize formController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [formController release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    FVForm *form = [[FVForm alloc] init];
    FVSection *section = nil;
    FVField *field = nil;
    
    // User Information
    section = [[FVSection alloc] initWithTitle:@"User Information"];
    [form addSection:section];
    [section release];
    
    field = [[FVField alloc] initWithCaption:@"First Name"];
    [field addTextEditor:@"firstName"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Last Name"];
    [field addTextEditor:@"lastName"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Telephone"];
    [field addTextEditor:@"telephone"];
    [section addField:field];
    [field release];
    
    // Login Information
    section = [[FVSection alloc] initWithTitle:@"Login Information"];
    [form addSection:section];
    [section release];
    
    field = [[FVField alloc] initWithCaption:@"Email"];
    [field addTextEditor:@"email"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Password"];
    [field addTextEditor:@"password"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Verify Password"];
    [field addTextEditor:@"password_verify"];
    [section addField:field];
    [field release];
    
    formController.form = form;
    [form release];
}

- (void)viewDidUnload
{
    [self setFormController:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
