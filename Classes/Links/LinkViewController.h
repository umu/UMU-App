#import <UIKit/UIKit.h>

@interface LinkViewController : UIViewController {
	
	NSMutableArray *listOfItems;
	IBOutlet UITableView *linkTable;
	UINavigationItem *navigationItem;

	

}

@property (nonatomic, retain) NSMutableArray *listOfItems;
@property (nonatomic, retain) UITableView *linkTable;
@property (nonatomic, retain) IBOutlet UINavigationItem *navigationItem;



@end