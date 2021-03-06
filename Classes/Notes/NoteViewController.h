//
//  NoteViewController.h
//  umuApp
//
//  Created by Erik Ortman on 11/17/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CreateNoteViewController.h"
#import "NoteListViewController.h"

@interface NoteViewController : UIViewController <UIScrollViewDelegate, SwitchViewDelegate>{
    
    UINavigationItem *navigationItem;
    UIScrollView *scrollView;
    NSMutableArray *viewControllers;
    NSArray *contentList;
    UIPageControl *pageControl;
    CreateNoteViewController *createView;
    NoteListViewController *listView;
    UIToolbar *toolBar;
    BOOL pageControlUsed;
    
}

@property (nonatomic, retain) IBOutlet UINavigationItem *navigationItem;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) NSMutableArray *viewControllers;
@property (nonatomic, retain) NSArray *contentList;
@property (nonatomic, retain) CreateNoteViewController *createView;
@property (nonatomic, retain) NoteListViewController *listView;
@property (nonatomic, retain) IBOutlet UIToolbar *toolBar;

- (IBAction)changePage:(id)sender;
- (void)loadScrollViewWithPage:(int)page;
- (void)scrollViewDidScroll:(UIScrollView *)sender;
- (void)showNote:(id)sender:(int)page;

@end
