//
//  NSEClient.h
//  NessieAPI
//
//  Created by Mecklenburg, William on 3/24/15.
//  Copyright (c) 2015 willmeck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SWGCustomersApi.h"
#import "SWGBranchesApi.h"
#import "SWGAtmsApi.h"
#import "SWGAccountsApi.h"


@interface NSEClient : NSObject

-(id) initWithKey:(NSString *)key;

#pragma mark account methods
- (void) getAccountForAccountId:(NSString *)accountId
                completionHandler:(void (^)(SWGAccounts* output, NSError* error))completionBlock;

- (void) getAccountsWithCompletionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;

/**
 finds accounts for the given account type ["Credit Card","Savings","Checking"] (case-sensitive)
 
 @param type the type of account ["Credit Card","Savings","Checking"] (case-sensitive)
 
 return type: NSArray of SWGAccounts
 */
- (void) getAccountsForType:(NSString *)type
          completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;

- (void) deleteAccountForId:(NSString *)identifier
          completionHandler:(void (^)(NSError* error))completionBlock;

- (void) updateAccountForId:(NSString *)identifer
             andWithRequest:(SWGAccounts_put *)request
          completionHandler:(void (^)(NSError* error))completionBlock;

- (void) addAccountForCustomer:(NSString*) customerId
                       request:(SWGAccounts_post*) body
             completionHandler:(void (^)(NSError *error))completionBlock;

- (void) getAccountsForCustomerId:(NSString*) customerId
                completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;


#pragma mark bills methods
- (void) getBillsForAccountId:(NSString *)accountId
            completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;

- (void) addBillForAccountId:(NSString *) accountId andWithRequest:(SWGBills_post *)request
           completionHandler:(void (^)(NSError* error))completionBlock;

- (void) getBillForAccountId:(NSString *) accountId
                  withBillId:(NSString *) billId
           completionHandler:(void (^)(SWGBills* output, NSError* error))completionBlock;

- (void) updateBillForAccountId:(NSString*) accountId
                     withBillId:(NSString*) billId
                    withRequest:(SWGBills_put*) request
              completionHandler:(void (^)(NSError* error))completionBlock;

- (void) removeBillForId:(NSString *)accountId
              withBillId:(NSString *)billId
       completionHandler:(void (^)(NSError* error))completionBlock;

- (void) getBillsForCustomerId:(NSString*) customerId
             completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;

-(void) getBillForBillIdWith:(NSString*) customerId
                      billId:(NSString*) billId
           completionHandler: (void (^)(SWGBills* output, NSError* error))completionBlock;


#pragma mark transactions methods
- (void) getTransactionsForAccount:(NSString*) accountId
                 completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;


- (void) addTransactionForAccountId:(NSString*) accountId
                        withRequest:(SWGTransactions_post*) request
                  completionHandler:(void (^)(NSError* error))completionBlock;

- (void) getTransactionsForAccountId:(NSString*) accountId
                    andTransactionId:(NSString*) transactionId
                   completionHandler:(void (^)(SWGTransactions *output, NSError* error))completionBlock;

- (void) updateTransactionForAccountId: (NSString*) accountId
             withTransactionId: (NSString*) transactionId
                   request: (SWGTransactions_put*) body
         completionHandler:(void (^)(NSError* error))completionBlock;

- (void) removeTransactionFromAccount:  (NSString*) accountId
                        transactionId:  (NSString*) transactionId
                    completionHandler:(void (^)(NSError* error))completionBlock;


#pragma customer methods

- (void) getCustomerByAccountId:(NSString *) accountId
              completionHandler:(void (^)(SWGCustomers* output, NSError* error))completionBlock;

- (void) getCustomersWithCompletionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;

- (void) updateCustomerWith:(NSString*) customerId
                 request:(SWGCustomers_put*) request
       completionHandler:(void (^)(NSError* error))completionBlock;

- (void) getCustomerByCustomerId:(NSString*) customerId
       completionHandler: (void (^)(SWGCustomers* output, NSError* error))completionBlock;


#pragma mark atm methods
- (void) getAtmForId:(NSString *)identifier
        completionHandler:(void (^)(SWGAtms* output, NSError* error))completionBlock;

- (void) getAtmsWithCompletionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;


#pragma mark branch methods
- (void) getBranchForId:(NSString *)branchId
               completionHandler:(void (^)(SWGBranches* output, NSError* error))completionBlock;

- (void) getBranchesWithCompletionHandler:(void (^)(NSArray* output, NSError* error))completionBlock;


@end
