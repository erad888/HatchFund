//
//  FundInfoViewController.h
//  TestBed
//
//  Created by Albert Cheng on 4/12/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLPieChart.h"
#import "SWRevealViewController.h"
#import "FundObject.h"

@interface FundInfoViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic) NSMutableArray *listOfFunds;

@property (strong, nonatomic) IBOutlet UITableView *theTableView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) NSString *fundNameString;

@property (nonatomic, retain) IBOutlet DLPieChart *pieChartView;

@end

