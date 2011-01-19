//
//  EventsViewController.m
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "EventsViewController.h"


@implementation EventsViewController
@synthesize listOfItems, myTable;

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIBarButtonItem *lButton =[[UIBarButtonItem alloc] init];
    
    lButton.title = @"Stäng";
    [lButton setTarget:self];
    [lButton setAction:@selector(closeView:)]; //aMethod defined in the class
    self.navigationItem.leftBarButtonItem = lButton;
    [lButton release];
	
	
	//Initialize the array.
	listOfItems = [[NSMutableArray alloc] init];
	//Add items
	[listOfItems addObject:@"Måndag"];
	[listOfItems addObject:@"Tisdag"];
	[listOfItems addObject:@"Onsdag"];
	[listOfItems addObject:@"Torsdag"];
	[listOfItems addObject:@"Fredag"];
	[listOfItems addObject:@"Lördag"];
	[listOfItems addObject:@"Söndag"];

	//Set the title
	self.navigationItem.title = @"Veckan";
 
}
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 1; // Antal sectioner
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [listOfItems count]; // Antal item i sectionen
	
}

// Här hämtar man innehålet till Cellerna
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
	
	// Set up the cell...
	NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
	cell.text = cellValue;
	//cell.textLabel.text = @"test";
	
	return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	NSLog(@"Did not load");

}

- (void)closeView:(id)sender {

	[self.view removeFromSuperview];
	
}


- (void)dealloc {
	[listOfItems release];
    [super dealloc];
}


@end

