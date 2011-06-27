//
//  SettingsViewController.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"
#import "FVFormView.h"
#import "FVMultipleChoiceEditor.h"
#import "DummySource.h"

@interface SettingsViewController(Private)
- (void)createFormViewController;
@end

@implementation SettingsViewController
@synthesize formController;

- (id)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

- (void)dealloc
{
    [formController release];
    [super dealloc];
}

- (void)awakeFromNib
{

}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)createFormViewController
{
    [formController release];
    formController = [[[FVFormViewController alloc] initWithStyle:UITableViewStyleGrouped] autorelease];
    
    FVForm *form = [[FVForm alloc] init];
    FVSection *section = nil;
    FVField *field = nil;
    DummySource *source = nil;
    FVMultipleChoiceEditor *editor = nil;
    
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
    source = [[DummySource alloc] init];
    editor = [[FVMultipleChoiceEditor alloc] initWithIdentifier:@"planType" dataSource:source];
    [field addMultipleChoiceEditor:editor];
    [section addField:field];
    [field release];
    [source release];
    [editor release];
    
    field = [[FVField alloc] initWithCaption:@"Competitors"];
    source = [[DummySource alloc] init];
    editor = [[FVMultipleChoiceEditor alloc] initWithIdentifier:@"competitors" dataSource:source];
    [field addMultipleChoiceEditor:editor];
    [section addField:field];
    [field release];
    [source release];
    [editor release];
    
    field = [[FVField alloc] initWithCaption:@"Other Media"];
    source = [[DummySource alloc] init];
    editor = [[FVMultipleChoiceEditor alloc] initWithIdentifier:@"otherMedia" dataSource:source];
    [field addMultipleChoiceEditor:editor];
    [section addField:field];
    [field release];
    [source release];
    [editor release];
    
    field = [[FVField alloc] initWithCaption:@"Internet"];
    [field addBooleanEditor:@"internet"];
    [section addField:field];
    [field release];
    
    // Section
    section = [[FVSection alloc] initWithTitle:@"Categories"];
    [form addSection:section];
    [section release];
    
    field = [[FVField alloc] initWithCaption:@"Headings / Categories"];
    source = [[DummySource alloc] init];
    editor = [[FVMultipleChoiceEditor alloc] initWithIdentifier:@"categories" dataSource:source];
    [field addMultipleChoiceEditor:editor];
    [section addField:field];
    [field release];
    [source release];
    [editor release];
    
    formController.form = form;
    [form release];  
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(formController == nil)
    {
        [self createFormViewController];
        [self pushViewController:formController animated:NO];        
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

@end
