//
//  StockViewController.h
//  TestBed
//
//  Created by Albert Cheng on 4/12/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StockViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate, UIActionSheetDelegate, UITabBarControllerDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@property (nonatomic) NSMutableArray *listOfStockData;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;

@property (nonatomic) NSArray *listOfTickers;
@property (nonatomic) NSMutableArray *companyNamesArray;
@property (nonatomic) NSMutableArray *tickersArray;
@property (nonatomic) NSMutableArray *instrumentTypeArray;
@property (nonatomic) NSMutableArray *shareQuantityArray;

@property (strong, nonatomic) IBOutlet UITableView *theTableView;

- (IBAction)searchAction:(id)sender;

@end
