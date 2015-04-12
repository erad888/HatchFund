

#import <UIKit/UIKit.h>
#import "FundObject.h"

@interface MainViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (nonatomic) NSMutableArray *listOfFunds;

@property (strong, nonatomic) IBOutlet UITableView *theTableView;


@end
