//
//  NoteViewController.m
//  umuApp
//
//  Created by Erik Ortman on 11/17/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "NoteViewController.h"
#import "NoteView.h"
#import "CreateNoteViewController.h"
#import "umuAppAppDelegate.h"

static NSUInteger kNumberOfPages = 6;


@implementation NoteViewController

@synthesize navigationItem, scrollView, viewControllers, contentList, pageControl, createView, toolBar, listView;

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
    
    self.navigationItem.title = @"Anslagstavlan";
        
    UIBarButtonItem *lButton =[[UIBarButtonItem alloc] init];
    
    lButton.title= @"Stäng";
    [lButton setTarget:self];
    [lButton setAction:@selector(closeView:)]; //aMethod defined in the class
    self.navigationItem.rightBarButtonItem =lButton;
    [lButton release];
    
    UIBarButtonItem *modeButton = [[UIBarButtonItem alloc] init];
    modeButton.title= @"Lista";
    [modeButton setTarget:self];
    [modeButton setAction:@selector(showList:)];
                                  //initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                  //target:self
                                  //action:@selector(addNote:)];
    
    modeButton.style = UIBarButtonItemStyleBordered;
    self.navigationItem.leftBarButtonItem = modeButton;
    [modeButton release];
    
    UIBarButtonItem *systemItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(pressButton1:)];
    
    UIBarButtonItem *systemItem2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                 target:self
                                                                                 action:@selector(pressButton2:)];
    
    
    //Use this to put space in between your toolbox buttons
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                              target:nil
                                                                              action:nil];
    
    //Add buttons to the array
    NSArray *items = [NSArray arrayWithObjects: flexItem, systemItem1,flexItem,systemItem2,flexItem, nil];
    
    //release buttons
    [systemItem1 release];
    [systemItem2 release];
    [flexItem release];
    
    //add array of buttons to toolbar
    [toolBar setItems:items animated:NO];
    
    umuAppAppDelegate *appDelegate = (umuAppAppDelegate *)[[UIApplication sharedApplication] delegate];
        
    //ScrollView Load
    
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (unsigned i = 0; i < kNumberOfPages; i++)
    {
		[controllers addObject:[NSNull null]];
    }
    self.viewControllers = controllers;
    [controllers release];

    // a page is the width of the scroll view
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * kNumberOfPages, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
    scrollView.delegate = self;
    
    pageControl.numberOfPages = kNumberOfPages;
    pageControl.currentPage = 0;
    
    // pages are created on demand
    // load the visible page
    // load the page on either side to avoid flashes when the user starts scrolling
    //
    [self loadScrollViewWithPage:0];
    [self loadScrollViewWithPage:1];
    
    listView = [[NoteListViewController alloc] initWithNibName:@"NoteListViewController" bundle:nil];
    
    
    [super viewDidLoad];
}

- (void)closeView:(id)sender {
    /**
    self.view.alpha = 1.0;
    [[self view] setFrame:CGRectMake(0,0,320,480)];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.2]; 
    //[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:[self view] cache:YES];
    [[self view] setFrame:CGRectMake(160,240,0,0)];
    self.view.alpha = 0.0;
    [UIView commitAnimations];
     **/
     [self.view removeFromSuperview];

}

- (void)showNote:(id)sender
{
    NSLog(@"Notevy");

    UIView *list = self.listView.view;

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationBeginsFromCurrentState:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.scrollView cache:YES];
    
    //UIView *parent = self.scrollView.superview;
    
    [UIView commitAnimations];
    [list removeFromSuperview];
    [self.navigationItem.leftBarButtonItem setAction:@selector(showList:)];
    self.navigationItem.leftBarButtonItem.title = @"Lista";
    
}



- (void)showList:(id)sender
{

    
    UIView *list = self.listView.view;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationBeginsFromCurrentState:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.scrollView cache:YES];
    
    //UIView *parent = self.scrollView.superview;
    
    [UIView commitAnimations];
    [scrollView addSubview:list];
    [self.navigationItem.leftBarButtonItem setAction:@selector(showNote:)];
    self.navigationItem.leftBarButtonItem.title = @"Anslag";

     
    
}

- (void)addNote {
    createView = [[CreateNoteViewController alloc] initWithNibName:@"CreateNoteViewController" bundle:nil];
    [self presentModalViewController:self.createView animated:YES];

}

- (void)loadScrollViewWithPage:(int)page
{
    if (page < 0)
        return;
    if (page >= kNumberOfPages)
        return;
    
    // replace the placeholder if necessary
    NoteView *controller = [viewControllers objectAtIndex:page];
    if ((NSNull *)controller == [NSNull null])
    {
        controller = [[NoteView alloc] initWithNibName:@"NoteView" bundle:nil];
        [viewControllers replaceObjectAtIndex:page withObject:controller];
        [controller release];
    }
    
    // add the controller's view to the scroll view
    if (controller.view.superview == nil)
    {
        CGRect frame = scrollView.frame;
        frame.origin.x = frame.size.width * page;
        frame.origin.y = 0;
        controller.view.frame = frame;
        [scrollView addSubview:controller.view];
        NSLog(@"Lägger till view");
        NSDictionary *numberItem = [self.contentList objectAtIndex:page];
        
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    // We don't want a "feedback loop" between the UIPageControl and the scroll delegate in
    // which a scroll event generated from the user hitting the page control triggers updates from
    // the delegate method. We use a boolean to disable the delegate logic when the page control is used.
    if (pageControlUsed)
    {
        // do nothing - the scroll was initiated from the page control, not the user dragging
        return;
    }
	
    // Switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
    
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
    // A possible optimization would be to unload the views+controllers which are no longer visible
}

// At the begin of scroll dragging, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

// At the end of scroll animation, reset the boolean used when scrolls originate from the UIPageControl
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    pageControlUsed = NO;
}

- (IBAction)changePage:(id)sender
{
    int page = pageControl.currentPage;
	
    // load the visible page and the page on either side of it (to avoid flashes when the user starts scrolling)
    [self loadScrollViewWithPage:page - 1];
    [self loadScrollViewWithPage:page];
    [self loadScrollViewWithPage:page + 1];
    
	// update the scroll view to the appropriate page
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
    
	// Set the boolean used when scrolls originate from the UIPageControl. See scrollViewDidScroll: above.
    pageControlUsed = YES;
}

//Action methods for toolbar buttons:
- (void) pressButton1:(id)sender{
    //label.text = @"Add";
    [self addNote];
}
- (void) pressButton2:(id)sender{
   // label.text = @"Take Action";
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
    [pageControl release];
    [viewControllers release];
    [scrollView release];
    [toolBar release];
    [listView release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [toolBar release];
    [super dealloc];
}


@end
