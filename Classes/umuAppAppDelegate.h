//
//  umuAppAppDelegate.h
//  umuApp
//
//  Created by Erik Ortman on 10/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIConnector.h"

@class umuAppViewController;

@interface umuAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	APIConnector *apiConnector;
    umuAppViewController *viewController;
    NSArray *notesArray;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet umuAppViewController *viewController;
@property (nonatomic, retain) APIConnector *apiConnector;
@property (nonatomic, retain) NSArray *notesArray;

@end

