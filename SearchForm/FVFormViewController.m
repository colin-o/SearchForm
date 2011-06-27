//
//  FVFormViewController.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVFormViewController.h"
#import "FVEditorCellFactory.h"
#import "FVForm.h"
#import "FVSection.h"
#import "FVField.h"
#import "FVFieldEditor.h"
#import "FVMultipleChoiceEditor.h"
#import "FVMultipleChoiceSelectionController.h"


@implementation FVFormViewController

@synthesize form;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        cells = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)dealloc
{
    [cells release];
    [form release];
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
    
    self.title = @"Search Criteria";
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStyleDone target:self action:@selector(anything:)];
    self.navigationItem.rightBarButtonItem = searchButton;
    [searchButton release];
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    [cancelButton release];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)cancel:(id)sender
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if(interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown)
        return YES;
    else
        return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [form sectionCount];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)sectionIndex
{
    FVSection *section = [form sectionAtIndex:sectionIndex];
    return section.title;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    FVSection *section = [form sectionAtIndex:sectionIndex];
    return [section fieldCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FVSection *section = [form sectionAtIndex:[indexPath section]];
    FVField *field = [section fieldAtIndex:[indexPath row]];    
    
    FVEditorCellManager *cellManager = (FVEditorCellManager*)[cells objectForKey:field.identifier];
    if (cellManager == nil) 
    {
        cellManager = [FVEditorCellFactory cellManagerForField:field];
        [cells setObject:cellManager forKey:field.identifier];
    }
    
    return cellManager.cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FVSection *formSection = [form sectionAtIndex:indexPath.section];
    FVField *formField = [formSection fieldAtIndex:indexPath.row];
    FVFieldEditor *formEditor = [[formField editors] objectAtIndex:0];
    
    if([formEditor type] == FVMultipleChoiceField && [formEditor isKindOfClass:[FVMultipleChoiceEditor class]])
    {
        FVMultipleChoiceEditor *editor = (FVMultipleChoiceEditor*)formEditor;
        FVMultipleChoiceSelectionController *choiceController = [[FVMultipleChoiceSelectionController alloc] initWithFieldEditor:editor];
        [self.navigationController pushViewController:choiceController animated:YES];
        [choiceController release];
    }
}

@end
