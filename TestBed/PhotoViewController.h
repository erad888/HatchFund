//
//  PhotoViewController.h
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLPieChart.h"

@interface PhotoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) NSString *photoFilename;
@property (nonatomic, retain) IBOutlet DLPieChart *pieChartView;
@property (nonatomic) NSMutableArray *listOfFunds;
@property (strong, nonatomic) IBOutlet UITableView *theTableView;
@end
