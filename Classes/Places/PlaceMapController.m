//
//  PlaceMapController.m
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "PlaceMapController.h"
#import "APIConnector.h"
#import "UMUAnnotation.h"



@implementation PlaceMapController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	UIBarButtonItem *lButton =[[UIBarButtonItem alloc] init];
    
    lButton.title = @"Stäng";
    [lButton setTarget:self];
    [lButton setAction:@selector(closeView:)]; //aMethod defined in the class
    self.navigationItem.leftBarButtonItem = lButton;
    [lButton release];
	
	
	MKCoordinateRegion region;
	region.center.latitude = 63.820587;
	region.center.longitude = 20.306168;
	region.span.latitudeDelta = 0.0039;
	region.span.longitudeDelta = 0.0034;
	mapView.region = region;
	mapView.mapType = MKMapTypeSatellite;
	mapView.showsUserLocation = YES;
	
	APIConnector *apiConnector = [[APIConnector alloc] init];
	NSArray *places = [apiConnector getPlaces];
	
	for (id theKey in places) {
		NSLog(@"%@", theKey);
		UMUAnnotation *annotation = [[UMUAnnotation alloc] initWithDictionary:theKey];
		[mapView addAnnotation:annotation];
		[annotation release];
	}
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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
