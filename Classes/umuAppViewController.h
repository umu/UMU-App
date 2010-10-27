//
//  umuAppViewController.h
//  umuApp
//
//  Created by Erik Ortman on 10/13/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoteViewController.h"

@interface umuAppViewController : UIViewController {
    
    UIButton *notesButton;
    NoteViewController *noteView;

}

@property (nonatomic, retain) IBOutlet UIButton *notesButton;
@property (nonatomic, retain) NoteViewController *noteView;

- (IBAction) openNotes: (id)sender;

@end

