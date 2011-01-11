//
//  LinkViewController.m
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "LinkViewController.h"


@implementation LinkViewController
@synthesize listOfItems, linkTable;


#pragma mark -
#pragma mark View lifecycle

//viewDidLoad method declared in RootViewController.m
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
	[listOfItems addObject:@"Studera.nu"];
	[listOfItems addObject:@"Studentkortet.se"];
	[listOfItems addObject:@"lokalbokning.se"];
	[listOfItems addObject:@"csn.se"];
	[listOfItems addObject:@"utbytesstudent.se"];
	[listOfItems addObject:@"vertex.se"];
	[listOfItems addObject:@"ingenjören.se"];
	[listOfItems addObject:@"lunch.nu"];
	
	//Set the title
	self.navigationItem.title = @"Countries";
}



/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
     return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [listOfItems count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
	cell.text = cellValue;
    
    return cell;
}

- (void)closeView:(id)sender {
    self.view.alpha = 1.0;
    [[self view] setFrame:CGRectMake(0,0,320,480)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2]; 
    //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self view] cache:YES];
    [[self view] setFrame:CGRectMake(160,240,0,0)];
    self.view.alpha = 0.0;
    [UIView commitAnimations];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
   
	[listOfItems release];
	//[linkTable release];
	 [super dealloc];
	
}


@end

