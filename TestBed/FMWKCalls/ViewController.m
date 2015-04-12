//
//  ViewController.m
//  FMWKCalls
//
//  Created by Mecklenburg, William on 3/28/15.
//  Copyright (c) 2015 willmeck. All rights reserved.
//

#import "ViewController.h"
#import "NessieiOSFramework.h"
#import "NSEClient.h"
#import "SWGBranchesApi.h"
#import "SWGBranches.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSEClient *client = [[NSEClient alloc] initWithKey:@"CUST5072e7193fd644e33671b231de749f53"];
    
    __block SWGAccounts *accountToDelete = nil;
    
    //SUCCESS
    [client getAccountsWithCompletionHandler:^(NSArray *output, NSError *error) {
        for (SWGAccounts *outputtedAcc in output) {
            if (![outputtedAcc._id  isEqualToString: @"5501ff438f6b904b5dad1bd8"] && ![outputtedAcc._id isEqualToString:@"5516101357e9a9d513135f2c"]) {
                if (accountToDelete == nil) {
                    accountToDelete = outputtedAcc; break;
                }
            }
        }
        [self methodsAfterAccountSet:client and:accountToDelete];
    }];
    
    //SUCCESS
    [client getAccountForAccountId:@"5501ff438f6b904b5dad1bd8" completionHandler:^(SWGAccounts *account, NSError *error){
        
    }];
    
    /*
     [client getAccountsForType:@"Savings" completionHandler:^(NSArray *array, NSError *error){
     
     }]; //404s
     */
    
    //SUCCESS probably
    SWGAccounts_put *accountsPut = [[SWGAccounts_put alloc] initWithValues:@{@"nickname":@"abc123"}];
    [client updateAccountForId:@"5501ff438f6b904b5dad1bd8" andWithRequest:accountsPut completionHandler:^(NSError *error) {
        
    }];
    
    SWGAccounts_post *addAccountForCust = [[SWGAccounts_post alloc]
                                           initWithValues:@{@"type":@"Savings",@"nickname":@"test account",@"rewards":@1000,@"balance":@5000}];
    
    //SUCCESS
    [client addAccountForCustomer:@"5501ff438f6b904b5dad1618" request:addAccountForCust completionHandler:^(NSError *error) {
        
    }];
    
    //SUCCESS
    [client getAccountsForCustomerId:@"5501ff438f6b904b5dad161a" completionHandler:^(NSArray *output, NSError *error) {
        
    }];
    
    __block SWGBills *billToDelete = nil;
    
    //SUCCESS
    [client getBillsForAccountId:@"5501ff438f6b904b5dad1bd8" completionHandler:^(NSArray *output, NSError *error) {
        for (SWGBills *tmpBill in output) {
            if (![tmpBill._id isEqualToString:@"5513742e57e9a9d513135f12"]) {
                billToDelete = tmpBill;
                break;
            }
        }
        [self methodsAfterBillSet:client and:billToDelete];
        
    }];
    
    //SUCCESS
    SWGBills_post *request = [[SWGBills_post alloc] initWithValues:@{@"status":@"pending", @"payment_amount":@50}];
    [client addBillForAccountId:@"5501ff438f6b904b5dad1bd8" andWithRequest:request completionHandler:^(NSError *error) {
        
    }];
    
    //SUCCESS
    [client getBillForAccountId:@"5501ff438f6b904b5dad1bd8" withBillId:@"5513742e57e9a9d513135f12" completionHandler:^(SWGBills *output, NSError *error){
        
    }];
    
    /*  SWGBills_put *billsPut = [[SWGBills_put alloc] initWithValues:@{@"status":@"",@"payment_date",@""}];
     [client updateBillForAccountId:@"5501ff438f6b904b5dad1bd8" withBillId:undeletableBill._id withRequest:billsPut completionHandler:^(NSError *error) {
     
     }]; Not sure about this one, ask ren about the SWGBills_put and post*/
    
    
    //SUCCESS
    [client getBillsForCustomerId:@"5501ff438f6b904b5dad161a" completionHandler:^(NSArray *output, NSError *error) {
        
    }];
    
    //SUCCESS
    [client getBillForAccountId:@"5501ff438f6b904b5dad1bd8" withBillId:@"5513742e57e9a9d513135f12" completionHandler:^(SWGBills *bill, NSError *error){
        
    }];
    
    __block SWGTransactions *transactionToModify = nil;
    __block SWGTransactions *transactionToDelete = nil;
    __block NSEClient *weakclient = nil;
    [client getTransactionsForAccount:@"5501ff438f6b904b5dad1bd8" completionHandler:^(NSArray *output, NSError *error) {
        for (SWGTransactions *transaction in output) {
            if (![transaction._id  isEqualToString: @"5516208057e9a9d513135f4a"]) {
                transactionToDelete = transaction;
            }
            else {
                transactionToModify = transaction;
            }
        }
        
        SWGTransactions_post *transactionsPost = [[SWGTransactions_post alloc] initWithValues:@{@"transaction type":@"cash",@"payee id":@"5516101357e9a9d513135f2c",@"amount":@1234}];
        
        //400 bad request
        [client addTransactionForAccountId:@"5501ff438f6b904b5dad1bd8" withRequest:transactionsPost completionHandler:^(NSError *error){
            weakclient = client;
            
            [self methodsAfterTransactionSet:weakclient and:transactionToDelete and:transactionToModify];
        }];
        
    }];
    
    
    SWGAddress *address = [[SWGAddress alloc] initWithValues:@{@"street_name":@"cats",@"street_number":@"1234",@"city":@"catville",@"state":@"VA",@"zip":@"22101"}];
    SWGCustomers_put *customersPut = [[SWGCustomers_put alloc] initWithValues:@{@"address":address}];
    [client getCustomerByAccountId:@"5501ff438f6b904b5dad1bd8" completionHandler:^(SWGCustomers *output, NSError *error) {
        
        [client updateCustomerWith:output._id request:customersPut completionHandler:^(NSError *error) {
            
        }];
    }];
    
    //SUCCESS
    [client getCustomersWithCompletionHandler:^(NSArray *output, NSError *error) {
        
    }];
    
    //SUCCESS
    [client getCustomerByCustomerId:@"5501ff438f6b904b5dad1618" completionHandler:^(SWGCustomers *output, NSError *error) {
        
    }];
    
    [client getAtmsWithCompletionHandler:^(NSArray *output, NSError *error) {
        
    }];
    
    //ERROR amountLeft is nil, languagelist is nil
    [client getAtmForId:@"5501ff438f6b904b5dad12d1" completionHandler:^(SWGAtms *output, NSError *error) {
        NSLog(@"%@",output.address.streetname);
    }];
    
    [client getBranchesWithCompletionHandler:^(NSArray *output, NSError *error) {
        
    }];
    
    [client getBranchForId:@"5501ff438f6b904b5dad1549" completionHandler:^(SWGBranches *branch, NSError *error) {
        
    }];
}

- (void) methodsAfterTransactionSet:(NSEClient *)client and:(SWGTransactions *)transactions and:(SWGTransactions *)notdeleted {
    [client removeTransactionFromAccount:@"5501ff438f6b904b5dad1bd8" transactionId:transactions._id completionHandler:^(NSError *error){
        
    }];
    
    [client getTransactionsForAccountId:@"5501ff438f6b904b5dad1bd8" andTransactionId:notdeleted._id completionHandler:^(SWGTransactions *output, NSError *error) {
        
    }];
    
    
    SWGTransactions_put *transactionsPut = [[SWGTransactions_put alloc] initWithValues:@{@"transaction type":@"cash",@"payee id":@"5516101357e9a9d513135f2c",@"amount":@5678}];
    [client updateTransactionForAccountId:@"5501ff438f6b904b5dad1bd8" withTransactionId:notdeleted._id request:transactionsPut completionHandler:^(NSError *error) {
        
    }];
}

- (void) methodsAfterAccountSet:(NSEClient *)client and:(SWGAccounts *)accountToDelete {
    //success?
    [client deleteAccountForId:accountToDelete._id completionHandler:^(NSError *error) {
        
    }];
}

- (void) methodsAfterBillSet:(NSEClient *)client and:(SWGBills *)billToDelete {
    
    [client removeBillForId:@"5501ff438f6b904b5dad1bd8" withBillId:billToDelete._id completionHandler:^(NSError *error){
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
