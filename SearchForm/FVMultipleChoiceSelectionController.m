//
//  FVMultipleChoiceSelectionController.m
//  SearchForm
//
//  Created by Colin Olson on 11-06-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FVMultipleChoiceSelectionController.h"
#import "FVFieldEditor.h"
#import "FVMultipleChoiceEditor.h"
#import "FVMultipleChoiceDatasource.h"

@implementation FVMultipleChoiceSelectionController

@synthesize choicesTable;
@synthesize searchCell;

- (id)initWithFieldEditor:(FVMultipleChoiceEditor*)anEditor
{
    self = [super init];
    if (self) {
        editor = [anEditor retain];
        dataSource = [editor dataSource];
        selections = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (IBAction)selectNone:(id)sender {
    [selections release];
    selections = [[NSMutableDictionary alloc] init];
    [choicesTable reloadData];
}

- (IBAction)selectAll:(id)sender {
    [selections release];
    selections = [[NSMutableDictionary alloc] init];
    
    for(NSUInteger section=0;section < [dataSource countOfSections]; section++)
    {
        NSMutableIndexSet *set = [[NSMutableIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, [dataSource countOfItemsInSection:section])];
        [selections setObject:set forKey:[NSNumber numberWithInteger:section]];
        [set release];
    }
    
    [choicesTable reloadData];
}

- (void)dealloc
{
    [editor release];
    [sectionTitles release];
    [selections release];
    [choicesTable release];
    [searchCell release];
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
    
    [[UINib nibWithNibName:@"FVMultipleChoiceOptions" bundle:nil] instantiateWithOwner:self options:nil];
}

- (void)viewDidUnload
{
    [self setChoicesTable:nil];
    [self setSearchCell:nil];
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"TItlesssss";
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
	return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

#pragma mark - Table view data source

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if(sectionTitles == nil)
    {
        int totalSections = [dataSource countOfSections] + 1;
        sectionTitles = [[NSMutableArray alloc] initWithCapacity:totalSections];
        [sectionTitles addObject:UITableViewIndexSearch];
        for(NSUInteger i=0;i<totalSections-1;i++)
            [sectionTitles addObject:[dataSource titleOfSection:i]];
    }
    
    return sectionTitles;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataSource countOfSections] + 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"";
    else
        return [dataSource titleOfSection:section - 1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 1;
    else
        return [dataSource countOfItemsInSection:section - 1];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return searchCell;
    }
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [dataSource displayValueForItemInSection:indexPath.section - 1 index:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    NSMutableIndexSet *sectionSelections = [selections objectForKey:[NSNumber numberWithInteger:indexPath.section - 1]];
    if(sectionSelections != nil && [sectionSelections containsIndex:indexPath.row])
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *sectionNumber = [NSNumber numberWithInteger:indexPath.section - 1];
    NSMutableIndexSet *sectionSelections = [selections objectForKey:sectionNumber];
    
    if(sectionSelections == nil)
    {
        sectionSelections = [[NSMutableIndexSet alloc] init];
        [selections setObject:sectionSelections forKey:sectionNumber];
        [sectionSelections release];
    }
    
    BOOL wasSelected = [sectionSelections containsIndex:indexPath.row];
    if(wasSelected)
        [sectionSelections removeIndex:indexPath.row];
    else
        [sectionSelections addIndex:indexPath.row];
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

@end
