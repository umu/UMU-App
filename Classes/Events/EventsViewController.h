//
//  EventsViewController.h
//  umuApp
//
//  Created by Erik Ortman on 10/20/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EventsViewController : UIViewController {
    NSMutableArray *listOfItems;
	IBOutlet UITableView *myTable;
	UINavigationItem *navigationItem;


}
@property (nonatomic, retain) NSMutableArray *listOfItems;
@property (nonatomic, retain) UITableView *myTable;
@property (nonatomic, retain) IBOutlet UINavigationItem *navigationItem;

@end


