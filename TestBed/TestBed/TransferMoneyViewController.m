//
//  TransferMoneyViewController.m
//  TestBed
//
//  Created by Albert Cheng on 4/11/15.
//  Copyright (c) 2015 Ably Mobile. All rights reserved.
//

#import "TransferMoneyViewController.h"
#import "SWRevealViewController.h"

@interface TransferMoneyViewController ()

@end

@implementation TransferMoneyViewController

@synthesize accountNameLabel, accountValueLabel, addButton, valueTextView, fundNewValueLabel, fundOldValueLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Transfer Money";
    NSEClient *client = [[NSEClient alloc] initWithKey:custKey];
    NSString *accountId = @"55296ad5d2053f602e731d55";
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    [self.refreshButton setTarget:self];
    [self.refreshButton setAction:@selector(refreshAction:)];
    
    //SUCCESS
    [client getAccountForAccountId:accountId completionHandler:^(SWGAccounts *account, NSError *error){
        NSLog(@"SWGAccounts: %@", account);
        accountNameLabel.text = account.nickname;
        accountValueLabel.text = [NSString stringWithFormat:@"%@", account.balance];
    }];
    
    //SUCCESS
    [client getAccountForAccountId:accountNumber completionHandler:^(SWGAccounts *account, NSError *error){
        NSLog(@"SWGAccounts: %@", account);
        fundOldValueLabel.text = [NSString stringWithFormat:@"$%@", account.balance];
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addValueAction:(UIButton *)sender
{
    NSEClient *client = [[NSEClient alloc] initWithKey:custKey];
    NSString *accountId = @"55296ad5d2053f602e731d55";
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *inputVal = [valueTextView text];
    NSNumber *transactionValue = [f numberFromString:[valueTextView text]];
    if ([inputVal doubleValue]) {
        transactionValue = [f numberFromString:[valueTextView text]];
    }
    else
        transactionValue = [NSNumber numberWithInt:0];
    SWGTransactions_post *transactionsPost = [[SWGTransactions_post alloc] initWithValues:@{@"transaction_type":@"cash",@"payee_id":accountNumber,@"amount":transactionValue}];
    
    
    [client addTransactionForAccountId:accountId withRequest:transactionsPost completionHandler:^(NSError *error) {
        NSLog(@"%@", error);
        
        PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
        testObject[@"transaction_type"] = @"cash";
        testObject[@"payee_id"] = accountNumber;
        testObject[@"amount"] = transactionValue;
        [testObject saveInBackground];
        
        NSEClient *fundClient = [[NSEClient alloc] initWithKey:custKey];
        //SUCCESS
        [fundClient getAccountForAccountId:accountId completionHandler:^(SWGAccounts *account, NSError *error){
            NSLog(@"SWGAccounts: %@", account);
            accountNameLabel.text = account.nickname;
            accountValueLabel.text = [NSString stringWithFormat:@"%@", account.balance];
        }];
        //SUCCESS
        [fundClient getAccountForAccountId:accountNumber completionHandler:^(SWGAccounts *account, NSError *error){
            NSLog(@"SWGAccounts: %@", account);
            fundNewValueLabel.text = [NSString stringWithFormat:@"$%@", account.balance];
        }];
        
    }];
}

- (void)refreshAction:(UIButton *)sender
{
    NSEClient *client = [[NSEClient alloc] initWithKey:custKey];
    NSString *accountId = @"55296ad5d2053f602e731d55";
    
    //SUCCESS
    [client getAccountForAccountId:accountId completionHandler:^(SWGAccounts *account, NSError *error){
        NSLog(@"SWGAccounts: %@", account);
        accountValueLabel.text = [NSString stringWithFormat:@"%@", account.balance];
    }];
    //SUCCESS
    [client getAccountForAccountId:accountNumber completionHandler:^(SWGAccounts *account, NSError *error){
        NSLog(@"SWGAccounts: %@", account);
        fundNewValueLabel.text = [NSString stringWithFormat:@"$%@", account.balance];
    }];
}

@end
