//
//  umuAppViewController.m
//  umuApp
//
//  Created by Erik Ortman on 10/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "umuAppViewController.h"
#import "NoteViewController.h"
#import "NewsViewController.h"
#import "PlaceMapController.h"
#import "LinkViewController.h"
#import "EventsViewController.h"


@implementation umuAppViewController

@synthesize featureButton, viewController, navigationController;



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction) openView: (id)sender {
    UIButton *button = (UIButton *)sender;
    switch ([button tag]) {
        case 0:
			viewController = [[EventsViewController alloc] initWithNibName:@"EventsViewController" bundle:nil];
            break;
        case 1:
            viewController = [[PlaceMapController alloc] initWithNibName:@"PlaceMapController" bundle:nil];
            break;
        case 2:
            viewController = [[NoteViewController alloc] initWithNibName:@"NoteViewController" bundle:nil];
            break;
        case 3:
			 viewController = [[LinkViewController alloc] initWithNibName:@"LinkViewController" bundle:nil];
            break;
        case 4:
            viewController = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
            break;
        case 5:
            break;


    }
 
    [self.view addSubview:viewController.view]; 
        
     
}




/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [featureButton release];
    [viewController release];
    [super dealloc];
}

@end
