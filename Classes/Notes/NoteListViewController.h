//
//  NoteListViewController.h
//  umuApp
//
//  Created by Erik Ortman on 12/15/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SwitchViewDelegate <NSObject>

- (void)showNote:(id)sender:(int)page;

@end

@interface NoteListViewController : UITableViewController {
    
    NSMutableArray *placeHolder;
    id <SwitchViewDelegate> delegate;

    
}


@property (nonatomic, retain) NSMutableArray *placeHolder;
@property (assign) id delegate;

@end
