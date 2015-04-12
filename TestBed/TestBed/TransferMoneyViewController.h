//
//  TransferMoneyViewController.h
//  TestBed
//
//  Created by Albert Cheng on 4/11/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NessieiOSFramework.h"
#import "NSEClient.h"
#import "Global.h"
#import <Parse/Parse.h>

@interface TransferMoneyViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate, UIActionSheetDelegate, UITabBarControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshButton;

@property (weak, nonatomic) IBOutlet UILabel *accountNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accountValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *fundOldValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *fundNewValueLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextView;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

- (IBAction)addValueAction:(UIButton *)sender;


@end
