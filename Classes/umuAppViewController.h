//
//  umuAppViewController.h
//  umuApp
//
//  Created by Erik Ortman on 10/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface umuAppViewController : UIViewController {
    
    UIButton *featureButton;
    UIViewController *viewController;
    UINavigationController *navigationController;

}

@property (nonatomic, retain) IBOutlet UIButton *featureButton;
@property (nonatomic, retain) UIViewController *viewController;
@property (nonatomic, retain) UINavigationController *navigationController;

- (IBAction) openView: (id)sender;

@end

