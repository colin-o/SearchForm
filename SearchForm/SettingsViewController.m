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
    
    // Section
    section = [[FVSection alloc] initWithTitle:@"Search Criteria"];
    [form addSection:section];
    [section release];
    
    field = [[FVField alloc] initWithCaption:@"Plan Name"];
    [field addTextEditor:@"planName"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Company"];
    [field addTextEditor:@"company"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Products & Services"];
    [field addTextEditor:@"productsAndServices"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Only plans with downloadable images"];
    [field addBooleanEditor:@"imagesOnly"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Dealer / Distributor list available"];
    [field addBooleanEditor:@"dealListAvailable"];
    [section addField:field];
    [field release];
    
    // Section
    section = [[FVSection alloc] initWithTitle:@"Types"];
    [form addSection:section];
    [section release];
    
    field = [[FVField alloc] initWithCaption:@"Plan Type"];
    [field addMultipleChoiceEditor:@"planType"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Competitors"];
    [field addMultipleChoiceEditor:@"competitors"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Other Media"];
    [field addMultipleChoiceEditor:@"otherMedia"];
    [section addField:field];
    [field release];
    
    field = [[FVField alloc] initWithCaption:@"Internet"];
    [field addBooleanEditor:@"internet"];
    [section addField:field];
    [field release];
    
    // Section
    section = [[FVSection alloc] initWithTitle:@"Categories"];
    [form addSection:section];
    [section release];
    
    field = [[FVField alloc] initWithCaption:@"Headings / Categories"];
    [field addMultipleChoiceEditor:@"categories"];
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
