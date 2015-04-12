//
//  CreateFundViewController.h
//  TestBed
//
//  Created by Albert Cheng on 4/12/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "FundObject.h"

@interface CreateFundViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic) NSMutableArray *listOfStocks;

@property (strong, nonatomic) IBOutlet UITableView *theTableView;

@property (weak, nonatomic) IBOutlet UITextField *nameTitleField;
@property (weak, nonatomic) IBOutlet UITextField *dropField;
@property (weak, nonatomic) IBOutlet UITextField *targetField;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

-(IBAction)createButton:(id)sender;

@end
