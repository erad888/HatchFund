//
//  NSEClient.m
//  NessieAPI
//
//  Created by Mecklenburg, William on 3/24/15.
//  Copyright (c) 2015 willmeck. All rights reserved.
//

#import "NSEClient.h"

SWGAccountsApi *accountsApi = nil;
SWGAtmsApi *atmsApi = nil;
SWGBranchesApi *branchApi = nil;
SWGCustomersApi *customerApi = nil;

@implementation NSEClient

-(id) initWithKey:(NSString *)key {
    self = [super init];
    accountsApi = [[SWGAccountsApi alloc] init];
    atmsApi = [[SWGAtmsApi alloc] init];
    branchApi = [[SWGBranchesApi alloc] init];
    customerApi = [[SWGCustomersApi alloc] init];
    
    branchApi.userKey = key;
    customerApi.userKey = key;
    atmsApi.userKey = key;
    accountsApi.userKey = key;
    return self;
}

#pragma mark account methods
- (void) getAccountForAccountId:(NSString *)accountId
       completionHandler:(void (^)(SWGAccounts* output, NSError* error))completionBlock {
    
    [accountsApi getAccountByIdWithCompletionBlock:accountId completionHandler:completionBlock];
}

- (void) getAccountsWithCompletionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    [accountsApi getAccountsWithCompletionBlock:completionBlock];
}

- (void) getAccountsForType:(NSString *)type
          completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    
    [accountsApi getAccountsByTypeWithCompletionBlock:type completionHandler:completionBlock];
}

- (void) deleteAccountForId:(NSString *)identifier
          completionHandler:(void (^)(NSError* error))completionBlock {
    
    [accountsApi deleteAccountByIdWithCompletionBlock:identifier completionHandler:completionBlock];
}

- (void) updateAccountForId:(NSString *)identifer
             andWithRequest:(SWGAccounts_put *)request
          completionHandler:(void (^)(NSError* error))completionBlock {
    [accountsApi updateAccountByIdWithCompletionBlock:identifer body:request completionHandler:completionBlock];
}


- (void) addAccountForCustomer:(NSString*) customerId
                       request:(SWGAccounts_post*) body
             completionHandler:(void (^)(NSError *error))completionBlock {
    [customerApi addAccountWithCompletionBlock:customerId body:body completionHandler:completionBlock];
}

- (void) getAccountsForCustomerId:(NSString*) customerId
                completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    [customerApi getAccountsByCustomerIdWithCompletionBlock:customerId completionHandler:completionBlock];
}


#pragma mark bills methods
- (void) getBillsForAccountId:(NSString *)accountId
            completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    [accountsApi getBillsWithCompletionBlock:accountId completionHandler:completionBlock];
}

- (void) addBillForAccountId:(NSString *) accountId andWithRequest:(SWGBills_post *)request
           completionHandler:(void (^)(NSError* error))completionBlock {
    [accountsApi addBillsWithCompletionBlock:accountId body:request completionHandler:completionBlock];
}

- (void) getBillForAccountId:(NSString *) accountId
                  withBillId:(NSString *) billId
           completionHandler:(void (^)(SWGBills* output, NSError* error))completionBlock {
    
    [accountsApi getBillsWithCompletionBlock:accountId billId:billId completionHandler:completionBlock];
}

- (void) updateBillForAccountId:(NSString*) accountId
                     withBillId:(NSString*) billId
                    withRequest:(SWGBills_put*) request
              completionHandler:(void (^)(NSError* error))completionBlock {
    [accountsApi modBillWithCompletionBlock:accountId billId:billId body:request completionHandler:completionBlock];
}

- (void) removeBillForId:(NSString *)accountId
              withBillId:(NSString *)billId
       completionHandler:(void (^)(NSError* error))completionBlock {
    [accountsApi removeBillByIdWithCompletionBlock:accountId billId:billId completionHandler:completionBlock];
}

- (void) getBillsForCustomerId:(NSString*) customerId
             completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    [customerApi getBillonCustomerIdWithCompletionBlock:customerId completionHandler:completionBlock];
}

-(void) getBillForBillIdWith:(NSString*) customerId
                      billId:(NSString*) billId
           completionHandler: (void (^)(SWGBills* output, NSError* error))completionBlock {
    [customerApi getBillonBillIdWithCompletionBlock:customerId billId:billId completionHandler:completionBlock];
}


#pragma mark transactions methods
- (void) getTransactionsForAccount:(NSString*) accountId
                 completionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    [accountsApi getTransactionsWithCompletionBlock:accountId completionHandler:completionBlock];
}


- (void) addTransactionForAccountId:(NSString*) accountId
                        withRequest:(SWGTransactions_post*) request
                  completionHandler:(void (^)(NSError* error))completionBlock {
    [accountsApi addTransactionWithCompletionBlock:accountId body:request completionHandler:completionBlock];
}

- (void) getTransactionsForAccountId:(NSString*) accountId
                    andTransactionId:(NSString*) transactionId
                   completionHandler:(void (^)(SWGTransactions *output, NSError* error))completionBlock {
    [accountsApi getTransactionsWithCompletionBlock:accountId transactionId:transactionId completionHandler:completionBlock];
}

- (void) updateTransactionForAccountId: (NSString*) accountId
             withTransactionId: (NSString*) transactionId
                   request: (SWGTransactions_put*) body
         completionHandler:(void (^)(NSError* error))completionBlock {
    [accountsApi modTransactionWithCompletionBlock:accountId transactionId:transactionId body:body completionHandler:completionBlock];
}

- (void) removeTransactionFromAccount:  (NSString*) accountId
                        transactionId:  (NSString*) transactionId
                    completionHandler:(void (^)(NSError* error))completionBlock {
    [accountsApi removeTransactionByIdWithCompletionBlock:accountId transactionId:transactionId completionHandler:completionBlock];
}


#pragma customer methods

- (void) getCustomerByAccountId:(NSString *) accountId
              completionHandler:(void (^)(SWGCustomers* output, NSError* error))completionBlock {
    [accountsApi getCustomerByAccountIdWithCompletionBlock:accountId completionHandler:completionBlock];
}

- (void) getCustomersWithCompletionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    [customerApi getCustomersWithCompletionBlock:completionBlock];
}

- (void) updateCustomerWith:(NSString*) customerId
                 request:(SWGCustomers_put*) request
       completionHandler:(void (^)(NSError* error))completionBlock {
    [customerApi addCustomerWithCompletionBlock:customerId body:request completionHandler:completionBlock];
}

- (void) getCustomerByCustomerId:(NSString*) customerId
               completionHandler: (void (^)(SWGCustomers* output, NSError* error))completionBlock {
    [customerApi getCustomerByIdWithCompletionBlock:customerId completionHandler:completionBlock];
}


#pragma mark atm methods
- (void) getAtmForId:(NSString *)identifier
   completionHandler:(void (^)(SWGAtms* output, NSError* error))completionBlock {
    [atmsApi getAtmByIdWithCompletionBlock:identifier completionHandler:completionBlock];
}

- (void) getAtmsWithCompletionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    [atmsApi getAtmsWithCompletionBlock:completionBlock];
}


#pragma mark branch methods
- (void) getBranchForId:(NSString *)branchId
      completionHandler:(void (^)(SWGBranches* output, NSError* error))completionBlock {
    [branchApi getBranchByIdWithCompletionBlock:branchId completionHandler:completionBlock];
}

- (void) getBranchesWithCompletionHandler:(void (^)(NSArray* output, NSError* error))completionBlock {
    [branchApi getBranchesWithCompletionBlock:completionBlock];
}

@end
