#import <Foundation/Foundation.h>
#import "SWGAccounts.h"
#import "SWGAccounts_put.h"
#import "SWGVoid.h"
#import "SWGBills.h"
#import "SWGBills_post.h"
#import "SWGBills_put.h"
#import "SWGTransactions.h"
#import "SWGTransactions_post.h"
#import "SWGTransactions_put.h"
#import "SWGCustomers.h"
#import "SWGObject.h"


@interface SWGAccountsApi: NSObject

@property (nonatomic, retain) NSString *userKey;

-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGAccountsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 Find all accounts
 
 Returns all accounts
 

 

 return type: SWGAccounts*
 */
-(NSNumber*) getAccountsWithCompletionBlock :
    (void (^)(NSArray* output, NSError* error))completionBlock;
    


/**

 Find accounts by type
 
 Returns a list of account based on type
 

 
 @param type Type of accounts that need to be fetched (example: credit card)
 

 return type: SWGAccounts*
 */
-(NSNumber*) getAccountsByTypeWithCompletionBlock :(NSString*) type 
    
    completionHandler: (void (^)(NSArray* output, NSError* error))completionBlock;
    


/**

 Update an account
 
 Update an account based on id passed in
 

 
 @param accountId ID of account that needs to be updated (example: 546cd56d04783a02616859c9)
 
 @param body Account details
 

 return type: SWGVoid*
 */
-(NSNumber*) updateAccountByIdWithCompletionBlock :(NSString*) accountId 
     body:(SWGAccounts_put*) body 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Delete an account
 
 Delete an account based on id passed in
 

 
 @param accountId ID of account that needs to be deleted (example: 546cd56d04783a02616859c9)
 

 return type: SWGVoid*
 */
-(NSNumber*) deleteAccountByIdWithCompletionBlock :(NSString*) accountId 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Find all bills for a specific account
 
 Returns an account's bills based on the account ID
 

 
 @param accountId ID of account to fetch bills for (example: 546cd56d04783a02616859c9)
 

 return type: SWGBills*
 */
-(NSNumber*) getBillsWithCompletionBlock :(NSString*) accountId 
    
    completionHandler: (void (^)(NSArray* output, NSError* error))completionBlock;
    


/**

 Create a new bill
 
 Adds bill to the database
 

 
 @param accountId ID of account that needs to be attached to the created bill (example: 546cd56d04783a02616859c9)
 
 @param body Bill details
 

 return type: SWGVoid*
 */
-(NSNumber*) addBillsWithCompletionBlock :(NSString*) accountId 
     body:(SWGBills_post*) body 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Find a bill for a specific account and specific bill ID
 
 Returns a single bill based on the account ID and bill ID
 

 
 @param accountId ID of account to fetch bills for (example: 546cd56d04783a02616859c9)
 
 @param billId ID of bill to fetch bill for (example: 546cd56d04783a02616859c9)
 

 return type: SWGBills*
 */
-(NSNumber*) getBillsWithCompletionBlock :(NSString*) accountId 
     billId:(NSString*) billId 
    
    completionHandler: (void (^)(SWGBills* output, NSError* error))completionBlock;
    


/**

 Modify an existing bill
 
 Modify a bill in the database
 

 
 @param accountId ID of account that needs to be attached to the modified bill (example: 546cd56d04783a02616859c9)
 
 @param billId ID of bill that is to be modified (example: 546cd56d04783a02616859c9)
 
 @param body Bill details
 

 return type: SWGVoid*
 */
-(NSNumber*) modBillWithCompletionBlock :(NSString*) accountId 
     billId:(NSString*) billId 
     body:(SWGBills_put*) body 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Remove bill by ID
 
 Removes a bill based on ID
 

 
 @param accountId ID of account to fetch bills for (example: 546cd56d04783a02616859c9)
 
 @param billId ID of bill to fetch bill for (example: 546cd56d04783a02616859c9)
 

 return type: SWGVoid*
 */
-(NSNumber*) removeBillByIdWithCompletionBlock :(NSString*) accountId 
     billId:(NSString*) billId 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Find all transactions associated with the account
 
 Returns an transactions based on the account ID
 

 
 @param accountId ID of account to fetch transactions for (example: 546cd56d04783a02616859c9)
 

 return type: SWGTransactions*
 */
-(NSNumber*) getTransactionsWithCompletionBlock :(NSString*) accountId 
    
    completionHandler: (void (^)(NSArray* output, NSError* error))completionBlock;
    


/**

 Create a new transaction
 
 Adds transaction to the database
 

 
 @param accountId ID of account the transaction is for (example: 546cd56d04783a02616859c9)
 
 @param body Transaction details
 

 return type: SWGVoid*
 */
-(NSNumber*) addTransactionWithCompletionBlock :(NSString*) accountId 
     body:(SWGTransactions_post*) body 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Find a transaction for a specific account and specific transaction ID
 
 Returns a single transaction based on the account ID and transaction ID
 

 
 @param accountId ID of account associated with transaction (example: 546cd56d04783a02616859c9)
 
 @param transactionId ID of transaction to fetch (example: 546cd56d04783a02616859c9)
 

 return type: SWGTransactions*
 */
-(NSNumber*) getTransactionsWithCompletionBlock :(NSString*) accountId 
     transactionId:(NSString*) transactionId 
    
    completionHandler: (void (^)(SWGTransactions* output, NSError* error))completionBlock;
    


/**

 Modify an existing transaction
 
 Modify a transaction in the database
 

 
 @param accountId ID of account that needs to be attached to the modified transaction (example: 546cd56d04783a02616859c9)
 
 @param transactionId ID of transaction that is to be modified (example: 546cd56d04783a02616859c9)
 
 @param body Transaction details
 

 return type: SWGVoid*
 */
-(NSNumber*) modTransactionWithCompletionBlock :(NSString*) accountId 
     transactionId:(NSString*) transactionId 
     body:(SWGTransactions_put*) body 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Remove transaction by ID
 
 Removes a transaction based on ID
 

 
 @param accountId ID of account associated with transactions (example: 546cd56d04783a02616859c9)
 
 @param transactionId ID of transaction to delete (example: 546cd56d04783a02616859c9)
 

 return type: SWGVoid*
 */
-(NSNumber*) removeTransactionByIdWithCompletionBlock :(NSString*) accountId 
     transactionId:(NSString*) transactionId 
    
    completionHandler: (void (^)(NSError* error))completionBlock;
    


/**

 Find account by ID
 
 Returns an account based on ID
 

 
 @param _id ID of account that needs to be fetched (example: 546cd56d04783a02616859c9)
 

 return type: SWGAccounts*
 */
-(NSNumber*) getAccountByIdWithCompletionBlock :(NSString*) _id 
    
    completionHandler: (void (^)(SWGAccounts* output, NSError* error))completionBlock;
    


/**

 Find the customer for an account
 
 Returns a customer for an account based on the account's ID
 

 
 @param _id ID of account to fetch customer for (example: 546cd56d04783a02616859c9)
 

 return type: SWGCustomers*
 */
-(NSNumber*) getCustomerByAccountIdWithCompletionBlock :(NSString*) _id 
    
    completionHandler: (void (^)(SWGCustomers* output, NSError* error))completionBlock;
    



@end